import 'dart:math';

import 'package:fii90/core/localization/localized_text.dart';

// Internal only — never shown to the player.
enum BuzzerLevel { easy, medium, hard }

class BuzzerQuestion {
  const BuzzerQuestion({
    required this.level,
    required this.text,
    required this.reveal,
    required this.aliases,
  });

  final BuzzerLevel level;
  final LocalizedText text;
  final LocalizedText reveal;
  final List<String> aliases;

  // Every group of 5 holds 2 easy, 2 medium and 1 hard question, in random
  // order, with no repeats inside the round.
  static const _pattern = [
    BuzzerLevel.easy,
    BuzzerLevel.easy,
    BuzzerLevel.medium,
    BuzzerLevel.medium,
    BuzzerLevel.hard,
  ];

  static List<BuzzerQuestion> deal(int count, [Random? random]) {
    final r = random ?? Random();
    final pools = {
      for (final level in BuzzerLevel.values)
        level: mock.where((q) => q.level == level).toList()..shuffle(r),
    };
    final used = {for (final level in BuzzerLevel.values) level: 0};
    BuzzerQuestion take(BuzzerLevel level) {
      final pool = pools[level]!;
      final i = used[level]!;
      used[level] = i + 1;
      return pool[i % pool.length];
    }

    final out = <BuzzerQuestion>[];
    while (out.length < count) {
      out.addAll([for (final level in _pattern) take(level)]..shuffle(r));
    }
    return out.take(count).toList();
  }

