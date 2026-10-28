import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/localization/localized_text.dart';

class BankQuestion {
  const BankQuestion(this.text, this.answer, this.level);

  final LocalizedText text;
  final LocalizedText answer;
  final int level;

  String get levelKey => switch (level) {
    1 => AppStrings.levelEasy,
    2 => AppStrings.levelMedium,
    _ => AppStrings.levelHard,
  };

  static const ladder = [1, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096];

  static const mock = [
    [
      BankQuestion(
        LocalizedText(
          'كام لاعب لكل فريق جوه الملعب؟',
          'How many players per team are on the pitch?',
        ),
        LocalizedText('11', '11'),
        1,
      ),
      BankQuestion(
        LocalizedText(
          'كأس العالم 2022 اتلعب فين؟',
          'Where was the 2022 World Cup played?',
        ),
        LocalizedText('قطر', 'Qatar'),
        1,
      ),
      BankQuestion(
        LocalizedText(
          'مين كسب كأس العالم 2022؟',
          'Who won the 2022 World Cup?',
        ),
        LocalizedText('الأرجنتين', 'Argentina'),
        1,
      ),
      BankQuestion(
        LocalizedText(
          'محمد صلاح لعب لأنهي نادي إيطالي قبل ليفربول؟',
          'Which Italian club did Salah play for before Liverpool?',
        ),
        LocalizedText('روما', 'Roma'),
        2,
      ),
      BankQuestion(
        LocalizedText(
          'مين الهداف التاريخي لكأس العالم؟',
          "Who is the World Cup's all-time top scorer?",
        ),
        LocalizedText('ميروسلاف كلوزه (16 هدف)', 'Miroslav Klose (16 goals)'),
        3,
      ),
      BankQuestion(
        LocalizedText(
          'أول كأس عالم اتلعب سنة كام؟',
          'When was the first World Cup played?',
        ),
        LocalizedText('1930', '1930'),
        3,
      ),
      BankQuestion(
        LocalizedText('مين كسب أول كأس عالم؟', 'Who won the first World Cup?'),
        LocalizedText('أوروجواي', 'Uruguay'),
        3,
      ),
      BankQuestion(
        LocalizedText(
          'مصر كسبت كأس الأمم الأفريقية كام مرة؟',
          'How many AFCON titles has Egypt won?',
        ),
        LocalizedText('7 مرات', '7 times'),
        3,
      ),
      BankQuestion(
        LocalizedText('الشوط الواحد كام دقيقة؟', 'How long is one half?'),
        LocalizedText('45 دقيقة', '45 minutes'),
        2,
      ),
      BankQuestion(
        LocalizedText(
          'مين اللاعب اللي لقبه «الظاهرة»؟',
          'Which player is nicknamed "The Phenomenon"?',
        ),
        LocalizedText('رونالدو البرازيلي', 'Ronaldo Nazário'),
        2,
      ),
      BankQuestion(
        LocalizedText(
          'الكارت اللي بيطرد اللاعب لونه إيه؟',
          'What colour is the card that sends a player off?',
        ),
        LocalizedText('أحمر', 'Red'),
        1,
      ),
      BankQuestion(
        LocalizedText('ميسي من أنهي بلد؟', 'Which country is Messi from?'),
        LocalizedText('الأرجنتين', 'Argentina'),
        1,
      ),
    ],
    [
      BankQuestion(
        LocalizedText(
          'الماتش العادي كام دقيقة؟',
          'How long is a regular match?',
        ),
        LocalizedText('90 دقيقة', '90 minutes'),
        1,
      ),
      BankQuestion(
        LocalizedText(
          'كريستيانو رونالدو من أنهي بلد؟',
          'Which country is Cristiano Ronaldo from?',
        ),
        LocalizedText('البرتغال', 'Portugal'),
        1,
      ),
      BankQuestion(
        LocalizedText(
          'مين كسب كأس العالم 2018؟',
          'Who won the 2018 World Cup?',
        ),
        LocalizedText('فرنسا', 'France'),
        1,
      ),
      BankQuestion(
        LocalizedText(
          'أنهي نادي إنجليزي لقبه «الشياطين الحمر»؟',
          'Which English club is nicknamed "The Red Devils"?',
        ),
        LocalizedText('مانشستر يونايتد', 'Manchester United'),
        2,
      ),
      BankQuestion(
        LocalizedText(
          'أكتر منتخب كسب كأس العالم؟',
          'Which nation has won the most World Cups?',
        ),
        LocalizedText('البرازيل (5 مرات)', 'Brazil (5 times)'),
        3,
      ),
      BankQuestion(
        LocalizedText(
          'مين المدرب اللي كسب الدوري الإنجليزي مع ليستر سيتي 2016؟',
          'Who managed Leicester City to the 2016 title?',
        ),
        LocalizedText('كلاوديو رانييري', 'Claudio Ranieri'),
        3,
      ),
      BankQuestion(
        LocalizedText(
          'كأس العالم 1994 اتلعب فين؟',
          'Where was the 1994 World Cup played?',
        ),
        LocalizedText('أمريكا', 'USA'),
        3,
      ),
      BankQuestion(
        LocalizedText(
          'مين أول لاعب أفريقي يكسب الكرة الذهبية؟',
          "Who was the first African to win the Ballon d'Or?",
        ),
        LocalizedText('جورج وايا', 'George Weah'),
        3,
      ),
      BankQuestion(
        LocalizedText(
          'ضربة الجزاء من على بعد كام متر؟',
          'How far is the penalty spot?',
        ),
        LocalizedText('11 متر', '11 metres'),
        2,
      ),
      BankQuestion(
        LocalizedText(
          'نادي يوفنتوس من أنهي مدينة؟',
          'Which city is Juventus from?',
        ),
        LocalizedText('تورينو', 'Turin'),
        2,
      ),
      BankQuestion(
        LocalizedText(
          'الحكم بيطلّع كارت لونه إيه للإنذار؟',
          'What colour card is shown for a caution?',
        ),
        LocalizedText('أصفر', 'Yellow'),
        1,
      ),
      BankQuestion(
        LocalizedText('نيمار من أنهي بلد؟', 'Which country is Neymar from?'),
        LocalizedText('البرازيل', 'Brazil'),
        1,
      ),
    ],
  ];
}
