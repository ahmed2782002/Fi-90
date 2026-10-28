import 'package:fii90/core/localization/localized_text.dart';

class TriviaQuestion {
  const TriviaQuestion({
    required this.text,
    required this.answers,
    required this.wrong,
  });

  final LocalizedText text;
  final List<({LocalizedText name, List<String> aliases})> answers;
  final List<LocalizedText> wrong;

  List<List<String>> get bank => [
    for (final a in answers) [a.name.ar, a.name.en, ...a.aliases],
  ];

  static const mock = [
    TriviaQuestion(
      text: LocalizedText(
        'اذكر لاعبين سجّلوا في دوري أبطال أوروبا',
        'Name players who scored in the Champions League',
      ),
      answers: [
        (
          name: LocalizedText('محمد صلاح', 'Mohamed Salah'),
          aliases: ['صلاح', 'mohammed salah', 'salah'],
        ),
        (
          name: LocalizedText('ليونيل ميسي', 'Lionel Messi'),
          aliases: ['ميسي', 'messi'],
        ),
        (
          name: LocalizedText('كريستيانو رونالدو', 'Cristiano Ronaldo'),
          aliases: ['رونالدو', 'ronaldo', 'cr7'],
        ),
        (
          name: LocalizedText('كريم بنزيما', 'Karim Benzema'),
          aliases: ['بنزيما', 'benzema'],
        ),
        (
          name: LocalizedText('روبرت ليفاندوفسكي', 'Robert Lewandowski'),
          aliases: ['ليفاندوفسكي', 'lewandowski'],
        ),
        (
          name: LocalizedText('كيليان مبابي', 'Kylian Mbappé'),
          aliases: ['مبابي', 'mbappe', 'kylian mbappe'],
        ),
        (
          name: LocalizedText('إرلينغ هالاند', 'Erling Haaland'),
          aliases: ['هالاند', 'haaland'],
        ),
        (
          name: LocalizedText('ديدييه دروغبا', 'Didier Drogba'),
          aliases: ['دروغبا', 'دروجبا', 'drogba'],
        ),
        (name: LocalizedText('راؤول', 'Raúl'), aliases: ['raul']),
        (name: LocalizedText('كاكا', 'Kaká'), aliases: ['kaka']),
        (name: LocalizedText('نيمار', 'Neymar'), aliases: ['neymar']),
        (
          name: LocalizedText('لويس سواريز', 'Luis Suárez'),
          aliases: ['سواريز', 'suarez', 'luis suarez'],
        ),
        (
          name: LocalizedText('توماس مولر', 'Thomas Müller'),
          aliases: ['مولر', 'muller', 'mueller', 'thomas muller'],
        ),
        (
          name: LocalizedText('فيليبو إنزاغي', 'Filippo Inzaghi'),
          aliases: ['إنزاغي', 'انزاجي', 'inzaghi'],
        ),
        (
          name: LocalizedText('تييري هنري', 'Thierry Henry'),
          aliases: ['هنري', 'henry'],
        ),
        (
          name: LocalizedText('أندريه شيفتشينكو', 'Andriy Shevchenko'),
          aliases: ['شيفتشينكو', 'shevchenko'],
        ),
        (
          name: LocalizedText('واين روني', 'Wayne Rooney'),
          aliases: ['روني', 'rooney'],
        ),
        (
          name: LocalizedText('أنطوان غريزمان', 'Antoine Griezmann'),
          aliases: ['غريزمان', 'جريزمان', 'griezmann'],
        ),
        (
          name: LocalizedText('هاري كين', 'Harry Kane'),
          aliases: ['كين', 'kane'],
        ),
        (
          name: LocalizedText('فينيسيوس جونيور', 'Vinícius Júnior'),
          aliases: ['فينيسيوس', 'vinicius'],
        ),
        (
          name: LocalizedText('سيرجيو راموس', 'Sergio Ramos'),
          aliases: ['راموس', 'ramos'],
        ),
        (
          name: LocalizedText('ساديو ماني', 'Sadio Mané'),
          aliases: ['ماني', 'mane'],
        ),
      ],
      wrong: [
        LocalizedText('جانلويجي بوفون', 'Gianluigi Buffon'),
        LocalizedText('إيكر كاسياس', 'Iker Casillas'),
        LocalizedText('بيتر شمايكل', 'Peter Schmeichel'),
      ],
    ),
    TriviaQuestion(
      text: LocalizedText(
        'اذكر أندية لعب فيها زلاتان إبراهيموفيتش',
        'Name clubs Zlatan Ibrahimović played for',
      ),
      answers: [
        (name: LocalizedText('مالمو', 'Malmö'), aliases: ['malmo']),
        (name: LocalizedText('أياكس', 'Ajax'), aliases: ['اياكس', 'ajax']),
        (name: LocalizedText('يوفنتوس', 'Juventus'), aliases: ['juve']),
        (
          name: LocalizedText('إنتر ميلان', 'Inter Milan'),
          aliases: ['انتر', 'إنتر', 'inter'],
        ),
        (name: LocalizedText('برشلونة', 'Barcelona'), aliases: ['barca']),
        (
          name: LocalizedText('ميلان', 'AC Milan'),
          aliases: ['إيه سي ميلان', 'milan'],
        ),
        (
          name: LocalizedText('باريس سان جيرمان', 'Paris Saint-Germain'),
          aliases: ['باريس', 'psg', 'paris'],
        ),
        (
          name: LocalizedText('مانشستر يونايتد', 'Manchester United'),
          aliases: ['مانشستر', 'united', 'man utd'],
        ),
        (
          name: LocalizedText('لوس أنجلوس جالاكسي', 'LA Galaxy'),
          aliases: ['جالاكسي', 'galaxy'],
        ),
      ],
      wrong: [
        LocalizedText('ريال مدريد', 'Real Madrid'),
        LocalizedText('أرسنال', 'Arsenal'),
        LocalizedText('بايرن ميونخ', 'Bayern Munich'),
      ],
    ),
    TriviaQuestion(
      text: LocalizedText(
        'اذكر منتخبات كسبت كأس العالم',
        'Name national teams that won the World Cup',
      ),
      answers: [
        (name: LocalizedText('البرازيل', 'Brazil'), aliases: ['brazil']),
        (name: LocalizedText('ألمانيا', 'Germany'), aliases: ['المانيا']),
        (name: LocalizedText('إيطاليا', 'Italy'), aliases: ['ايطاليا']),
        (name: LocalizedText('الأرجنتين', 'Argentina'), aliases: ['الارجنتين']),
        (name: LocalizedText('فرنسا', 'France'), aliases: ['france']),
        (
          name: LocalizedText('أوروغواي', 'Uruguay'),
          aliases: ['اوروجواي', 'الأوروغواي'],
        ),
        (name: LocalizedText('إنجلترا', 'England'), aliases: ['انجلترا']),
        (name: LocalizedText('إسبانيا', 'Spain'), aliases: ['اسبانيا']),
      ],
      wrong: [
        LocalizedText('هولندا', 'Netherlands'),
        LocalizedText('البرتغال', 'Portugal'),
        LocalizedText('كرواتيا', 'Croatia'),
      ],
    ),
  ];
}