  static const mock = [
    // Easy
    BuzzerQuestion(
      level: BuzzerLevel.easy,
      text: LocalizedText(
        'من هو المنتخب الفائز بكأس العالم 2022؟',
        'Which national team won the 2022 World Cup?',
      ),
      reveal: LocalizedText('الأرجنتين', 'Argentina'),
      aliases: ['الأرجنتين', 'ارجنتين', 'منتخب الأرجنتين', 'argentina'],
    ),
    BuzzerQuestion(
      level: BuzzerLevel.easy,
      text: LocalizedText(
        'من هو الهداف التاريخي لمنتخب مصر؟',
        "Who is Egypt's all-time top scorer?",
      ),
      reveal: LocalizedText('حسام حسن', 'Hossam Hassan'),
      aliases: ['حسام حسن', 'حسام', 'hossam hassan', 'hossam'],
    ),
    BuzzerQuestion(
      level: BuzzerLevel.easy,
      text: LocalizedText(
        'كم عدد اللاعبين في فريق كرة القدم داخل الملعب؟',
        'How many players does a football team have on the pitch?',
      ),
      reveal: LocalizedText('11 لاعبًا', '11 players'),
      aliases: ['11', '١١', 'احدى عشر', 'احد عشر', 'حداشر', 'eleven'],
    ),
    BuzzerQuestion(
      level: BuzzerLevel.easy,
      text: LocalizedText(
        'من هو النادي الذي يُلقب بالشياطين الحمر في إنجلترا؟',
        'Which English club is nicknamed the Red Devils?',
      ),
      reveal: LocalizedText('مانشستر يونايتد', 'Manchester United'),
      aliases: [
        'مانشستر يونايتد',
        'مانشيستر يونايتد',
        'يونايتد',
        'مان يونايتد',
        'manchester united',
        'man united',
        'man utd',
        'united',
      ],
    ),
    BuzzerQuestion(
      level: BuzzerLevel.easy,
      text: LocalizedText(
        'من هو اللاعب البرتغالي الشهير الملقب بـ CR7؟',
        'Which famous Portuguese player is nicknamed CR7?',
      ),
      reveal: LocalizedText('كريستيانو رونالدو', 'Cristiano Ronaldo'),
      aliases: [
        'كريستيانو رونالدو',
        'رونالدو',
        'كريستيانو',
        'cristiano ronaldo',
        'ronaldo',
        'cristiano',
      ],
    ),
    BuzzerQuestion(
      level: BuzzerLevel.easy,
      text: LocalizedText(
        'في أي دولة أُقيمت بطولة كأس العالم 2018؟',
        'Which country hosted the 2018 World Cup?',
      ),
      reveal: LocalizedText('روسيا', 'Russia'),
      aliases: ['روسيا', 'russia'],
    ),
    BuzzerQuestion(
      level: BuzzerLevel.easy,
      text: LocalizedText(
        'ما هو النادي الأكثر تتويجًا بالدوري المصري؟',
        'Which club has won the Egyptian league the most times?',
      ),
      reveal: LocalizedText('الأهلي', 'Al Ahly'),
      aliases: ['الأهلي', 'اهلي', 'النادي الأهلي', 'al ahly', 'ahly'],
    ),
    BuzzerQuestion(
      level: BuzzerLevel.easy,
      text: LocalizedText(
        'مين الهدّاف التاريخي لدوري أبطال أوروبا؟',
        "Who is the Champions League's all-time top scorer?",
      ),
      reveal: LocalizedText(
        'كريستيانو رونالدو — 140 هدف',
        'Cristiano Ronaldo — 140 goals',
      ),
      aliases: [
        'كريستيانو رونالدو',
        'رونالدو',
        'كريستيانو',
        'cristiano ronaldo',
        'ronaldo',
        'cr7',
      ],
    ),
    BuzzerQuestion(
      level: BuzzerLevel.easy,
      text: LocalizedText(
        'مين اللاعب اللي كسب الكرة الذهبية 8 مرات؟',
        "Which player won the Ballon d'Or 8 times?",
      ),
      reveal: LocalizedText(
        'ليونيل ميسي — 8 كرات ذهبية',
        "Lionel Messi — 8 Ballons d'Or",
      ),
      aliases: ['ليونيل ميسي', 'ميسي', 'messi', 'lionel messi'],
    ),

    // Medium
    BuzzerQuestion(
      level: BuzzerLevel.medium,
      text: LocalizedText(
        'من هو أول منتخب أفريقي وصل إلى ربع نهائي كأس العالم؟',
        'Which was the first African team to reach a World Cup quarter-final?',
      ),
      reveal: LocalizedText('الكاميرون — 1990', 'Cameroon — 1990'),
      aliases: ['الكاميرون', 'كاميرون', 'cameroon'],
    ),
    BuzzerQuestion(
      level: BuzzerLevel.medium,
      text: LocalizedText(
        'من هو صاحب أسرع هدف في تاريخ كأس العالم؟',
        'Who scored the fastest goal in World Cup history?',
      ),
      reveal: LocalizedText(
        'هاكان شوكور — 11 ثانية',
        'Hakan Şükür — 11 seconds',
      ),
      aliases: [
        'هاكان شوكور',
        'هاكان سوكور',
        'شوكور',
        'هاكان',
        'hakan sukur',
        'hakan şükür',
        'sukur',
        'hakan',
      ],
    ),
    BuzzerQuestion(
      level: BuzzerLevel.medium,
      text: LocalizedText(
        'من فاز بجائزة الحذاء الذهبي في كأس العالم 2002؟',
        'Who won the Golden Boot at the 2002 World Cup?',
      ),
      reveal: LocalizedText(
        'رونالدو البرازيلي — 8 أهداف',
        'Ronaldo (Brazil) — 8 goals',
      ),
      aliases: [
        'رونالدو البرازيلي',
        'رونالدو',
        'رونالدو نازاريو',
        'الظاهرة',
        'ronaldo',
        'ronaldo nazario',
        'r9',
      ],
    ),
    BuzzerQuestion(
      level: BuzzerLevel.medium,
      text: LocalizedText(
        'من سجل هدف الفوز لإسبانيا في نهائي كأس العالم 2010؟',
        "Who scored Spain's winning goal in the 2010 World Cup final?",
      ),
      reveal: LocalizedText('أندريس إنييستا', 'Andrés Iniesta'),
      aliases: [
        'أندريس إنييستا',
        'انيستا',
        'إنييستا',
        'اينيستا',
        'andres iniesta',
        'iniesta',
      ],
    ),
    BuzzerQuestion(
      level: BuzzerLevel.medium,
      text: LocalizedText(
        'ما هو النادي الذي فاز بدوري أبطال أوروبا عام 2004؟',
        'Which club won the Champions League in 2004?',
      ),
      reveal: LocalizedText('بورتو البرتغالي', 'FC Porto'),
      aliases: ['بورتو', 'بورتو البرتغالي', 'porto', 'fc porto'],
    ),
    BuzzerQuestion(
      level: BuzzerLevel.medium,
      text: LocalizedText(
        'من هو المدرب الذي قاد اليونان للفوز ببطولة يورو 2004؟',
        'Which coach led Greece to the Euro 2004 title?',
      ),
      reveal: LocalizedText('أوتو ريهاجل', 'Otto Rehhagel'),
      aliases: [
        'أوتو ريهاجل',
        'ريهاجل',
        'ريهاغل',
        'اوتو ريهاغل',
        'otto rehhagel',
        'rehhagel',
      ],
    ),
    BuzzerQuestion(
      level: BuzzerLevel.medium,
      text: LocalizedText(
        'من هو اللاعب الذي سجل هدف الفوز في نهائي دوري أبطال أوروبا 2014؟',
        'Who scored the winning goal in the 2014 Champions League final?',
      ),
      reveal: LocalizedText('جاريث بيل', 'Gareth Bale'),
      aliases: ['جاريث بيل', 'غاريث بيل', 'بيل', 'gareth bale', 'bale'],
    ),
    BuzzerQuestion(
      level: BuzzerLevel.medium,
      text: LocalizedText(
        'من هو هدّاف كأس العالم 2022 في قطر؟',
        'Who was the top scorer of the 2022 World Cup in Qatar?',
      ),
      reveal: LocalizedText(
        'كيليان مبابي — 8 أهداف',
        'Kylian Mbappé — 8 goals',
      ),
      aliases: ['كيليان مبابي', 'مبابي', 'كيليان', 'mbappe', 'kylian mbappe'],
    ),
    BuzzerQuestion(
      level: BuzzerLevel.medium,
      text: LocalizedText(
        'مين الهدّاف التاريخي للدوري الإنجليزي؟',
        "Who is the Premier League's all-time top scorer?",
      ),
      reveal: LocalizedText('آلان شيرر — 260 هدف', 'Alan Shearer — 260 goals'),
      aliases: ['آلان شيرر', 'الان شيرر', 'شيرر', 'alan shearer', 'shearer'],
    ),

    // Hard
    BuzzerQuestion(
      level: BuzzerLevel.hard,
      text: LocalizedText(
        'من هو أول لاعب عربي يفوز بدوري أبطال أوروبا؟',
        'Who was the first Arab player to win the European Cup?',
      ),
      reveal: LocalizedText(
        'رابح ماجر — بورتو 1987',
        'Rabah Madjer — Porto 1987',
      ),
      aliases: ['رابح ماجر', 'ماجر', 'rabah madjer', 'madjer'],
    ),
    BuzzerQuestion(
      level: BuzzerLevel.hard,
      text: LocalizedText(
        'من هو اللاعب الوحيد الذي فاز بكأس العالم 3 مرات كلاعب؟',
        'Who is the only player to win the World Cup 3 times?',
      ),
      reveal: LocalizedText(
        'بيليه — 1958، 1962، 1970',
        'Pelé — 1958, 1962, 1970',
      ),
      aliases: ['بيليه', 'بيلي', 'pele', 'pelé'],
    ),
    BuzzerQuestion(
      level: BuzzerLevel.hard,
      text: LocalizedText(
        'من هو الحارس الذي تصدى لركلة جزاء زيدان الشهيرة في نهائي كأس العالم 2006؟',
        "Which goalkeeper saved Zidane's famous penalty in the 2006 World Cup final?",
      ),
      reveal: LocalizedText(
        'لم يتصدَّ لها أحد — زيدان سجلها بطريقة بانينكا',
        'Nobody — Zidane scored it with a Panenka',
      ),
      aliases: [
        'لا أحد',
        'ولا حد',
        'محدش',
        'ماحدش',
        'لم يتصدى لها أحد',
        'nobody',
        'no one',
        'none',
      ],
    ),
    BuzzerQuestion(
      level: BuzzerLevel.hard,
      text: LocalizedText(
        'من سجل هدف مانشستر يونايتد الثاني في نهائي دوري أبطال أوروبا 1999؟',
        "Who scored Manchester United's second goal in the 1999 Champions League final?",
      ),
      reveal: LocalizedText('أولي جونار سولشاير', 'Ole Gunnar Solskjær'),
      aliases: [
        'أولي جونار سولشاير',
        'سولشاير',
        'سولسكاير',
        'أولي جونار',
        'ole gunnar solskjaer',
        'solskjaer',
        'solskjær',
      ],
    ),
    BuzzerQuestion(
      level: BuzzerLevel.hard,
      text: LocalizedText(
        'من هو أول لاعب أفريقي يفوز بالكرة الذهبية؟',
        "Who was the first African player to win the Ballon d'Or?",
      ),
      reveal: LocalizedText('جورج ويا — 1995', 'George Weah — 1995'),
      aliases: ['جورج ويا', 'ويا', 'george weah', 'weah'],
    ),
    BuzzerQuestion(
      level: BuzzerLevel.hard,
      text: LocalizedText(
        'من سجل هدف الفوز لبرشلونة في نهائي دوري أبطال أوروبا 2006؟',
        "Who scored Barcelona's winning goal in the 2006 Champions League final?",
      ),
      reveal: LocalizedText('جوليانو بيليتي', 'Juliano Belletti'),
      aliases: [
        'جوليانو بيليتي',
        'بيليتي',
        'بليتي',
        'juliano belletti',
        'belletti',
      ],
    ),
    BuzzerQuestion(
      level: BuzzerLevel.hard,
      text: LocalizedText(
        'مين مدرب إسبانيا اللي كسب كأس العالم 2010؟',
        'Who coached Spain to the 2010 World Cup title?',
      ),
      reveal: LocalizedText('فيسنتي ديل بوسكي', 'Vicente del Bosque'),
      aliases: [
        'فيسنتي ديل بوسكي',
        'ديل بوسكي',
        'بوسكي',
        'del bosque',
        'vicente del bosque',
      ],
    ),
  ];
}
