import 'package:fii90/core/localization/localized_text.dart';

class LineupPlayer {
  const LineupPlayer({
    required this.key,
    required this.name,
    required this.short,
    required this.aliases,
    required this.back,
    required this.x,
  });

  final String key;
  final LocalizedText name;
  final LocalizedText short;
  final List<String> aliases;
  final bool back;
  final double x;

  static const photoUrl =
      'https://commons.wikimedia.org/wiki/Special:FilePath/Chelsea_FC_2012_Club_World_Cup_Final_starting_XI.jpg?width=1200';
  static const caption = LocalizedText(
    'تشيلسي · قبل نهائي كأس العالم للأندية 2012',
    'Chelsea · before the 2012 Club World Cup final',
  );

  static LineupPlayer byKey(String key) => mock.firstWhere((p) => p.key == key);

  static const mock = [
    LineupPlayer(
      key: 'luiz',
      name: LocalizedText('ديفيد لويز', 'David Luiz'),
      short: LocalizedText('لويز', 'Luiz'),
      aliases: ['لويز', 'ديفيدلويز', 'luiz', 'davidluiz'],
      back: true,
      x: .26,
    ),
    LineupPlayer(
      key: 'ivanovic',
      name: LocalizedText('برانيسلاف إيفانوفيتش', 'Branislav Ivanović'),
      short: LocalizedText('إيفانوفيتش', 'Ivanović'),
      aliases: ['ايفانوفيتش', 'ايفانوفيش', 'ivanovic'],
      back: true,
      x: .36,
    ),
    LineupPlayer(
      key: 'cech',
      name: LocalizedText('بيتر تشيك', 'Petr Čech'),
      short: LocalizedText('تشيك', 'Čech'),
      aliases: ['تشيك', 'تشك', 'cech'],
      back: true,
      x: .45,
    ),
    LineupPlayer(
      key: 'cahill',
      name: LocalizedText('جاري كاهيل', 'Gary Cahill'),
      short: LocalizedText('كاهيل', 'Cahill'),
      aliases: ['كاهيل', 'cahill'],
      back: true,
      x: .55,
    ),
    LineupPlayer(
      key: 'lampard',
      name: LocalizedText('فرانك لامبارد', 'Frank Lampard'),
      short: LocalizedText('لامبارد', 'Lampard'),
      aliases: ['لامبارد', 'lampard'],
      back: true,
      x: .65,
    ),
    LineupPlayer(
      key: 'torres',
      name: LocalizedText('فرناندو توريس', 'Fernando Torres'),
      short: LocalizedText('توريس', 'Torres'),
      aliases: ['توريس', 'torres'],
      back: true,
      x: .75,
    ),
    LineupPlayer(
      key: 'mata',
      name: LocalizedText('خوان ماتا', 'Juan Mata'),
      short: LocalizedText('ماتا', 'Mata'),
      aliases: ['ماتا', 'mata'],
      back: false,
      x: .22,
    ),
    LineupPlayer(
      key: 'moses',
      name: LocalizedText('فيكتور موزس', 'Victor Moses'),
      short: LocalizedText('موزس', 'Moses'),
      aliases: ['موزس', 'موسيس', 'موسى', 'moses'],
      back: false,
      x: .36,
    ),
    LineupPlayer(
      key: 'cole',
      name: LocalizedText('آشلي كول', 'Ashley Cole'),
      short: LocalizedText('كول', 'Cole'),
      aliases: ['كول', 'اشليكول', 'cole'],
      back: false,
      x: .50,
    ),
    LineupPlayer(
      key: 'ramires',
      name: LocalizedText('راميريس', 'Ramires'),
      short: LocalizedText('راميريس', 'Ramires'),
      aliases: ['راميريس', 'راميرز', 'ramires'],
      back: false,
      x: .63,
    ),
    LineupPlayer(
      key: 'hazard',
      name: LocalizedText('إيدين هازارد', 'Eden Hazard'),
      short: LocalizedText('هازارد', 'Hazard'),
      aliases: ['هازارد', 'ازار', 'هزارد', 'hazard'],
      back: false,
      x: .77,
    ),
  ];
}
