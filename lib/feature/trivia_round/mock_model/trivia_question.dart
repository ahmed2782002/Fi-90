import 'dart:math';

import 'package:fii90/core/localization/localized_text.dart';

// Internal only — never shown to the player.
enum TriviaLevel { easy, medium, hard }

class TriviaQuestion {
  const TriviaQuestion({
    required this.level,
    required this.text,
    required this.answers,
    required this.wrong,
  });

  final TriviaLevel level;
  final LocalizedText text;
  final List<({LocalizedText name, List<String> aliases})> answers;
  final List<LocalizedText> wrong;

  List<List<String>> get bank => [
    for (final a in answers) [a.name.ar, a.name.en, ...a.aliases],
  ];

  // Every group of 3 holds one easy, one medium and one hard question,
  // in random order.
  static List<TriviaQuestion> deal(int count, [Random? random]) {
    final r = random ?? Random();
    final pools = {
      for (final level in TriviaLevel.values)
        level: mock.where((q) => q.level == level).toList()..shuffle(r),
    };
    final out = <TriviaQuestion>[];
    for (var group = 0; out.length < count; group++) {
      out.addAll(
        [for (final pool in pools.values) pool[group % pool.length]]
          ..shuffle(r),
      );
    }
    return out.take(count).toList();
  }

