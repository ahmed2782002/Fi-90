import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/localization/localized_text.dart';

class AuctionPair {
  const AuctionPair({
    required this.slot,
    required this.a,
    required this.b,
    required this.clues,
  });

  final String slot;
  final String a;
  final String b;
  final List<LocalizedText> clues;

  bool get coach => slot == 'CO';

  String get slotKey => slotKeyOf(slot);

  static String slotKeyOf(String slot) => switch (slot.substring(0, 2)) {
    'GK' => AppStrings.slotGoalkeeper,
    'DF' => AppStrings.slotDefence,
    'MF' => AppStrings.slotMidfield,
    'FW' => AppStrings.slotAttack,
    _ => AppStrings.slotCoach,
  };

  static const _gk = AuctionPair(
    slot: 'GK',
    a: 'navas',
    b: 'buffon',
    clues: [
      LocalizedText('حارس مرمى', 'Goalkeeper'),
      LocalizedText(
        'كسب دوري الأبطال 3 مرات',
        'Won the Champions League 3 times',
      ),
      LocalizedText('لعب في الدوري الفرنسي', 'Played in the French league'),
    ],
  );
  static const _mf1 = AuctionPair(
    slot: 'MF1',
    a: 'park',
    b: 'modric',
    clues: [
      LocalizedText('لاعب وسط', 'Midfielder'),
      LocalizedText('آسيوي', 'Asian'),
      LocalizedText('لعب في مانشستر يونايتد', 'Played for Manchester United'),
    ],
  );
  static const _mf2 = AuctionPair(
    slot: 'MF2',
    a: 'aboutrika',
    b: 'kante',
    clues: [
      LocalizedText('لاعب وسط', 'Midfielder'),
      LocalizedText('مصري', 'Egyptian'),
      LocalizedText(
        'كسب دوري أبطال أفريقيا مع الأهلي',
        'Won the CAF Champions League with Al Ahly',
      ),
    ],
  );
  static const _co = AuctionPair(
    slot: 'CO',
    a: 'guardiola',
    b: 'mourinho',
    clues: [
      LocalizedText('مدرب', 'Coach'),
      LocalizedText('إسباني', 'Spanish'),
      LocalizedText(
        'كسب الثلاثية مع فريقين مختلفين',
        'Won the treble with two different clubs',
      ),
    ],
  );
  static const _dfClues = [
    LocalizedText('مدافع', 'Defender'),
    LocalizedText('هولندي', 'Dutch'),
    LocalizedText('لعب في الدوري الإنجليزي', 'Played in the Premier League'),
  ];
  static const _fwClues = [
    LocalizedText('جناح / مهاجم', 'Winger / Forward'),
    LocalizedText('عربي', 'Arab'),
    LocalizedText('لعب في الدوري الإنجليزي', 'Played in the Premier League'),
  ];

  static const five = [
    _gk,
    AuctionPair(slot: 'DF', a: 'vandijk', b: 'ramos', clues: _dfClues),
    _mf1,
    _mf2,
    AuctionPair(slot: 'FW', a: 'salah', b: 'nunez', clues: _fwClues),
    _co,
  ];

  static const eleven = [
    _gk,
    AuctionPair(slot: 'DF1', a: 'vandijk', b: 'ramos', clues: _dfClues),
    AuctionPair(
      slot: 'DF2',
      a: 'hakimi',
      b: 'cafu',
      clues: [
        LocalizedText('ظهير أيمن', 'Right back'),
        LocalizedText('مغربي', 'Moroccan'),
        LocalizedText(
          'لعب في ريال مدريد وإنتر ميلان',
          'Played for Real Madrid and Inter',
        ),
      ],
    ),
    AuctionPair(
      slot: 'DF3',
      a: 'maldini',
      b: 'puyol',
      clues: [
        LocalizedText('مدافع', 'Defender'),
        LocalizedText('إيطالي', 'Italian'),
        LocalizedText(
          'لعب مسيرته كلها في نادي واحد',
          'Spent his whole career at one club',
        ),
      ],
    ),
    AuctionPair(
      slot: 'DF4',
      a: 'robertson',
      b: 'marcelo',
      clues: [
        LocalizedText('ظهير أيسر', 'Left back'),
        LocalizedText('اسكتلندي', 'Scottish'),
        LocalizedText(
          'كسب الدوري الإنجليزي مع ليفربول',
          'Won the Premier League with Liverpool',
        ),
      ],
    ),
    _mf1,
    _mf2,
    AuctionPair(
      slot: 'MF3',
      a: 'iniesta',
      b: 'debruyne',
      clues: [
        LocalizedText('لاعب وسط', 'Midfielder'),
        LocalizedText('إسباني', 'Spanish'),
        LocalizedText(
          'سجّل في نهائي كأس العالم',
          'Scored in a World Cup final',
        ),
      ],
    ),
    AuctionPair(slot: 'FW1', a: 'salah', b: 'nunez', clues: _fwClues),
    AuctionPair(
      slot: 'FW2',
      a: 'benzema',
      b: 'drogba',
      clues: [
        LocalizedText('مهاجم', 'Striker'),
        LocalizedText('فرنسي', 'French'),
        LocalizedText('كسب الكرة الذهبية 2022', "Won the 2022 Ballon d'Or"),
      ],
    ),
    AuctionPair(
      slot: 'FW3',
      a: 'mahrez',
      b: 'henry',
      clues: [
        LocalizedText('جناح', 'Winger'),
        LocalizedText('جزائري', 'Algerian'),
        LocalizedText(
          'كسب الدوري الإنجليزي مع ليستر',
          'Won the Premier League with Leicester',
        ),
      ],
    ),
    _co,
  ];
}
