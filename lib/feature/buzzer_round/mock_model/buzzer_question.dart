import 'package:fii90/core/localization/localized_text.dart';

class BuzzerQuestion {
  const BuzzerQuestion({
    required this.text,
    required this.reveal,
    required this.aliases,
  });

  final LocalizedText text;
  final LocalizedText reveal;
  final List<String> aliases;

  static const mock = [
    BuzzerQuestion(
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
    BuzzerQuestion(
      text: LocalizedText(
        'مين الهدّاف التاريخي للدوري الإنجليزي؟',
        "Who is the Premier League's all-time top scorer?",
      ),
      reveal: LocalizedText('آلان شيرر — 260 هدف', 'Alan Shearer — 260 goals'),
      aliases: ['آلان شيرر', 'الان شيرر', 'شيرر', 'alan shearer', 'shearer'],
    ),
    BuzzerQuestion(
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