  static const mock = [
    // Easy
    TriviaQuestion(
      level: TriviaLevel.easy,
      text: LocalizedText(
        'اذكر المنتخبات التي فازت بكأس العالم أكثر من مرة',
        'Name national teams that won the World Cup more than once',
      ),
      answers: [
        (name: LocalizedText('البرازيل', 'Brazil'), aliases: []),
        (name: LocalizedText('ألمانيا', 'Germany'), aliases: []),
        (name: LocalizedText('إيطاليا', 'Italy'), aliases: []),
        (name: LocalizedText('الأرجنتين', 'Argentina'), aliases: []),
        (name: LocalizedText('فرنسا', 'France'), aliases: []),
        (
          name: LocalizedText('أوروجواي', 'Uruguay'),
          aliases: ['أوروغواي', 'الأوروجواي'],
        ),
      ],
      wrong: [
        LocalizedText('إسبانيا', 'Spain'),
        LocalizedText('إنجلترا', 'England'),
        LocalizedText('هولندا', 'Netherlands'),
      ],
    ),
    TriviaQuestion(
      level: TriviaLevel.easy,
      text: LocalizedText(
        'اذكر لاعبين فازوا بالكرة الذهبية أكثر من مرة',
        "Name players who won the Ballon d'Or more than once",
      ),
      answers: [
        (
          name: LocalizedText('ليونيل ميسي', 'Lionel Messi'),
          aliases: ['ميسي', 'messi'],
        ),
        (
          name: LocalizedText('كريستيانو رونالدو', 'Cristiano Ronaldo'),
          aliases: ['كريستيانو', 'رونالدو', 'ronaldo', 'cr7'],
        ),
        (
          name: LocalizedText('ميشيل بلاتيني', 'Michel Platini'),
          aliases: ['بلاتيني', 'platini'],
        ),
        (
          name: LocalizedText('يوهان كرويف', 'Johan Cruyff'),
          aliases: ['كرويف', 'cruyff', 'cruijff'],
        ),
        (
          name: LocalizedText('ماركو فان باستن', 'Marco van Basten'),
          aliases: ['فان باستن', 'van basten'],
        ),
        (
          name: LocalizedText('ألفريدو دي ستيفانو', 'Alfredo Di Stéfano'),
          aliases: ['دي ستيفانو', 'di stefano'],
        ),
        (
          name: LocalizedText('فرانز بيكنباور', 'Franz Beckenbauer'),
          aliases: ['بيكنباور', 'بكنباور', 'beckenbauer'],
        ),
        (
          name: LocalizedText('كيفن كيجان', 'Kevin Keegan'),
          aliases: ['كيجان', 'كيغان', 'keegan'],
        ),
        (
          name: LocalizedText('كارل هاينز رومينيجه', 'Karl-Heinz Rummenigge'),
          aliases: ['رومينيجه', 'رومنيجه', 'rummenigge'],
        ),
      ],
      wrong: [
        LocalizedText('زين الدين زيدان', 'Zinedine Zidane'),
        LocalizedText('رونالدينيو', 'Ronaldinho'),
        LocalizedText('لوكا مودريتش', 'Luka Modrić'),
      ],
    ),
    TriviaQuestion(
      level: TriviaLevel.easy,
      text: LocalizedText(
        'اذكر أندية إنجليزية فازت بدوري أبطال أوروبا',
        'Name English clubs that won the Champions League',
      ),
      answers: [
        (name: LocalizedText('ليفربول', 'Liverpool'), aliases: []),
        (
          name: LocalizedText('مانشستر يونايتد', 'Manchester United'),
          aliases: ['يونايتد', 'man utd', 'united'],
        ),
        (name: LocalizedText('تشيلسي', 'Chelsea'), aliases: ['تشلسي']),
        (
          name: LocalizedText('مانشستر سيتي', 'Manchester City'),
          aliases: ['سيتي', 'man city', 'city'],
        ),
        (
          name: LocalizedText('أستون فيلا', 'Aston Villa'),
          aliases: ['استون فيلا', 'villa'],
        ),
        (
          name: LocalizedText('نوتنجهام فورست', 'Nottingham Forest'),
          aliases: ['نوتينجهام فورست', 'نوتنغهام فورست', 'forest'],
        ),
      ],
      wrong: [
        LocalizedText('أرسنال', 'Arsenal'),
        LocalizedText('توتنهام', 'Tottenham'),
        LocalizedText('نيوكاسل', 'Newcastle'),
      ],
    ),
    TriviaQuestion(
      level: TriviaLevel.easy,
      text: LocalizedText(
        'اذكر لاعبين سجلوا هاتريك في نهائي كأس العالم',
        'Name players who scored a hat-trick in a World Cup final',
      ),
      answers: [
        (
          name: LocalizedText('جيف هيرست', 'Geoff Hurst'),
          aliases: ['هيرست', 'hurst'],
        ),
        (
          name: LocalizedText('كيليان مبابي', 'Kylian Mbappé'),
          aliases: ['مبابي', 'mbappe'],
        ),
      ],
      wrong: [
        LocalizedText('بيليه', 'Pelé'),
        LocalizedText('زين الدين زيدان', 'Zinedine Zidane'),
        LocalizedText('ليونيل ميسي', 'Lionel Messi'),
      ],
    ),
    TriviaQuestion(
      level: TriviaLevel.easy,
      text: LocalizedText(
        'اذكر لاعبين ارتدوا قميص ريال مدريد وبرشلونة خلال مسيرتهم',
        'Name players who wore both Real Madrid and Barcelona shirts',
      ),
      answers: [
        (
          name: LocalizedText('لويس فيجو', 'Luís Figo'),
          aliases: ['فيجو', 'فيغو', 'figo'],
        ),
        (
          name: LocalizedText('رونالدو نازاريو', 'Ronaldo Nazário'),
          aliases: ['رونالدو', 'ronaldo', 'r9', 'رونالدو الظاهرة'],
        ),
        (
          name: LocalizedText('لويس إنريكي', 'Luis Enrique'),
          aliases: ['إنريكي', 'enrique'],
        ),
        (
          name: LocalizedText('صامويل إيتو', "Samuel Eto'o"),
          aliases: ['إيتو', 'etoo', 'eto o'],
        ),
        (
          name: LocalizedText('خافيير سافيولا', 'Javier Saviola'),
          aliases: ['سافيولا', 'saviola'],
        ),
        (
          name: LocalizedText('مايكل لاودروب', 'Michael Laudrup'),
          aliases: ['لاودروب', 'laudrup'],
        ),
        (
          name: LocalizedText('بيرند شوستر', 'Bernd Schuster'),
          aliases: ['شوستر', 'schuster'],
        ),
        (
          name: LocalizedText('جيورجي هاجي', 'Gheorghe Hagi'),
          aliases: ['هاجي', 'hagi'],
        ),
        (
          name: LocalizedText('روبرت بروسينيتشكي', 'Robert Prosinečki'),
          aliases: ['بروسينيتشكي', 'prosinecki'],
        ),
        (
          name: LocalizedText('ريكاردو زامورا', 'Ricardo Zamora'),
          aliases: ['زامورا', 'zamora'],
        ),
        (
          name: LocalizedText('ألبرت سيلاديس', 'Albert Celades'),
          aliases: ['سيلاديس', 'celades'],
        ),
        (
          name: LocalizedText('جولين لوبيتيجي', 'Julen Lopetegui'),
          aliases: ['لوبيتيجي', 'lopetegui'],
        ),
        (
          name: LocalizedText('لويس ميا', 'Luis Milla'),
          aliases: ['luis milla'],
        ),
        (
          name: LocalizedText('ألفونسو بيريز', 'Alfonso Pérez'),
          aliases: ['alfonso', 'alfonso perez'],
        ),
      ],
      wrong: [
        LocalizedText('ليونيل ميسي', 'Lionel Messi'),
        LocalizedText('تشافي', 'Xavi'),
        LocalizedText('راؤول', 'Raúl'),
      ],
    ),
    TriviaQuestion(
      level: TriviaLevel.easy,
      text: LocalizedText(
        'اذكر منتخبات عربية شاركت في كأس العالم',
        'Name Arab national teams that played at the World Cup',
      ),
      answers: [
        (name: LocalizedText('مصر', 'Egypt'), aliases: []),
        (name: LocalizedText('المغرب', 'Morocco'), aliases: []),
        (name: LocalizedText('تونس', 'Tunisia'), aliases: []),
        (name: LocalizedText('الجزائر', 'Algeria'), aliases: []),
        (
          name: LocalizedText('السعودية', 'Saudi Arabia'),
          aliases: ['saudi', 'المملكة العربية السعودية'],
        ),
        (name: LocalizedText('العراق', 'Iraq'), aliases: []),
        (name: LocalizedText('قطر', 'Qatar'), aliases: []),
        (name: LocalizedText('الإمارات', 'UAE'), aliases: ['uae', 'emirates']),
        (name: LocalizedText('الكويت', 'Kuwait'), aliases: []),
        (name: LocalizedText('الأردن', 'Jordan'), aliases: []),
      ],
      wrong: [
        LocalizedText('سوريا', 'Syria'),
        LocalizedText('لبنان', 'Lebanon'),
        LocalizedText('عُمان', 'Oman'),
      ],
    ),

    // Medium
    TriviaQuestion(
      level: TriviaLevel.medium,
      text: LocalizedText(
        'اذكر لاعبين فازوا بكأس العالم ودوري أبطال أوروبا خلال مسيرتهم',
        'Name players who won both the World Cup and the Champions League',
      ),
      answers: [
        (
          name: LocalizedText('ليونيل ميسي', 'Lionel Messi'),
          aliases: ['ميسي', 'messi'],
        ),
        (
          name: LocalizedText('زين الدين زيدان', 'Zinedine Zidane'),
          aliases: ['زيدان', 'zidane', 'zizou'],
        ),
        (
          name: LocalizedText('أندريس إنييستا', 'Andrés Iniesta'),
          aliases: ['إنييستا', 'انيستا', 'iniesta'],
        ),
        (name: LocalizedText('تشافي', 'Xavi'), aliases: ['تشافي هيرنانديز']),
        (
          name: LocalizedText('جيرارد بيكيه', 'Gerard Piqué'),
          aliases: ['بيكيه', 'pique'],
        ),
        (
          name: LocalizedText('سيرجيو راموس', 'Sergio Ramos'),
          aliases: ['راموس', 'ramos'],
        ),
        (
          name: LocalizedText('رافاييل فاران', 'Raphaël Varane'),
          aliases: ['فاران', 'varane'],
        ),
        (name: LocalizedText('كاكا', 'Kaká'), aliases: ['kaka']),
        (
          name: LocalizedText('فرانز بيكنباور', 'Franz Beckenbauer'),
          aliases: ['بيكنباور', 'بكنباور', 'beckenbauer'],
        ),
        (
          name: LocalizedText('جيرد مولر', 'Gerd Müller'),
          aliases: ['مولر', 'gerd muller', 'gerd mueller'],
        ),
        (
          name: LocalizedText('سيب ماير', 'Sepp Maier'),
          aliases: ['ماير', 'maier'],
        ),
        (
          name: LocalizedText('باول برايتنر', 'Paul Breitner'),
          aliases: ['برايتنر', 'breitner'],
        ),
        (
          name: LocalizedText('أولي هونيس', 'Uli Hoeneß'),
          aliases: ['هونيس', 'hoeness', 'hoenes'],
        ),
        (
          name: LocalizedText('باولو روسي', 'Paolo Rossi'),
          aliases: ['روسي', 'rossi'],
        ),
        (
          name: LocalizedText('ماركو تارديلي', 'Marco Tardelli'),
          aliases: ['تارديلي', 'tardelli'],
        ),
        (
          name: LocalizedText('جايتانو شيريا', 'Gaetano Scirea'),
          aliases: ['شيريا', 'scirea'],
        ),
        (
          name: LocalizedText('أنطونيو كابريني', 'Antonio Cabrini'),
          aliases: ['كابريني', 'cabrini'],
        ),
        (
          name: LocalizedText('ديدييه ديشامب', 'Didier Deschamps'),
          aliases: ['ديشامب', 'deschamps'],
        ),
        (
          name: LocalizedText('مارسيل ديسايي', 'Marcel Desailly'),
          aliases: ['ديسايي', 'desailly'],
        ),
        (
          name: LocalizedText('كريستيان كاريمبو', 'Christian Karembeu'),
          aliases: ['كاريمبو', 'karembeu'],
        ),
        (
          name: LocalizedText('بيكسنتي ليزارازو', 'Bixente Lizarazu'),
          aliases: ['ليزارازو', 'lizarazu'],
        ),
        (
          name: LocalizedText('روبرتو كارلوس', 'Roberto Carlos'),
          aliases: ['roberto carlos'],
        ),
        (name: LocalizedText('كافو', 'Cafu'), aliases: []),
        (name: LocalizedText('رونالدينيو', 'Ronaldinho'), aliases: []),
        (
          name: LocalizedText('جوليانو بيليتي', 'Juliano Belletti'),
          aliases: ['بيليتي', 'belletti'],
        ),
        (name: LocalizedText('إدميلسون', 'Edmílson'), aliases: ['edmilson']),
        (name: LocalizedText('ديدا', 'Dida'), aliases: []),
        (
          name: LocalizedText('أندريا بيرلو', 'Andrea Pirlo'),
          aliases: ['بيرلو', 'pirlo'],
        ),
        (
          name: LocalizedText('جينارو جاتوزو', 'Gennaro Gattuso'),
          aliases: ['جاتوزو', 'غاتوزو', 'gattuso'],
        ),
        (
          name: LocalizedText('أليساندرو نيستا', 'Alessandro Nesta'),
          aliases: ['نيستا', 'nesta'],
        ),
        (
          name: LocalizedText('فيليبو إنزاجي', 'Filippo Inzaghi'),
          aliases: ['إنزاجي', 'إنزاغي', 'inzaghi'],
        ),
        (
          name: LocalizedText('أليساندرو ديل بييرو', 'Alessandro Del Piero'),
          aliases: ['ديل بييرو', 'del piero'],
        ),
        (
          name: LocalizedText('ماركو ماتيراتزي', 'Marco Materazzi'),
          aliases: ['ماتيراتزي', 'materazzi'],
        ),
        (
          name: LocalizedText('إيكر كاسياس', 'Iker Casillas'),
          aliases: ['كاسياس', 'casillas'],
        ),
        (
          name: LocalizedText('كارليس بويول', 'Carles Puyol'),
          aliases: ['بويول', 'puyol'],
        ),
        (
          name: LocalizedText('سيرجيو بوسكيتس', 'Sergio Busquets'),
          aliases: ['بوسكيتس', 'busquets'],
        ),
        (
          name: LocalizedText('بيدرو رودريجيز', 'Pedro Rodríguez'),
          aliases: ['بيدرو', 'pedro'],
        ),
        (
          name: LocalizedText('دافيد فيا', 'David Villa'),
          aliases: ['فيا', 'villa'],
        ),
        (
          name: LocalizedText('تشابي ألونسو', 'Xabi Alonso'),
          aliases: ['ألونسو', 'xabi alonso'],
        ),
        (
          name: LocalizedText('فيكتور فالديس', 'Víctor Valdés'),
          aliases: ['فالديس', 'valdes'],
        ),
        (
          name: LocalizedText('فرناندو توريس', 'Fernando Torres'),
          aliases: ['توريس', 'torres'],
        ),
        (
          name: LocalizedText('ألفارو أربيلوا', 'Álvaro Arbeloa'),
          aliases: ['أربيلوا', 'arbeloa'],
        ),
        (
          name: LocalizedText('فيليب لام', 'Philipp Lahm'),
          aliases: ['لام', 'lahm'],
        ),
        (
          name: LocalizedText('باستيان شفاينشتايجر', 'Bastian Schweinsteiger'),
          aliases: ['شفاينشتايجر', 'شفاينشتايغر', 'schweinsteiger'],
        ),
        (
          name: LocalizedText('توماس مولر', 'Thomas Müller'),
          aliases: ['thomas muller', 'thomas mueller'],
        ),
        (
          name: LocalizedText('مانويل نوير', 'Manuel Neuer'),
          aliases: ['نوير', 'neuer'],
        ),
        (
          name: LocalizedText('جيروم بواتينج', 'Jérôme Boateng'),
          aliases: ['بواتينج', 'boateng'],
        ),
        (
          name: LocalizedText('توني كروس', 'Toni Kroos'),
          aliases: ['كروس', 'kroos'],
        ),
        (
          name: LocalizedText('سامي خضيرة', 'Sami Khedira'),
          aliases: ['خضيرة', 'khedira'],
        ),
        (
          name: LocalizedText('بنجامين بافار', 'Benjamin Pavard'),
          aliases: ['بافار', 'pavard'],
        ),
        (
          name: LocalizedText('لوكاس هيرنانديز', 'Lucas Hernández'),
          aliases: ['lucas hernandez'],
        ),
        (
          name: LocalizedText('كورنتين توليسو', 'Corentin Tolisso'),
          aliases: ['توليسو', 'tolisso'],
        ),
        (
          name: LocalizedText('نجولو كانتي', "N'Golo Kanté"),
          aliases: ['كانتي', 'kante'],
        ),
        (
          name: LocalizedText('أوليفييه جيرو', 'Olivier Giroud'),
          aliases: ['جيرو', 'giroud'],
        ),
        (
          name: LocalizedText('خوليان ألفاريز', 'Julián Álvarez'),
          aliases: ['ألفاريز', 'alvarez'],
        ),
      ],
      wrong: [
        LocalizedText('كريستيانو رونالدو', 'Cristiano Ronaldo'),
        LocalizedText('جانلويجي بوفون', 'Gianluigi Buffon'),
        LocalizedText('زلاتان إبراهيموفيتش', 'Zlatan Ibrahimović'),
      ],
    ),
    TriviaQuestion(
      level: TriviaLevel.medium,
      text: LocalizedText(
        'اذكر لاعبين سجلوا 5 أهداف أو أكثر في نسخة واحدة من كأس العالم',
        'Name players who scored 5+ goals in a single World Cup',
      ),
      answers: [
        (
          name: LocalizedText('ساندور كوتشيس', 'Sándor Kocsis'),
          aliases: ['كوتشيس', 'kocsis'],
        ),
        (
          name: LocalizedText('جوست فونتين', 'Just Fontaine'),
          aliases: ['فونتين', 'fontaine'],
        ),
        (name: LocalizedText('بيليه', 'Pelé'), aliases: ['pele']),
        (
          name: LocalizedText('أوزيبيو', 'Eusébio'),
          aliases: ['اوزيبيو', 'eusebio'],
        ),
        (
          name: LocalizedText('جيرد مولر', 'Gerd Müller'),
          aliases: ['gerd muller', 'gerd mueller'],
        ),
        (
          name: LocalizedText('جريجوري لاتو', 'Grzegorz Lato'),
          aliases: ['لاتو', 'lato'],
        ),
        (
          name: LocalizedText('ماريو كيمبس', 'Mario Kempes'),
          aliases: ['كيمبس', 'kempes'],
        ),
        (
          name: LocalizedText('باولو روسي', 'Paolo Rossi'),
          aliases: ['روسي', 'rossi'],
        ),
        (
          name: LocalizedText('دييجو مارادونا', 'Diego Maradona'),
          aliases: ['مارادونا', 'maradona'],
        ),
        (
          name: LocalizedText('أوليج سالينكو', 'Oleg Salenko'),
          aliases: ['سالينكو', 'salenko'],
        ),
        (
          name: LocalizedText('خريستو ستويتشكوف', 'Hristo Stoichkov'),
          aliases: ['ستويتشكوف', 'stoichkov'],
        ),
        (
          name: LocalizedText('دافور شوكر', 'Davor Šuker'),
          aliases: ['شوكر', 'suker'],
        ),
        (
          name: LocalizedText('رونالدو نازاريو', 'Ronaldo Nazário'),
          aliases: ['رونالدو', 'ronaldo', 'r9'],
        ),
        (
          name: LocalizedText('ميروسلاف كلوزه', 'Miroslav Klose'),
          aliases: ['كلوزه', 'كلوزة', 'klose'],
        ),
        (
          name: LocalizedText('ليونيل ميسي', 'Lionel Messi'),
          aliases: ['ميسي', 'messi'],
        ),
        (
          name: LocalizedText('كيليان مبابي', 'Kylian Mbappé'),
          aliases: ['مبابي', 'mbappe'],
        ),
        (
          name: LocalizedText('جييرمو ستابيلي', 'Guillermo Stábile'),
          aliases: ['ستابيلي', 'stabile'],
        ),
        (
          name: LocalizedText('بيدرو سيا', 'Pedro Cea'),
          aliases: ['سيا', 'cea'],
        ),
        (
          name: LocalizedText('أولدريخ نيدلي', 'Oldřich Nejedlý'),
          aliases: ['نيدلي', 'nejedly'],
        ),
        (name: LocalizedText('ليونيداس', 'Leônidas'), aliases: ['leonidas']),
        (name: LocalizedText('أديمير', 'Ademir'), aliases: []),
        (
          name: LocalizedText(
            'خوان ألبرتو سكيافينو',
            'Juan Alberto Schiaffino',
          ),
          aliases: ['سكيافينو', 'schiaffino'],
        ),
        (
          name: LocalizedText('أوسكار ميجيز', 'Óscar Míguez'),
          aliases: ['ميجيز', 'miguez'],
        ),
        (
          name: LocalizedText('ماكس مورلوك', 'Max Morlock'),
          aliases: ['مورلوك', 'morlock'],
        ),
        (
          name: LocalizedText('إريك بروبست', 'Erich Probst'),
          aliases: ['بروبست', 'probst'],
        ),
        (
          name: LocalizedText('يوزيف هوجي', 'Josef Hügi'),
          aliases: ['هوجي', 'hugi', 'huegi'],
        ),
        (
          name: LocalizedText('هيلموت ران', 'Helmut Rahn'),
          aliases: ['ران', 'rahn'],
        ),
        (name: LocalizedText('فافا', 'Vavá'), aliases: ['vava']),
        (
          name: LocalizedText('بيتر ماكبارلاند', 'Peter McParland'),
          aliases: ['ماكبارلاند', 'mcparland'],
        ),
        (
          name: LocalizedText('هيلموت هالر', 'Helmut Haller'),
          aliases: ['هالر', 'haller'],
        ),
        (name: LocalizedText('جايرزينيو', 'Jairzinho'), aliases: ['jairzinho']),
        (
          name: LocalizedText('تيوفيلو كوبياس', 'Teófilo Cubillas'),
          aliases: ['كوبياس', 'cubillas'],
        ),
        (
          name: LocalizedText('يوهان نيسكنز', 'Johan Neeskens'),
          aliases: ['نيسكنز', 'neeskens'],
        ),
        (
          name: LocalizedText('أندجي شارماخ', 'Andrzej Szarmach'),
          aliases: ['شارماخ', 'szarmach'],
        ),
        (
          name: LocalizedText('روب رينسنبرينك', 'Rob Rensenbrink'),
          aliases: ['رينسنبرينك', 'rensenbrink'],
        ),
        (
          name: LocalizedText('كارل هاينز رومينيجه', 'Karl-Heinz Rummenigge'),
          aliases: ['رومينيجه', 'رومنيجه', 'rummenigge'],
        ),
        (
          name: LocalizedText('جاري لينيكر', 'Gary Lineker'),
          aliases: ['لينيكر', 'lineker'],
        ),
        (name: LocalizedText('كاريكا', 'Careca'), aliases: []),
        (
          name: LocalizedText('إميليو بوتراجينيو', 'Emilio Butragueño'),
          aliases: ['بوتراجينيو', 'butragueno'],
        ),
        (
          name: LocalizedText('سالفاتوري سكيلاتشي', 'Salvatore Schillaci'),
          aliases: ['سكيلاتشي', 'schillaci', 'toto schillaci'],
        ),
        (name: LocalizedText('روماريو', 'Romário'), aliases: ['romario']),
        (
          name: LocalizedText('يورجن كلينسمان', 'Jürgen Klinsmann'),
          aliases: ['كلينسمان', 'klinsmann'],
        ),
        (
          name: LocalizedText('كينيت أندرسون', 'Kennet Andersson'),
          aliases: ['أندرسون', 'andersson'],
        ),
        (
          name: LocalizedText('روبرتو باجيو', 'Roberto Baggio'),
          aliases: ['باجيو', 'baggio'],
        ),
        (
          name: LocalizedText('جابرييل باتيستوتا', 'Gabriel Batistuta'),
          aliases: ['باتيستوتا', 'batistuta'],
        ),
        (
          name: LocalizedText('كريستيان فييري', 'Christian Vieri'),
          aliases: ['فييري', 'vieri'],
        ),
        (name: LocalizedText('ريفالدو', 'Rivaldo'), aliases: []),
        (
          name: LocalizedText('توماس مولر', 'Thomas Müller'),
          aliases: ['thomas muller', 'thomas mueller'],
        ),
        (
          name: LocalizedText('دافيد فيا', 'David Villa'),
          aliases: ['فيا', 'villa'],
        ),
        (
          name: LocalizedText('ويسلي شنايدر', 'Wesley Sneijder'),
          aliases: ['شنايدر', 'sneijder'],
        ),
        (
          name: LocalizedText('دييجو فورلان', 'Diego Forlán'),
          aliases: ['فورلان', 'forlan'],
        ),
        (
          name: LocalizedText('خاميس رودريجيز', 'James Rodríguez'),
          aliases: ['خاميس', 'james', 'james rodriguez'],
        ),
        (
          name: LocalizedText('هاري كين', 'Harry Kane'),
          aliases: ['كين', 'kane'],
        ),
      ],
      wrong: [
        LocalizedText('زين الدين زيدان', 'Zinedine Zidane'),
        LocalizedText('تييري هنري', 'Thierry Henry'),
        LocalizedText('راؤول', 'Raúl'),
      ],
    ),
    TriviaQuestion(
      level: TriviaLevel.medium,
      text: LocalizedText(
        'اذكر أندية فازت بالدوري الإنجليزي الممتاز منذ انطلاقه عام 1992',
        'Name clubs that won the Premier League since 1992',
      ),
      answers: [
        (
          name: LocalizedText('مانشستر يونايتد', 'Manchester United'),
          aliases: ['يونايتد', 'man utd', 'united'],
        ),
        (
          name: LocalizedText('مانشستر سيتي', 'Manchester City'),
          aliases: ['سيتي', 'man city', 'city'],
        ),
        (name: LocalizedText('تشيلسي', 'Chelsea'), aliases: ['تشلسي']),
        (name: LocalizedText('أرسنال', 'Arsenal'), aliases: ['ارسنال']),
        (name: LocalizedText('ليفربول', 'Liverpool'), aliases: []),
        (
          name: LocalizedText('بلاكبيرن روفرز', 'Blackburn Rovers'),
          aliases: ['بلاكبيرن', 'blackburn'],
        ),
        (
          name: LocalizedText('ليستر سيتي', 'Leicester City'),
          aliases: ['ليستر', 'leicester'],
        ),
      ],
      wrong: [
        LocalizedText('توتنهام', 'Tottenham'),
        LocalizedText('نيوكاسل', 'Newcastle'),
        LocalizedText('إيفرتون', 'Everton'),
      ],
    ),
    TriviaQuestion(
      level: TriviaLevel.medium,
      text: LocalizedText(
        'اذكر لاعبين فازوا بجائزة أفضل لاعب في العالم من FIFA والكرة الذهبية في نفس السنة',
        "Name players who won FIFA's best player award and the Ballon d'Or in the same year",
      ),
      answers: [
        (
          name: LocalizedText('رونالدو نازاريو', 'Ronaldo Nazário'),
          aliases: ['رونالدو', 'ronaldo', 'r9'],
        ),
        (
          name: LocalizedText('زين الدين زيدان', 'Zinedine Zidane'),
          aliases: ['زيدان', 'zidane'],
        ),
        (name: LocalizedText('رونالدينيو', 'Ronaldinho'), aliases: []),
        (name: LocalizedText('كاكا', 'Kaká'), aliases: ['kaka']),
        (
          name: LocalizedText('كريستيانو رونالدو', 'Cristiano Ronaldo'),
          aliases: ['كريستيانو', 'cr7'],
        ),
        (
          name: LocalizedText('ليونيل ميسي', 'Lionel Messi'),
          aliases: ['ميسي', 'messi'],
        ),
        (
          name: LocalizedText('لوكا مودريتش', 'Luka Modrić'),
          aliases: ['مودريتش', 'modric'],
        ),
        (
          name: LocalizedText('جورج ويا', 'George Weah'),
          aliases: ['ويا', 'weah'],
        ),
        (name: LocalizedText('ريفالدو', 'Rivaldo'), aliases: []),
        (
          name: LocalizedText('فابيو كانافارو', 'Fabio Cannavaro'),
          aliases: ['كانافارو', 'cannavaro'],
        ),
      ],
      wrong: [
        LocalizedText('لويس فيجو', 'Luís Figo'),
        LocalizedText('أندريس إنييستا', 'Andrés Iniesta'),
        LocalizedText('محمد صلاح', 'Mohamed Salah'),
      ],
    ),
    TriviaQuestion(
      level: TriviaLevel.medium,
      text: LocalizedText(
        'اذكر منتخبات وصلت إلى نهائي كأس العالم وخسرت النهائي مرة واحدة على الأقل',
        'Name national teams that lost at least one World Cup final',
      ),
      answers: [
        (name: LocalizedText('هولندا', 'Netherlands'), aliases: ['holland']),
        (name: LocalizedText('المجر', 'Hungary'), aliases: []),
        (name: LocalizedText('تشيكوسلوفاكيا', 'Czechoslovakia'), aliases: []),
        (name: LocalizedText('السويد', 'Sweden'), aliases: []),
        (name: LocalizedText('البرازيل', 'Brazil'), aliases: []),
        (name: LocalizedText('إيطاليا', 'Italy'), aliases: []),
        (name: LocalizedText('ألمانيا', 'Germany'), aliases: []),
        (name: LocalizedText('الأرجنتين', 'Argentina'), aliases: []),
        (name: LocalizedText('فرنسا', 'France'), aliases: []),
        (name: LocalizedText('كرواتيا', 'Croatia'), aliases: []),
      ],
      wrong: [
        LocalizedText('إسبانيا', 'Spain'),
        LocalizedText('إنجلترا', 'England'),
        LocalizedText('البرتغال', 'Portugal'),
      ],
    ),
    TriviaQuestion(
      level: TriviaLevel.medium,
      text: LocalizedText(
        'اذكر لاعبين سجلوا في نهائي دوري أبطال أوروبا مع ناديين مختلفين',
        'Name players who scored in Champions League finals for two different clubs',
      ),
      answers: [
        (
          name: LocalizedText('كريستيانو رونالدو', 'Cristiano Ronaldo'),
          aliases: ['كريستيانو', 'رونالدو', 'ronaldo', 'cr7'],
        ),
        (
          name: LocalizedText('ماريو ماندزوكيتش', 'Mario Mandžukić'),
          aliases: ['ماندزوكيتش', 'ماندزوكيش', 'mandzukic'],
        ),
      ],
      wrong: [
        LocalizedText('ليونيل ميسي', 'Lionel Messi'),
        LocalizedText('ديدييه دروجبا', 'Didier Drogba'),
        LocalizedText('سيرجيو راموس', 'Sergio Ramos'),
      ],
    ),

    // Hard
    TriviaQuestion(
      level: TriviaLevel.hard,
      text: LocalizedText(
        'اذكر لاعبين سجلوا 10 أهداف أو أكثر في نسخة واحدة من دوري أبطال أوروبا',
        'Name players who scored 10+ goals in a single Champions League season',
      ),
      answers: [
        (
          name: LocalizedText('كريستيانو رونالدو', 'Cristiano Ronaldo'),
          aliases: ['كريستيانو', 'رونالدو', 'ronaldo', 'cr7'],
        ),
        (
          name: LocalizedText('ليونيل ميسي', 'Lionel Messi'),
          aliases: ['ميسي', 'messi'],
        ),
        (
          name: LocalizedText('روبرت ليفاندوفسكي', 'Robert Lewandowski'),
          aliases: ['ليفاندوفسكي', 'lewandowski'],
        ),
        (
          name: LocalizedText('كريم بنزيما', 'Karim Benzema'),
          aliases: ['بنزيما', 'benzema'],
        ),
        (
          name: LocalizedText('كيليان مبابي', 'Kylian Mbappé'),
          aliases: ['مبابي', 'mbappe'],
        ),
        (
          name: LocalizedText('إرلينج هالاند', 'Erling Haaland'),
          aliases: ['هالاند', 'haaland'],
        ),
        (name: LocalizedText('نيمار', 'Neymar'), aliases: []),
        (
          name: LocalizedText('رود فان نيستلروي', 'Ruud van Nistelrooy'),
          aliases: ['فان نيستلروي', 'nistelrooy', 'van nistelrooy'],
        ),
        (
          name: LocalizedText('محمد صلاح', 'Mohamed Salah'),
          aliases: ['صلاح', 'salah', 'mohammed salah'],
        ),
        (
          name: LocalizedText('روبرتو فيرمينو', 'Roberto Firmino'),
          aliases: ['فيرمينو', 'firmino'],
        ),
        (
          name: LocalizedText('ساديو ماني', 'Sadio Mané'),
          aliases: ['ماني', 'mane'],
        ),
        (
          name: LocalizedText('سيرو جيراسي', 'Serhou Guirassy'),
          aliases: ['جيراسي', 'غيراسي', 'guirassy'],
        ),
        (name: LocalizedText('رافينيا', 'Raphinha'), aliases: []),
      ],
      wrong: [
        LocalizedText('لويس سواريز', 'Luis Suárez'),
        LocalizedText('تييري هنري', 'Thierry Henry'),
        LocalizedText('ديدييه دروجبا', 'Didier Drogba'),
      ],
    ),
    TriviaQuestion(
      level: TriviaLevel.hard,
      text: LocalizedText(
        'اذكر أندية فازت بدوري أبطال أوروبا مرتين متتاليتين أو أكثر',
        'Name clubs that won the Champions League in back-to-back seasons',
      ),
      answers: [
        (
          name: LocalizedText('ريال مدريد', 'Real Madrid'),
          aliases: ['الريال', 'madrid'],
        ),
        (name: LocalizedText('أياكس', 'Ajax'), aliases: []),
        (
          name: LocalizedText('بايرن ميونخ', 'Bayern Munich'),
          aliases: ['بايرن', 'bayern'],
        ),
        (name: LocalizedText('ليفربول', 'Liverpool'), aliases: []),
        (
          name: LocalizedText('ميلان', 'AC Milan'),
          aliases: ['إيه سي ميلان', 'milan'],
        ),
        (name: LocalizedText('بنفيكا', 'Benfica'), aliases: []),
        (
          name: LocalizedText('إنتر ميلان', 'Inter Milan'),
          aliases: ['انتر', 'إنتر', 'inter'],
        ),
        (
          name: LocalizedText('نوتنجهام فورست', 'Nottingham Forest'),
          aliases: ['نوتينجهام فورست', 'نوتنغهام فورست', 'forest'],
        ),
      ],
      wrong: [
        LocalizedText('برشلونة', 'Barcelona'),
        LocalizedText('تشيلسي', 'Chelsea'),
        LocalizedText('يوفنتوس', 'Juventus'),
      ],
    ),
    TriviaQuestion(
      level: TriviaLevel.hard,
      text: LocalizedText(
        'اذكر لاعبين فازوا بكأس العالم كقائد لمنتخبهم',
        'Name players who won the World Cup as captain',
      ),
      answers: [
        (
          name: LocalizedText('دييجو مارادونا', 'Diego Maradona'),
          aliases: ['مارادونا', 'maradona'],
        ),
        (name: LocalizedText('كافو', 'Cafu'), aliases: []),
        (
          name: LocalizedText('فابيو كانافارو', 'Fabio Cannavaro'),
          aliases: ['كانافارو', 'cannavaro'],
        ),
        (
          name: LocalizedText('إيكر كاسياس', 'Iker Casillas'),
          aliases: ['كاسياس', 'casillas'],
        ),
        (
          name: LocalizedText('هوجو لوريس', 'Hugo Lloris'),
          aliases: ['لوريس', 'lloris'],
        ),
        (
          name: LocalizedText('خوسيه نازاتسي', 'José Nasazzi'),
          aliases: ['نازاتسي', 'nasazzi'],
        ),
        (
          name: LocalizedText('جيانبييرو كومبي', 'Gianpiero Combi'),
          aliases: ['كومبي', 'combi'],
        ),
        (
          name: LocalizedText('جوزيبي مياتزا', 'Giuseppe Meazza'),
          aliases: ['مياتزا', 'meazza'],
        ),
        (
          name: LocalizedText('أوبدوليو فاريلا', 'Obdulio Varela'),
          aliases: ['فاريلا', 'varela'],
        ),
        (
          name: LocalizedText('فريتز فالتر', 'Fritz Walter'),
          aliases: ['فالتر', 'fritz walter'],
        ),
        (
          name: LocalizedText('هيلديرالدو بيليني', 'Hilderaldo Bellini'),
          aliases: ['بيليني', 'bellini'],
        ),
        (name: LocalizedText('ماورو راموس', 'Mauro Ramos'), aliases: ['mauro']),
        (
          name: LocalizedText('بوبي مور', 'Bobby Moore'),
          aliases: ['مور', 'moore'],
        ),
        (
          name: LocalizedText('كارلوس ألبرتو', 'Carlos Alberto'),
          aliases: ['carlos alberto torres'],
        ),
        (
          name: LocalizedText('فرانز بيكنباور', 'Franz Beckenbauer'),
          aliases: ['بيكنباور', 'بكنباور', 'beckenbauer'],
        ),
        (
          name: LocalizedText('دانيال باساريلا', 'Daniel Passarella'),
          aliases: ['باساريلا', 'passarella'],
        ),
        (
          name: LocalizedText('دينو زوف', 'Dino Zoff'),
          aliases: ['زوف', 'zoff'],
        ),
        (
          name: LocalizedText('لوثار ماتيوس', 'Lothar Matthäus'),
          aliases: ['ماتيوس', 'matthaus', 'matthaeus'],
        ),
        (name: LocalizedText('دونجا', 'Dunga'), aliases: ['دونغا']),
        (
          name: LocalizedText('ديدييه ديشامب', 'Didier Deschamps'),
          aliases: ['ديشامب', 'deschamps'],
        ),
        (
          name: LocalizedText('فيليب لام', 'Philipp Lahm'),
          aliases: ['لام', 'lahm'],
        ),
        (
          name: LocalizedText('ليونيل ميسي', 'Lionel Messi'),
          aliases: ['ميسي', 'messi'],
        ),
      ],
      wrong: [
        LocalizedText('زين الدين زيدان', 'Zinedine Zidane'),
        LocalizedText('رونالدو نازاريو', 'Ronaldo Nazário'),
        LocalizedText('أندريا بيرلو', 'Andrea Pirlo'),
      ],
    ),
    TriviaQuestion(
      level: TriviaLevel.hard,
      text: LocalizedText(
        'اذكر لاعبين سجلوا في نهائي كأس العالم ونهائي دوري أبطال أوروبا',
        'Name players who scored in both a World Cup final and a Champions League final',
      ),
      answers: [
        (
          name: LocalizedText('زين الدين زيدان', 'Zinedine Zidane'),
          aliases: ['زيدان', 'zidane'],
        ),
        (
          name: LocalizedText('ليونيل ميسي', 'Lionel Messi'),
          aliases: ['ميسي', 'messi'],
        ),
        (
          name: LocalizedText('ماريو ماندزوكيتش', 'Mario Mandžukić'),
          aliases: ['ماندزوكيتش', 'ماندزوكيش', 'mandzukic'],
        ),
        (
          name: LocalizedText('فيرينتس بوشكاش', 'Ferenc Puskás'),
          aliases: ['بوشكاش', 'puskas'],
        ),
        (
          name: LocalizedText('زولتان تشيبور', 'Zoltán Czibor'),
          aliases: ['تشيبور', 'czibor'],
        ),
        (
          name: LocalizedText('جيرد مولر', 'Gerd Müller'),
          aliases: ['مولر', 'gerd muller', 'gerd mueller'],
        ),
        (
          name: LocalizedText(
            'خوان ألبرتو سكيافينو',
            'Juan Alberto Schiaffino',
          ),
          aliases: ['سكيافينو', 'schiaffino'],
        ),
      ],
      wrong: [
        LocalizedText('أندريس إنييستا', 'Andrés Iniesta'),
        LocalizedText('كريم بنزيما', 'Karim Benzema'),
        LocalizedText('راؤول', 'Raúl'),
      ],
    ),
    TriviaQuestion(
      level: TriviaLevel.hard,
      text: LocalizedText(
        'اذكر أندية إيطالية وصلت إلى نهائي دوري أبطال أوروبا',
        'Name Italian clubs that reached a Champions League final',
      ),
      answers: [
        (
          name: LocalizedText('ميلان', 'AC Milan'),
          aliases: ['إيه سي ميلان', 'milan'],
        ),
        (
          name: LocalizedText('إنتر ميلان', 'Inter Milan'),
          aliases: ['انتر', 'إنتر', 'inter'],
        ),
        (name: LocalizedText('يوفنتوس', 'Juventus'), aliases: ['juve']),
        (name: LocalizedText('روما', 'Roma'), aliases: ['as roma']),
        (name: LocalizedText('فيورنتينا', 'Fiorentina'), aliases: []),
        (name: LocalizedText('سامبدوريا', 'Sampdoria'), aliases: []),
      ],
      wrong: [
        LocalizedText('نابولي', 'Napoli'),
        LocalizedText('لاتسيو', 'Lazio'),
        LocalizedText('أتالانتا', 'Atalanta'),
      ],
    ),
    TriviaQuestion(
      level: TriviaLevel.hard,
      text: LocalizedText(
        'اذكر لاعبين حصلوا على الحذاء الذهبي لكأس العالم',
        'Name players who won the World Cup Golden Boot',
      ),
      answers: [
        (
          name: LocalizedText('جيرد مولر', 'Gerd Müller'),
          aliases: ['gerd muller', 'gerd mueller'],
        ),
        (
          name: LocalizedText('باولو روسي', 'Paolo Rossi'),
          aliases: ['روسي', 'rossi'],
        ),
        (
          name: LocalizedText('جاري لينيكر', 'Gary Lineker'),
          aliases: ['لينيكر', 'lineker'],
        ),
        (
          name: LocalizedText('سالفاتوري سكيلاتشي', 'Salvatore Schillaci'),
          aliases: ['سكيلاتشي', 'schillaci', 'toto schillaci'],
        ),
        (
          name: LocalizedText('أوليج سالينكو', 'Oleg Salenko'),
          aliases: ['سالينكو', 'salenko'],
        ),
        (
          name: LocalizedText('خريستو ستويتشكوف', 'Hristo Stoichkov'),
          aliases: ['ستويتشكوف', 'stoichkov'],
        ),
        (
          name: LocalizedText('دافور شوكر', 'Davor Šuker'),
          aliases: ['شوكر', 'suker'],
        ),
        (
          name: LocalizedText('رونالدو نازاريو', 'Ronaldo Nazário'),
          aliases: ['رونالدو', 'ronaldo', 'r9'],
        ),
        (
          name: LocalizedText('ميروسلاف كلوزه', 'Miroslav Klose'),
          aliases: ['كلوزه', 'كلوزة', 'klose'],
        ),
        (
          name: LocalizedText('توماس مولر', 'Thomas Müller'),
          aliases: ['thomas muller', 'thomas mueller'],
        ),
        (
          name: LocalizedText('خاميس رودريجيز', 'James Rodríguez'),
          aliases: ['خاميس', 'james', 'james rodriguez'],
        ),
        (
          name: LocalizedText('هاري كين', 'Harry Kane'),
          aliases: ['كين', 'kane'],
        ),
        (
          name: LocalizedText('كيليان مبابي', 'Kylian Mbappé'),
          aliases: ['مبابي', 'mbappe'],
        ),
        (
          name: LocalizedText('جييرمو ستابيلي', 'Guillermo Stábile'),
          aliases: ['ستابيلي', 'stabile'],
        ),
        (
          name: LocalizedText('أولدريخ نيدلي', 'Oldřich Nejedlý'),
          aliases: ['نيدلي', 'nejedly'],
        ),
        (name: LocalizedText('ليونيداس', 'Leônidas'), aliases: ['leonidas']),
        (name: LocalizedText('أديمير', 'Ademir'), aliases: []),
        (
          name: LocalizedText('ساندور كوتشيس', 'Sándor Kocsis'),
          aliases: ['كوتشيس', 'kocsis'],
        ),
        (
          name: LocalizedText('جوست فونتين', 'Just Fontaine'),
          aliases: ['فونتين', 'fontaine'],
        ),
        (name: LocalizedText('جارينشا', 'Garrincha'), aliases: ['غارينشا']),
        (name: LocalizedText('فافا', 'Vavá'), aliases: ['vava']),
        (
          name: LocalizedText('ليونيل سانشيز', 'Leonel Sánchez'),
          aliases: ['leonel sanchez'],
        ),
        (
          name: LocalizedText('دراجان ييركوفيتش', 'Dražan Jerković'),
          aliases: ['ييركوفيتش', 'jerkovic'],
        ),
        (
          name: LocalizedText('فلوريان ألبرت', 'Flórián Albert'),
          aliases: ['florian albert'],
        ),
        (
          name: LocalizedText('فالنتين إيفانوف', 'Valentin Ivanov'),
          aliases: ['إيفانوف', 'ivanov'],
        ),
        (
          name: LocalizedText('أوزيبيو', 'Eusébio'),
          aliases: ['اوزيبيو', 'eusebio'],
        ),
        (
          name: LocalizedText('جريجوري لاتو', 'Grzegorz Lato'),
          aliases: ['لاتو', 'lato'],
        ),
        (
          name: LocalizedText('ماريو كيمبس', 'Mario Kempes'),
          aliases: ['كيمبس', 'kempes'],
        ),
      ],
      wrong: [
        LocalizedText('ليونيل ميسي', 'Lionel Messi'),
        LocalizedText('بيليه', 'Pelé'),
        LocalizedText('زين الدين زيدان', 'Zinedine Zidane'),
      ],
    ),
    TriviaQuestion(
      level: TriviaLevel.hard,
      text: LocalizedText(
        'اذكر لاعبين سجلوا في 3 نسخ مختلفة من كأس العالم أو أكثر',
        'Name players who scored in 3 or more different World Cups',
      ),
      answers: [
        (name: LocalizedText('بيليه', 'Pelé'), aliases: ['pele']),
        (
          name: LocalizedText('ميروسلاف كلوزه', 'Miroslav Klose'),
          aliases: ['كلوزه', 'كلوزة', 'klose'],
        ),
        (
          name: LocalizedText('كريستيانو رونالدو', 'Cristiano Ronaldo'),
          aliases: ['كريستيانو', 'رونالدو', 'ronaldo', 'cr7'],
        ),
        (
          name: LocalizedText('ليونيل ميسي', 'Lionel Messi'),
          aliases: ['ميسي', 'messi'],
        ),
        (
          name: LocalizedText('أوفي زيلر', 'Uwe Seeler'),
          aliases: ['زيلر', 'seeler'],
        ),
        (
          name: LocalizedText('رونالدو نازاريو', 'Ronaldo Nazário'),
          aliases: ['نازاريو', 'nazario', 'r9'],
        ),
        (
          name: LocalizedText('جريجوري لاتو', 'Grzegorz Lato'),
          aliases: ['لاتو', 'lato'],
        ),
        (
          name: LocalizedText('دييجو مارادونا', 'Diego Maradona'),
          aliases: ['مارادونا', 'maradona'],
        ),
        (
          name: LocalizedText('يورجن كلينسمان', 'Jürgen Klinsmann'),
          aliases: ['كلينسمان', 'klinsmann'],
        ),
        (
          name: LocalizedText('جابرييل باتيستوتا', 'Gabriel Batistuta'),
          aliases: ['باتيستوتا', 'batistuta'],
        ),
        (name: LocalizedText('نيمار', 'Neymar'), aliases: []),
        (
          name: LocalizedText('لويس سواريز', 'Luis Suárez'),
          aliases: ['سواريز', 'suarez'],
        ),
        (
          name: LocalizedText('رودي فولر', 'Rudi Völler'),
          aliases: ['فولر', 'voller', 'voeller'],
        ),
        (
          name: LocalizedText('كارل هاينز رومينيجه', 'Karl-Heinz Rummenigge'),
          aliases: ['رومينيجه', 'رومنيجه', 'rummenigge'],
        ),
        (
          name: LocalizedText('تيم كاهيل', 'Tim Cahill'),
          aliases: ['كاهيل', 'cahill'],
        ),
        (
          name: LocalizedText('سامي الجابر', 'Sami Al-Jaber'),
          aliases: ['الجابر', 'al jaber'],
        ),
        (
          name: LocalizedText('أسامواه جيان', 'Asamoah Gyan'),
          aliases: ['جيان', 'gyan'],
        ),
        (
          name: LocalizedText('إيفان بيريسيتش', 'Ivan Perišić'),
          aliases: ['بيريسيتش', 'perisic'],
        ),
        (
          name: LocalizedText('شيردان شاكيري', 'Xherdan Shaqiri'),
          aliases: ['شاكيري', 'shaqiri'],
        ),
        (
          name: LocalizedText('رافائيل ماركيز', 'Rafael Márquez'),
          aliases: ['ماركيز', 'marquez'],
        ),
      ],
      wrong: [
        LocalizedText('زين الدين زيدان', 'Zinedine Zidane'),
        LocalizedText('تييري هنري', 'Thierry Henry'),
        LocalizedText('كاكا', 'Kaká'),
      ],
    ),
    TriviaQuestion(
      level: TriviaLevel.hard,
      text: LocalizedText(
        'اذكر أندية فازت بدوري أبطال أوروبا دون خسارة أي مباراة طوال البطولة',
        'Name clubs that won the Champions League unbeaten',
      ),
      answers: [
        (
          name: LocalizedText('مانشستر يونايتد', 'Manchester United'),
          aliases: ['يونايتد', 'man utd', 'united'],
        ),
        (name: LocalizedText('برشلونة', 'Barcelona'), aliases: ['barca']),
        (
          name: LocalizedText('مانشستر سيتي', 'Manchester City'),
          aliases: ['سيتي', 'man city', 'city'],
        ),
        (name: LocalizedText('أياكس', 'Ajax'), aliases: []),
        (
          name: LocalizedText('ميلان', 'AC Milan'),
          aliases: ['إيه سي ميلان', 'milan'],
        ),
        (name: LocalizedText('ليفربول', 'Liverpool'), aliases: []),
        (
          name: LocalizedText('ريال مدريد', 'Real Madrid'),
          aliases: ['الريال', 'madrid'],
        ),
        (
          name: LocalizedText('بايرن ميونخ', 'Bayern Munich'),
          aliases: ['بايرن', 'bayern'],
        ),
      ],
      wrong: [
        LocalizedText('تشيلسي', 'Chelsea'),
        LocalizedText('إنتر ميلان', 'Inter Milan'),
        LocalizedText('يوفنتوس', 'Juventus'),
      ],
    ),
    TriviaQuestion(
      level: TriviaLevel.medium,
      text: LocalizedText(
        'اذكر لاعبين لعبوا مع ميسي ورونالدو في نفس الفريق خلال مسيرتهم',
        'Name players who were teammates of both Messi and Ronaldo',
      ),
      answers: [
        (
          name: LocalizedText('جيرارد بيكيه', 'Gerard Piqué'),
          aliases: ['بيكيه', 'pique'],
        ),
        (
          name: LocalizedText('كارلوس تيفيز', 'Carlos Tevez'),
          aliases: ['تيفيز', 'tevez'],
        ),
        (
          name: LocalizedText('جابرييل هاينز', 'Gabriel Heinze'),
          aliases: ['هاينز', 'heinze'],
        ),
        (
          name: LocalizedText('أنخيل دي ماريا', 'Ángel Di María'),
          aliases: ['دي ماريا', 'di maria'],
        ),
        (
          name: LocalizedText('جونزالو هيجواين', 'Gonzalo Higuaín'),
          aliases: ['هيجواين', 'هيغوايين', 'higuain'],
        ),
        (
          name: LocalizedText('فرناندو جاجو', 'Fernando Gago'),
          aliases: ['جاجو', 'gago'],
        ),
        (
          name: LocalizedText('إزيكيل جاراي', 'Ezequiel Garay'),
          aliases: ['جاراي', 'garay'],
        ),
        (
          name: LocalizedText('باولو ديبالا', 'Paulo Dybala'),
          aliases: ['ديبالا', 'dybala'],
        ),
        (
          name: LocalizedText('ليساندرو مارتينيز', 'Lisandro Martínez'),
          aliases: ['ليساندرو', 'lisandro', 'lisandro martinez'],
        ),
        (
          name: LocalizedText('أليخاندرو جارناتشو', 'Alejandro Garnacho'),
          aliases: ['جارناتشو', 'garnacho'],
        ),
        (
          name: LocalizedText('سيرجيو راموس', 'Sergio Ramos'),
          aliases: ['راموس', 'ramos'],
        ),
        (
          name: LocalizedText('كيلور نافاس', 'Keylor Navas'),
          aliases: ['نافاس', 'navas'],
        ),
        (
          name: LocalizedText('أشرف حكيمي', 'Achraf Hakimi'),
          aliases: ['حكيمي', 'hakimi'],
        ),
        (
          name: LocalizedText('ميراليم بيانيتش', 'Miralem Pjanić'),
          aliases: ['بيانيتش', 'pjanic'],
        ),
        (
          name: LocalizedText('آرثر ميلو', 'Arthur Melo'),
          aliases: ['آرثر', 'arthur'],
        ),
        (name: LocalizedText('ديكو', 'Deco'), aliases: []),
        (
          name: LocalizedText('نيلسون سيميدو', 'Nélson Semedo'),
          aliases: ['سيميدو', 'semedo'],
        ),
        (
          name: LocalizedText('أندريه جوميز', 'André Gomes'),
          aliases: ['andre gomes'],
        ),
        (
          name: LocalizedText('فرانشيسكو ترينكاو', 'Francisco Trincão'),
          aliases: ['ترينكاو', 'trincao'],
        ),
        (
          name: LocalizedText('دانيلو بيريرا', 'Danilo Pereira'),
          aliases: ['danilo pereira'],
        ),
        (
          name: LocalizedText('نونو مينديز', 'Nuno Mendes'),
          aliases: ['nuno mendes'],
        ),
        (name: LocalizedText('فيتينيا', 'Vitinha'), aliases: ['vitinha']),
        (
          name: LocalizedText('ريناتو سانشيز', 'Renato Sanches'),
          aliases: ['ريناتو', 'renato sanches'],
        ),
      ],
      wrong: [
        LocalizedText('نيمار', 'Neymar'),
        LocalizedText('كريم بنزيما', 'Karim Benzema'),
        LocalizedText('لويس سواريز', 'Luis Suárez'),
      ],
    ),
    TriviaQuestion(
      level: TriviaLevel.hard,
      text: LocalizedText(
        'اذكر مدربين فازوا بدوري أبطال أوروبا مع ناديين مختلفين',
        'Name managers who won the Champions League with two different clubs',
      ),
      answers: [
        (
          name: LocalizedText('إرنست هابل', 'Ernst Happel'),
          aliases: ['هابل', 'happel'],
        ),
        (
          name: LocalizedText('أوتمار هيتسفيلد', 'Ottmar Hitzfeld'),
          aliases: ['هيتسفيلد', 'hitzfeld'],
        ),
        (
          name: LocalizedText('جوزيه مورينيو', 'José Mourinho'),
          aliases: ['مورينيو', 'mourinho'],
        ),
        (
          name: LocalizedText('يوب هاينكس', 'Jupp Heynckes'),
          aliases: ['هاينكس', 'heynckes'],
        ),
        (
          name: LocalizedText('كارلو أنشيلوتي', 'Carlo Ancelotti'),
          aliases: ['أنشيلوتي', 'انشيلوتي', 'ancelotti'],
        ),
        (
          name: LocalizedText('بيب جوارديولا', 'Pep Guardiola'),
          aliases: ['جوارديولا', 'غوارديولا', 'guardiola'],
        ),
        (
          name: LocalizedText('لويس إنريكي', 'Luis Enrique'),
          aliases: ['إنريكي', 'enrique'],
        ),
      ],
      wrong: [
        LocalizedText('زين الدين زيدان', 'Zinedine Zidane'),
        LocalizedText('يورجن كلوب', 'Jürgen Klopp'),
        LocalizedText('أليكس فيرجسون', 'Alex Ferguson'),
      ],
    ),
    TriviaQuestion(
      level: TriviaLevel.easy,
      text: LocalizedText(
        'اذكر لاعبين مصريين سجلوا في دوري أبطال أوروبا',
        'Name Egyptian players who scored in the Champions League',
      ),
      answers: [
        (
          name: LocalizedText('محمد صلاح', 'Mohamed Salah'),
          aliases: ['صلاح', 'salah', 'mohammed salah'],
        ),
        (
          name: LocalizedText('أحمد حسام ميدو', 'Ahmed Hossam Mido'),
          aliases: ['ميدو', 'mido'],
        ),
      ],
      wrong: [
        LocalizedText('محمد أبو تريكة', 'Mohamed Aboutrika'),
        LocalizedText('حسام حسن', 'Hossam Hassan'),
        LocalizedText('عصام الحضري', 'Essam El-Hadary'),
      ],
    ),
    TriviaQuestion(
      level: TriviaLevel.hard,
      text: LocalizedText(
        'اذكر أندية فازت بالدوري المحلي دون أي هزيمة',
        'Name clubs that won their domestic league unbeaten',
      ),
      answers: [
        (name: LocalizedText('أرسنال', 'Arsenal'), aliases: ['ارسنال']),
        (
          name: LocalizedText('بريستون نورث إند', 'Preston North End'),
          aliases: ['بريستون', 'preston'],
        ),
        (name: LocalizedText('يوفنتوس', 'Juventus'), aliases: ['juve']),
        (
          name: LocalizedText('ميلان', 'AC Milan'),
          aliases: ['إيه سي ميلان', 'milan'],
        ),
        (
          name: LocalizedText('باير ليفركوزن', 'Bayer Leverkusen'),
          aliases: ['ليفركوزن', 'leverkusen'],
        ),
        (name: LocalizedText('أياكس', 'Ajax'), aliases: []),
        (name: LocalizedText('بورتو', 'Porto'), aliases: []),
        (name: LocalizedText('بنفيكا', 'Benfica'), aliases: []),
        (name: LocalizedText('سيلتيك', 'Celtic'), aliases: []),
        (name: LocalizedText('رينجرز', 'Rangers'), aliases: []),
        (
          name: LocalizedText('ستيوا بوخارست', 'Steaua Bucharest'),
          aliases: ['ستيوا', 'steaua'],
        ),
        (
          name: LocalizedText('ريال مدريد', 'Real Madrid'),
          aliases: ['الريال', 'madrid'],
        ),
        (
          name: LocalizedText('أتلتيك بلباو', 'Athletic Bilbao'),
          aliases: ['بلباو', 'bilbao', 'athletic club'],
        ),
        (name: LocalizedText('الأهلي', 'Al Ahly'), aliases: ['ahly']),
        (name: LocalizedText('الهلال', 'Al Hilal'), aliases: ['hilal']),
      ],
      wrong: [
        LocalizedText('تشيلسي', 'Chelsea'),
        LocalizedText('مانشستر سيتي', 'Manchester City'),
        LocalizedText('ليفربول', 'Liverpool'),
      ],
    ),
    TriviaQuestion(
      level: TriviaLevel.hard,
      text: LocalizedText(
        'اذكر لاعبين سجلوا في نهائي كأس العالم وخسروا المباراة',
        'Name players who scored in a World Cup final and lost',
      ),
      answers: [
        (
          name: LocalizedText('كارلوس بوسيل', 'Carlos Peucelle'),
          aliases: ['بوسيل', 'peucelle'],
        ),
        (
          name: LocalizedText('جييرمو ستابيلي', 'Guillermo Stábile'),
          aliases: ['ستابيلي', 'stabile'],
        ),
        (
          name: LocalizedText('أنتونين بوتش', 'Antonín Puč'),
          aliases: ['بوتش', 'puc'],
        ),
        (
          name: LocalizedText('بال تيتكوش', 'Pál Titkos'),
          aliases: ['تيتكوش', 'titkos'],
        ),
        (
          name: LocalizedText('جيورجي شاروشي', 'György Sárosi'),
          aliases: ['شاروشي', 'sarosi'],
        ),
        (name: LocalizedText('فرياسا', 'Friaça'), aliases: ['friaca']),
        (
          name: LocalizedText('فيرينتس بوشكاش', 'Ferenc Puskás'),
          aliases: ['بوشكاش', 'puskas'],
        ),
        (
          name: LocalizedText('زولتان تشيبور', 'Zoltán Czibor'),
          aliases: ['تشيبور', 'czibor'],
        ),
        (
          name: LocalizedText('نيلس ليدهولم', 'Nils Liedholm'),
          aliases: ['ليدهولم', 'liedholm'],
        ),
        (
          name: LocalizedText('أجنه سيمونسون', 'Agne Simonsson'),
          aliases: ['سيمونسون', 'simonsson'],
        ),
        (
          name: LocalizedText('يوزيف ماسوبوست', 'Josef Masopust'),
          aliases: ['ماسوبوست', 'masopust'],
        ),
        (
          name: LocalizedText('هيلموت هالر', 'Helmut Haller'),
          aliases: ['هالر', 'haller'],
        ),
        (
          name: LocalizedText('فولفجانج فيبر', 'Wolfgang Weber'),
          aliases: ['فيبر', 'weber'],
        ),
        (
          name: LocalizedText('روبرتو بونينسينيا', 'Roberto Boninsegna'),
          aliases: ['بونينسينيا', 'boninsegna'],
        ),
        (
          name: LocalizedText('يوهان نيسكنز', 'Johan Neeskens'),
          aliases: ['نيسكنز', 'neeskens'],
        ),
        (
          name: LocalizedText('ديك نانينجا', 'Dick Nanninga'),
          aliases: ['نانينجا', 'nanninga'],
        ),
        (
          name: LocalizedText('باول برايتنر', 'Paul Breitner'),
          aliases: ['برايتنر', 'breitner'],
        ),
        (
          name: LocalizedText('كارل هاينز رومينيجه', 'Karl-Heinz Rummenigge'),
          aliases: ['رومينيجه', 'رومنيجه', 'rummenigge'],
        ),
        (
          name: LocalizedText('رودي فولر', 'Rudi Völler'),
          aliases: ['فولر', 'voller', 'voeller'],
        ),
        (
          name: LocalizedText('زين الدين زيدان', 'Zinedine Zidane'),
          aliases: ['زيدان', 'zidane'],
        ),
        (
          name: LocalizedText('إيفان بيريسيتش', 'Ivan Perišić'),
          aliases: ['بيريسيتش', 'perisic'],
        ),
        (
          name: LocalizedText('ماريو ماندزوكيتش', 'Mario Mandžukić'),
          aliases: ['ماندزوكيتش', 'ماندزوكيش', 'mandzukic'],
        ),
        (
          name: LocalizedText('كيليان مبابي', 'Kylian Mbappé'),
          aliases: ['مبابي', 'mbappe'],
        ),
      ],
      wrong: [
        LocalizedText('ليونيل ميسي', 'Lionel Messi'),
        LocalizedText('بيليه', 'Pelé'),
        LocalizedText('جيف هيرست', 'Geoff Hurst'),
      ],
    ),
    TriviaQuestion(
      level: TriviaLevel.easy,
      text: LocalizedText(
        'اذكر منتخبات أفريقية وصلت إلى ربع نهائي كأس العالم',
        'Name African national teams that reached a World Cup quarter-final',
      ),
      answers: [
        (name: LocalizedText('الكاميرون', 'Cameroon'), aliases: []),
        (name: LocalizedText('السنغال', 'Senegal'), aliases: []),
        (name: LocalizedText('غانا', 'Ghana'), aliases: ['جانا']),
        (name: LocalizedText('المغرب', 'Morocco'), aliases: []),
      ],
      wrong: [
        LocalizedText('مصر', 'Egypt'),
        LocalizedText('نيجيريا', 'Nigeria'),
        LocalizedText('الجزائر', 'Algeria'),
      ],
    ),
    TriviaQuestion(
      level: TriviaLevel.medium,
      text: LocalizedText(
        'اذكر لاعبين فازوا بالكرة الذهبية وهم يلعبون في الدوري الإيطالي',
        "Name players who won the Ballon d'Or while playing in Serie A",
      ),
      answers: [
        (
          name: LocalizedText('عمر سيفوري', 'Omar Sívori'),
          aliases: ['سيفوري', 'sivori'],
        ),
        (
          name: LocalizedText('جياني ريفيرا', 'Gianni Rivera'),
          aliases: ['ريفيرا', 'rivera'],
        ),
        (
          name: LocalizedText('باولو روسي', 'Paolo Rossi'),
          aliases: ['روسي', 'rossi'],
        ),
        (
          name: LocalizedText('ميشيل بلاتيني', 'Michel Platini'),
          aliases: ['بلاتيني', 'platini'],
        ),
        (
          name: LocalizedText('رود خوليت', 'Ruud Gullit'),
          aliases: ['خوليت', 'جوليت', 'gullit'],
        ),
        (
          name: LocalizedText('ماركو فان باستن', 'Marco van Basten'),
          aliases: ['فان باستن', 'van basten'],
        ),
        (
          name: LocalizedText('لوثار ماتيوس', 'Lothar Matthäus'),
          aliases: ['ماتيوس', 'matthaus', 'matthaeus'],
        ),
        (
          name: LocalizedText('روبرتو باجيو', 'Roberto Baggio'),
          aliases: ['باجيو', 'baggio'],
        ),
        (
          name: LocalizedText('جورج ويا', 'George Weah'),
          aliases: ['ويا', 'weah'],
        ),
        (
          name: LocalizedText('رونالدو نازاريو', 'Ronaldo Nazário'),
          aliases: ['رونالدو', 'ronaldo', 'r9'],
        ),
        (
          name: LocalizedText('زين الدين زيدان', 'Zinedine Zidane'),
          aliases: ['زيدان', 'zidane'],
        ),
        (
          name: LocalizedText('بافل نيدفيد', 'Pavel Nedvěd'),
          aliases: ['نيدفيد', 'nedved'],
        ),
        (
          name: LocalizedText('أندريه شيفتشينكو', 'Andriy Shevchenko'),
          aliases: ['شيفتشينكو', 'shevchenko'],
        ),
        (name: LocalizedText('كاكا', 'Kaká'), aliases: ['kaka']),
      ],
      wrong: [
        LocalizedText('فابيو كانافارو', 'Fabio Cannavaro'),
        LocalizedText('فرانشيسكو توتي', 'Francesco Totti'),
        LocalizedText('أندريا بيرلو', 'Andrea Pirlo'),
      ],
    ),
    TriviaQuestion(
      level: TriviaLevel.hard,
      text: LocalizedText(
        'اذكر لاعبين سجلوا 4 أهداف في مباراة واحدة بدوري أبطال أوروبا',
        'Name players who scored 4 goals in a single Champions League match',
      ),
      answers: [
        (
          name: LocalizedText('ماركو فان باستن', 'Marco van Basten'),
          aliases: ['فان باستن', 'van basten'],
        ),
        (
          name: LocalizedText('سيموني إنزاجي', 'Simone Inzaghi'),
          aliases: ['سيموني', 'simone inzaghi'],
        ),
        (
          name: LocalizedText('دادو برسو', 'Dado Pršo'),
          aliases: ['برسو', 'prso'],
        ),
        (
          name: LocalizedText('رود فان نيستلروي', 'Ruud van Nistelrooy'),
          aliases: ['فان نيستلروي', 'nistelrooy', 'van nistelrooy'],
        ),
        (
          name: LocalizedText('أندريه شيفتشينكو', 'Andriy Shevchenko'),
          aliases: ['شيفتشينكو', 'shevchenko'],
        ),
        (
          name: LocalizedText('ليونيل ميسي', 'Lionel Messi'),
          aliases: ['ميسي', 'messi'],
        ),
        (
          name: LocalizedText('بافيتيمبي جوميس', 'Bafétimbi Gomis'),
          aliases: ['جوميس', 'gomis'],
        ),
        (
          name: LocalizedText('ماريو جوميز', 'Mario Gómez'),
          aliases: ['mario gomez'],
        ),
        (
          name: LocalizedText('روبرت ليفاندوفسكي', 'Robert Lewandowski'),
          aliases: ['ليفاندوفسكي', 'lewandowski'],
        ),
        (
          name: LocalizedText('زلاتان إبراهيموفيتش', 'Zlatan Ibrahimović'),
          aliases: ['إبراهيموفيتش', 'زلاتان', 'ibrahimovic', 'zlatan'],
        ),
        (
          name: LocalizedText('لويز أدريانو', 'Luiz Adriano'),
          aliases: ['luiz adriano'],
        ),
        (
          name: LocalizedText('كريستيانو رونالدو', 'Cristiano Ronaldo'),
          aliases: ['كريستيانو', 'رونالدو', 'ronaldo', 'cr7'],
        ),
        (
          name: LocalizedText('سيرج جنابري', 'Serge Gnabry'),
          aliases: ['جنابري', 'gnabry'],
        ),
        (
          name: LocalizedText('يوسيب إيليتشيتش', 'Josip Iličić'),
          aliases: ['إيليتشيتش', 'ilicic'],
        ),
        (
          name: LocalizedText('أوليفييه جيرو', 'Olivier Giroud'),
          aliases: ['جيرو', 'giroud'],
        ),
        (
          name: LocalizedText('سيباستيان هالر', 'Sébastien Haller'),
          aliases: ['sebastien haller'],
        ),
        (
          name: LocalizedText('إرلينج هالاند', 'Erling Haaland'),
          aliases: ['هالاند', 'haaland'],
        ),
        (
          name: LocalizedText('كيليان مبابي', 'Kylian Mbappé'),
          aliases: ['مبابي', 'mbappe'],
        ),
      ],
      wrong: [
        LocalizedText('لويس سواريز', 'Luis Suárez'),
        LocalizedText('محمد صلاح', 'Mohamed Salah'),
        LocalizedText('كريم بنزيما', 'Karim Benzema'),
      ],
    ),
  ];
}
