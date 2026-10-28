import 'dart:math';

import 'package:fii90/feature/auction_round/mock_model/auction_player.dart';
import 'package:fii90/feature/auction_round/presentation/view_model/auction_state.dart';
import 'package:fii90/feature/match/mock_model/round_result.dart';

class MatchSimulator {
  MatchSimulator(this._random);

  final Random _random;

  static AuctionPlayer _player(String key) => AuctionPlayer.all[key]!;

  double _avg(Iterable<int> values) =>
      values.isEmpty ? 0 : values.reduce((a, b) => a + b) / values.length;

  ({
    int att,
    int def,
    AuctionPlayer gk,
    AuctionPlayer df,
    List<AuctionPlayer> mfs,
    List<AuctionPlayer> fws,
  })
  power(Map<String, Signing> team) {
    List<AuctionPlayer> group(String prefix) {
      final list = [
        for (final e in team.entries)
          if (e.key.startsWith(prefix)) _player(e.value.player),
      ];
      return list.isEmpty ? [_player('park')] : list;
    }

    final gk = team['GK'] == null
        ? _player('park')
        : _player(team['GK']!.player);
    final co = team['CO'] == null
        ? _player('park')
        : _player(team['CO']!.player);
    final dfs = group('DF'), mfs = group('MF'), fws = group('FW');
    final att =
        .45 * _avg(fws.expand((f) => [f.stats[0], f.stats[1], f.stats[3]])) +
        .35 * _avg(mfs.expand((m) => [m.stats[2], m.stats[3]])) +
        .2 * co.stats[1];
    final def =
        .4 * gk.rating +
        .35 * _avg(dfs.expand((d) => [d.stats[4], d.stats[5]])) +
        .1 * _avg(mfs.map((m) => m.stats[4])) +
        .15 * co.stats[2];
    return (
      att: att.round(),
      def: def.round(),
      gk: gk,
      df: dfs.first,
      mfs: mfs,
      fws: fws,
    );
  }

  SimResult simulate(Map<String, Signing> me, Map<String, Signing> opp) {
    final a = power(me), b = power(opp);
    final events = <MatchEvent>[];
    var gm = 0, go = 0;
    for (var k = 0; k < 9; k++) {
      for (final (side, x, y) in [
        (MatchSide.me, a, b),
        (MatchSide.opp, b, a),
      ]) {
        final p = (.17 + (x.att - y.def) / 45).clamp(.06, .4);
        final r = _random.nextDouble();
        final minute = k * 10 + 1 + _random.nextInt(9);
        if (r < p) {
          final pool = [
            ...x.fws,
            ...x.fws,
            ...x.fws,
            ...x.fws,
            ...x.fws,
            ...x.mfs,
            ...x.mfs,
            x.df,
          ];
          final scorer = pool[_random.nextInt(pool.length)];
          events.add((
            minute: minute,
            side: side,
            goal: true,
            who: scorer.short,
            against: null,
          ));
          side == MatchSide.me ? gm++ : go++;
        } else if (r < p + .14) {
          final shooter = x.fws[_random.nextInt(x.fws.length)];
          events.add((
            minute: minute,
            side: side.other,
            goal: false,
            who: y.gk.short,
            against: shooter.short,
          ));
        }
      }
    }
    events.sort((e1, e2) => e1.minute.compareTo(e2.minute));
    ({int me, int opp})? pens;
    if (gm == go) {
      final meWins =
          _random.nextDouble() < .5 + (a.gk.rating - b.gk.rating) / 50;
      final low = 3 + _random.nextInt(2);
      pens = meWins ? (me: low + 1, opp: low) : (me: low, opp: low + 1);
    }
    final winner = gm > go
        ? MatchSide.me
        : go > gm
        ? MatchSide.opp
        : pens!.me > pens.opp
        ? MatchSide.me
        : MatchSide.opp;
    return (
      events: events,
      goalsMe: gm,
      goalsOpp: go,
      penalties: pens,
      winner: winner,
      me: (att: a.att, def: a.def),
      opp: (att: b.att, def: b.def),
    );
  }
}
