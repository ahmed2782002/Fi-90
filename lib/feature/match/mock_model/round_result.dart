import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/feature/match/mock_model/match_mode.dart';
import 'package:flutter/material.dart';

enum MatchSide {
  me,
  opp;

  MatchSide get other => this == me ? opp : me;

  Color get fill => this == me ? AppColors.me : AppColors.op;

  Color get ink => this == me ? AppColors.meInk : AppColors.opInk;

  Color get onFill => this == me ? AppColors.meOn : AppColors.opOn;
}

class RoundResult {
  const RoundResult({
    required this.mode,
    required this.winner,
    required this.points,
    required this.detailKey,
    this.detailArgs = const [],
    this.translateArgs = false,
  });

  final MatchMode mode;
  final MatchSide? winner;
  final int points;
  final String detailKey;
  final List<String> detailArgs;
  final bool translateArgs;
}
