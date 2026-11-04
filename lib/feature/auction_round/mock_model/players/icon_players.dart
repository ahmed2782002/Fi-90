import 'package:fii90/core/localization/localized_text.dart';
import 'package:fii90/feature/auction_round/mock_model/auction_player.dart';

const iconPlayers = <AuctionPlayer>[
  // ───────────────────────────── Goalkeepers ─────────────────────────────
  AuctionPlayer(
    id: 'buffon',
    name: LocalizedText('جيانلويجي بوفون', "Gianluigi Buffon"),
    short: LocalizedText('بوفون', "Buffon"),
    role: PlayerRole.gk,
    rating: 94,
    legend: true,
    clues: [
      LocalizedText(
        'حارس مرمى اعتزل بعد 2020',
        "A goalkeeper who retired after 2020",
      ),
      LocalizedText(
        'إيطالي فاز بكأس العالم 2006',
        "An Italian who won the 2006 World Cup",
      ),
      LocalizedText(
        'بقي مع يوفنتوس بعد هبوطه للدرجة الثانية',
        "Stayed at Juventus after their drop to Serie B",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'casillas',
    name: LocalizedText('إيكر كاسياس', "Iker Casillas"),
    short: LocalizedText('كاسياس', "Casillas"),
    role: PlayerRole.gk,
    rating: 92,
    legend: true,
    clues: [
      LocalizedText(
        'حارس مرمى اعتزل بعد 2015',
        "A goalkeeper who retired after 2015",
      ),
      LocalizedText(
        'حارس إسباني لعب لريال مدريد',
        "A Spanish keeper who played for Real Madrid",
      ),
      LocalizedText(
        'أنهى مسيرته في بورتو البرتغالي',
        "Finished his career at Porto",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'kahn',
    name: LocalizedText('أوليفر كان', "Oliver Kahn"),
    short: LocalizedText('كان', "Kahn"),
    role: PlayerRole.gk,
    rating: 91,
    legend: true,
    clues: [
      LocalizedText(
        'حارس مرمى اعتزل قبل 2010',
        "A goalkeeper who retired before 2010",
      ),
      LocalizedText(
        'حارس ألماني قضى أغلب مسيرته في بايرن',
        "A German keeper who spent most of his career at Bayern",
      ),
      LocalizedText(
        'توّج بدوري الأبطال بركلات الترجيح في النهائي',
        "Won a Champions League final on penalties",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'schmeichel',
    name: LocalizedText('بيتر شمايكل', "Peter Schmeichel"),
    short: LocalizedText('شمايكل', "Schmeichel"),
    role: PlayerRole.gk,
    rating: 91,
    legend: true,
    clues: [
      LocalizedText(
        'حارس مرمى اعتزل قبل 2005',
        "A goalkeeper who retired before 2005",
      ),
      LocalizedText(
        'حارس لعب لمانشستر يونايتد في التسعينات',
        "A keeper who played for Man United in the 1990s",
      ),
      LocalizedText(
        'فاز ببطولة أوروبا 1992 مع منتخب بلاده',
        "Won Euro 1992 with his national team",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'van_der_sar',
    name: LocalizedText('إدوين فان دير سار', "Edwin van der Sar"),
    short: LocalizedText('فان دير سار', "Van der Sar"),
    role: PlayerRole.gk,
    rating: 90,
    legend: true,
    clues: [
      LocalizedText(
        'حارس مرمى اعتزل بعد 2010',
        "A goalkeeper who retired after 2010",
      ),
      LocalizedText(
        'حارس هولندي لعب لأياكس',
        "A Dutch keeper who played for Ajax",
      ),
      LocalizedText(
        'فاز بدوري الأبطال مع ناديين مختلفين',
        "Won the Champions League with two different clubs",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'cech',
    name: LocalizedText('بيتر تشيك', "Petr Cech"),
    short: LocalizedText('تشيك', "Cech"),
    role: PlayerRole.gk,
    rating: 89,
    legend: true,
    clues: [
      LocalizedText(
        'حارس مرمى اعتزل بعد 2015',
        "A goalkeeper who retired after 2015",
      ),
      LocalizedText(
        'حارس لعب لتشيلسي في البريميرليج',
        "A keeper who played for Chelsea in the Premier League",
      ),
      LocalizedText(
        'فاز بدوري الأبطال 2012 بركلات الترجيح',
        "Won the 2012 Champions League on penalties",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'yashin',
    name: LocalizedText('ليف ياشين', "Lev Yashin"),
    short: LocalizedText('ياشين', "Yashin"),
    role: PlayerRole.gk,
    rating: 93,
    legend: true,
    clues: [
      LocalizedText(
        'حارس مرمى من جيل الخمسينات والستينات',
        "A goalkeeper from the 1950s and 60s",
      ),
      LocalizedText(
        'حارس من الاتحاد السوفيتي',
        "A goalkeeper from the Soviet Union",
      ),
      LocalizedText(
        'فاز بأول نسخة من بطولة أمم أوروبا 1960',
        "Won the first European Championship in 1960",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'el_hadary',
    name: LocalizedText('عصام الحضري', "Essam El Hadary"),
    short: LocalizedText('الحضري', "El Hadary"),
    role: PlayerRole.gk,
    rating: 90,
    legend: true,
    clues: [
      LocalizedText(
        'حارس مرمى اعتزل بعد 2015',
        "A goalkeeper who retired after 2015",
      ),
      LocalizedText(
        'حارس مصري لعب للأهلي',
        "An Egyptian keeper who played for Al Ahly",
      ),
      LocalizedText(
        'لعب للأهلي ثم للزمالك لاحقاً',
        "Played for Al Ahly and later for Zamalek",
      ),
    ],
  ),

  // ───────────────────────────── Defenders ─────────────────────────────
  AuctionPlayer(
    id: 'maldini',
    name: LocalizedText('باولو مالديني', "Paolo Maldini"),
    short: LocalizedText('مالديني', "Maldini"),
    role: PlayerRole.df,
    rating: 95,
    legend: true,
    clues: [
      LocalizedText(
        'مدافع اعتزل قبل 2010',
        "A defender who retired before 2010",
      ),
      LocalizedText(
        'مدافع إيطالي لعب لنادٍ واحد طوال مسيرته',
        "An Italian defender who played for one club only",
      ),
      LocalizedText(
        'فاز بدوري الأبطال 5 مرات مع ميلان',
        "Won the European Cup five times with Milan",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'cafu',
    name: LocalizedText('كافو', "Cafu"),
    short: LocalizedText('كافو', "Cafu"),
    role: PlayerRole.df,
    label: 'RB',
    rating: 94,
    legend: true,
    clues: [
      LocalizedText(
        'ظهير أيمن اعتزل قبل 2010',
        "A right-back who retired before 2010",
      ),
      LocalizedText(
        'مدافع برازيلي لعب في إيطاليا',
        "A Brazilian defender who played in Italy",
      ),
      LocalizedText(
        'فاز بكأس العالم مرتين مع البرازيل',
        "Won the World Cup twice with Brazil",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'roberto_carlos',
    name: LocalizedText('روبرتو كارلوس', "Roberto Carlos"),
    short: LocalizedText('روبرتو كارلوس', "R. Carlos"),
    role: PlayerRole.df,
    label: 'LB',
    rating: 93,
    legend: true,
    clues: [
      LocalizedText(
        'ظهير أيسر اعتزل بعد 2010',
        "A left-back who retired after 2010",
      ),
      LocalizedText(
        'ظهير برازيلي لعب لريال مدريد',
        "A Brazilian full-back who played for Real Madrid",
      ),
      LocalizedText(
        'لعب لأنجي الروسي في آخر مسيرته',
        "Played for Anzhi in Russia late in his career",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'puyol',
    name: LocalizedText('كارليس بويول', "Carles Puyol"),
    short: LocalizedText('بويول', "Puyol"),
    role: PlayerRole.df,
    rating: 91,
    legend: true,
    clues: [
      LocalizedText(
        'مدافع اعتزل بعد 2010',
        "A defender who retired after 2010",
      ),
      LocalizedText(
        'مدافع إسباني لعب لبرشلونة',
        "A Spanish defender who played for Barcelona",
      ),
      LocalizedText(
        'لم يلعب لأي نادٍ غير برشلونة',
        "Never played for any club but Barcelona",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'beckenbauer',
    name: LocalizedText('فرانز بيكنباور', "Franz Beckenbauer"),
    short: LocalizedText('بيكنباور', "Beckenbauer"),
    role: PlayerRole.df,
    rating: 97,
    legend: true,
    clues: [
      LocalizedText(
        'مدافع من جيل الستينات والسبعينات',
        "A defender from the 1960s and 70s",
      ),
      LocalizedText(
        'ألماني لعب لبايرن ميونخ',
        "A German who played for Bayern Munich",
      ),
      LocalizedText(
        'فاز بكأس العالم لاعباً ومدرباً',
        "Won the World Cup as a player and as a coach",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'nesta',
    name: LocalizedText('أليساندرو نيستا', "Alessandro Nesta"),
    short: LocalizedText('نيستا', "Nesta"),
    role: PlayerRole.df,
    rating: 90,
    legend: true,
    clues: [
      LocalizedText(
        'مدافع اعتزل بعد 2010',
        "A defender who retired after 2010",
      ),
      LocalizedText(
        'مدافع لعب للاتسيو في التسعينات',
        "A defender who played for Lazio in the 1990s",
      ),
      LocalizedText(
        'أنهى مسيرته بين الدوري الأمريكي والهندي',
        "Ended his career in MLS and India",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'cannavaro',
    name: LocalizedText('فابيو كانافارو', "Fabio Cannavaro"),
    short: LocalizedText('كانافارو', "Cannavaro"),
    role: PlayerRole.df,
    rating: 92,
    legend: true,
    clues: [
      LocalizedText(
        'مدافع اعتزل بعد 2010',
        "A defender who retired after 2010",
      ),
      LocalizedText(
        'مدافع إيطالي لعب لنابولي وبارما',
        "An Italian defender who played for Napoli and Parma",
      ),
      LocalizedText(
        'مدافع فاز بالكرة الذهبية',
        "A defender who won the Ballon d'Or",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'baresi',
    name: LocalizedText('فرانكو باريزي', "Franco Baresi"),
    short: LocalizedText('باريزي', "Baresi"),
    role: PlayerRole.df,
    rating: 93,
    legend: true,
    clues: [
      LocalizedText(
        'مدافع اعتزل قبل 2000',
        "A defender who retired before 2000",
      ),
      LocalizedText(
        'مدافع إيطالي لعب لميلان',
        "An Italian defender who played for Milan",
      ),
      LocalizedText(
        'أضاع ركلة ترجيح في نهائي كأس العالم 1994',
        "Missed a penalty in the 1994 World Cup final shootout",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'ferdinand',
    name: LocalizedText('ريو فرديناند', "Rio Ferdinand"),
    short: LocalizedText('فرديناند', "Ferdinand"),
    role: PlayerRole.df,
    rating: 89,
    legend: true,
    clues: [
      LocalizedText(
        'مدافع اعتزل بعد 2010',
        "A defender who retired after 2010",
      ),
      LocalizedText(
        'مدافع إنجليزي لعب لمانشستر يونايتد',
        "An English defender who played for Man United",
      ),
      LocalizedText(
        'انتقل من ليدز يونايتد إلى مانشستر يونايتد',
        "Moved from Leeds United to Manchester United",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'terry',
    name: LocalizedText('جون تيري', "John Terry"),
    short: LocalizedText('تيري', "Terry"),
    role: PlayerRole.df,
    rating: 89,
    legend: true,
    clues: [
      LocalizedText(
        'مدافع اعتزل بعد 2015',
        "A defender who retired after 2015",
      ),
      LocalizedText(
        'مدافع إنجليزي لعب لتشيلسي',
        "An English defender who played for Chelsea",
      ),
      LocalizedText(
        'أضاع ركلة ترجيح في نهائي دوري الأبطال 2008',
        "Missed a penalty in the 2008 Champions League final",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'lahm',
    name: LocalizedText('فيليب لام', "Philipp Lahm"),
    short: LocalizedText('لام', "Lahm"),
    role: PlayerRole.df,
    label: 'RB',
    rating: 91,
    legend: true,
    clues: [
      LocalizedText(
        'ظهير اعتزل بعد 2015',
        "A full-back who retired after 2015",
      ),
      LocalizedText(
        'ألماني قضى أغلب مسيرته مع بايرن ميونخ',
        "A German who spent most of his career at Bayern",
      ),
      LocalizedText(
        'اعتزل دولياً بعد الفوز بكأس العالم 2014',
        "Retired from internationals after winning the 2014 World Cup",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'thuram',
    name: LocalizedText('ليليان تورام', "Lilian Thuram"),
    short: LocalizedText('تورام', "Thuram"),
    role: PlayerRole.df,
    label: 'RB',
    rating: 90,
    legend: true,
    clues: [
      LocalizedText(
        'مدافع اعتزل قبل 2010',
        "A defender who retired before 2010",
      ),
      LocalizedText(
        'مدافع فرنسي لعب في الدوري الإيطالي',
        "A French defender who played in Serie A",
      ),
      LocalizedText(
        'فاز بكأس العالم 1998 ويورو 2000',
        "Won the 1998 World Cup and Euro 2000",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'vidic',
    name: LocalizedText('نيمانيا فيديتش', "Nemanja Vidic"),
    short: LocalizedText('فيديتش', "Vidic"),
    role: PlayerRole.df,
    rating: 88,
    legend: true,
    clues: [
      LocalizedText(
        'مدافع اعتزل بعد 2015',
        "A defender who retired after 2015",
      ),
      LocalizedText('مدافع صربي', "A Serbian defender"),
      LocalizedText(
        'شكّل ثنائياً شهيراً مع ريو فرديناند',
        "Formed a famous pairing with Rio Ferdinand",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'wael_gomaa',
    name: LocalizedText('وائل جمعة', "Wael Gomaa"),
    short: LocalizedText('وائل جمعة', "Gomaa"),
    role: PlayerRole.df,
    rating: 87,
    legend: true,
    clues: [
      LocalizedText(
        'مدافع اعتزل بعد 2010',
        "A defender who retired after 2010",
      ),
      LocalizedText(
        'مدافع مصري لعب للأهلي',
        "An Egyptian defender who played for Al Ahly",
      ),
      LocalizedText(
        'فاز بأمم أفريقيا 3 مرات متتالية 2006–2010',
        "Won AFCON three times in a row, 2006–2010",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'hany_ramzy',
    name: LocalizedText('هاني رمزي', "Hany Ramzy"),
    short: LocalizedText('هاني رمزي', "Ramzy"),
    role: PlayerRole.df,
    rating: 86,
    legend: true,
    clues: [
      LocalizedText(
        'مدافع اعتزل قبل 2010',
        "A defender who retired before 2010",
      ),
      LocalizedText(
        'مدافع مصري احترف في ألمانيا',
        "An Egyptian defender who played in Germany",
      ),
      LocalizedText(
        'شارك مع مصر في كأس العالم 1990',
        "Played for Egypt at the 1990 World Cup",
      ),
    ],
  ),

  // ───────────────────────────── Midfielders ─────────────────────────────
  AuctionPlayer(
    id: 'aboutrika',
    name: LocalizedText('محمد أبوتريكة', "Mohamed Aboutrika"),
    short: LocalizedText('أبوتريكة', "Aboutrika"),
    role: PlayerRole.mf,
    label: 'CAM',
    rating: 91,
    legend: true,
    clues: [
      LocalizedText(
        'صانع ألعاب اعتزل بعد 2010',
        "A playmaker who retired after 2010",
      ),
      LocalizedText(
        'لاعب مصري تألق مع الأهلي',
        "An Egyptian who shone at Al Ahly",
      ),
      LocalizedText(
        'لعب للترسانة قبل انتقاله للأهلي',
        "Played for Tersana before joining Al Ahly",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'ahmed_hassan',
    name: LocalizedText('أحمد حسن', "Ahmed Hassan"),
    short: LocalizedText('أحمد حسن', "A. Hassan"),
    role: PlayerRole.mf,
    label: 'RM',
    rating: 89,
    legend: true,
    clues: [
      LocalizedText(
        'لاعب وسط اعتزل بعد 2010',
        "A midfielder who retired after 2010",
      ),
      LocalizedText(
        'مصري احترف في الدوري التركي',
        "An Egyptian who played in the Turkish league",
      ),
      LocalizedText(
        'فاز بكأس أمم أفريقيا 4 مرات',
        "Won the Africa Cup of Nations four times",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'barakat',
    name: LocalizedText('محمد بركات', "Mohamed Barakat"),
    short: LocalizedText('بركات', "Barakat"),
    role: PlayerRole.mf,
    label: 'RM',
    rating: 86,
    legend: true,
    clues: [
      LocalizedText(
        'لاعب وسط اعتزل بعد 2010',
        "A midfielder who retired after 2010",
      ),
      LocalizedText('مصري لعب للأهلي', "An Egyptian who played for Al Ahly"),
      LocalizedText(
        'لعب للإسماعيلي وفي الخليج قبل الأهلي',
        "Played for Ismaily and in the Gulf before Al Ahly",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'zidane',
    name: LocalizedText('زين الدين زيدان', "Zinedine Zidane"),
    short: LocalizedText('زيدان', "Zidane"),
    role: PlayerRole.mf,
    label: 'CAM',
    rating: 97,
    legend: true,
    clues: [
      LocalizedText(
        'صانع ألعاب اعتزل بعد 2000',
        "A playmaker who retired after 2000",
      ),
      LocalizedText(
        'فرنسي لعب في إيطاليا وإسبانيا',
        "A Frenchman who played in Italy and Spain",
      ),
      LocalizedText(
        'سجل في نهائيين لكأس العالم',
        "Scored in two World Cup finals",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'pirlo',
    name: LocalizedText('أندريا بيرلو', "Andrea Pirlo"),
    short: LocalizedText('بيرلو', "Pirlo"),
    role: PlayerRole.mf,
    rating: 92,
    legend: true,
    clues: [
      LocalizedText(
        'لاعب وسط اعتزل بعد 2015',
        "A midfielder who retired after 2015",
      ),
      LocalizedText(
        'إيطالي لعب لميلان ويوفنتوس',
        "An Italian who played for Milan and Juventus",
      ),
      LocalizedText(
        'أنهى مسيرته في نيويورك سيتي الأمريكي',
        "Ended his career at New York City FC",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'kaka',
    name: LocalizedText('كاكا', "Kaka"),
    short: LocalizedText('كاكا', "Kaka"),
    role: PlayerRole.mf,
    label: 'CAM',
    rating: 93,
    legend: true,
    clues: [
      LocalizedText(
        'صانع ألعاب اعتزل بعد 2015',
        "A playmaker who retired after 2015",
      ),
      LocalizedText(
        'برازيلي لعب لميلان',
        "A Brazilian who played for AC Milan",
      ),
      LocalizedText(
        'لعب لأورلاندو سيتي في الدوري الأمريكي',
        "Played for Orlando City in MLS",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'iniesta',
    name: LocalizedText('أندريس إنييستا', "Andres Iniesta"),
    short: LocalizedText('إنييستا', "Iniesta"),
    role: PlayerRole.mf,
    rating: 93,
    legend: true,
    clues: [
      LocalizedText(
        'لاعب وسط اعتزل بعد 2020',
        "A midfielder who retired after 2020",
      ),
      LocalizedText(
        'إسباني لعب لبرشلونة',
        "A Spaniard who played for Barcelona",
      ),
      LocalizedText(
        'لعب في اليابان مع فيسيل كوبي',
        "Played in Japan for Vissel Kobe",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'xavi',
    name: LocalizedText('تشافي هيرنانديز', "Xavi Hernandez"),
    short: LocalizedText('تشافي', "Xavi"),
    role: PlayerRole.mf,
    rating: 93,
    legend: true,
    clues: [
      LocalizedText(
        'لاعب وسط اعتزل بعد 2015',
        "A midfielder who retired after 2015",
      ),
      LocalizedText(
        'إسباني لعب لبرشلونة',
        "A Spaniard who played for Barcelona",
      ),
      LocalizedText(
        'أنهى مسيرته في السد القطري',
        "Ended his career at Al Sadd in Qatar",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'gerrard',
    name: LocalizedText('ستيفن جيرارد', "Steven Gerrard"),
    short: LocalizedText('جيرارد', "Gerrard"),
    role: PlayerRole.mf,
    rating: 91,
    legend: true,
    clues: [
      LocalizedText(
        'لاعب وسط اعتزل بعد 2015',
        "A midfielder who retired after 2015",
      ),
      LocalizedText(
        'إنجليزي لعب لليفربول',
        "An Englishman who played for Liverpool",
      ),
      LocalizedText(
        'لعب للوس أنجلوس جالاكسي في آخر مسيرته',
        "Played for LA Galaxy late in his career",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'lampard',
    name: LocalizedText('فرانك لامبارد', "Frank Lampard"),
    short: LocalizedText('لامبارد', "Lampard"),
    role: PlayerRole.mf,
    rating: 90,
    legend: true,
    clues: [
      LocalizedText(
        'لاعب وسط اعتزل بعد 2015',
        "A midfielder who retired after 2015",
      ),
      LocalizedText(
        'إنجليزي لعب لتشيلسي',
        "An Englishman who played for Chelsea",
      ),
      LocalizedText(
        'بدأ مسيرته في وست هام يونايتد',
        "Started his career at West Ham United",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'scholes',
    name: LocalizedText('بول سكولز', "Paul Scholes"),
    short: LocalizedText('سكولز', "Scholes"),
    role: PlayerRole.mf,
    rating: 89,
    legend: true,
    clues: [
      LocalizedText(
        'لاعب وسط اعتزل بعد 2010',
        "A midfielder who retired after 2010",
      ),
      LocalizedText(
        'إنجليزي لعب لنادٍ واحد طوال مسيرته',
        "An Englishman who played for one club only",
      ),
      LocalizedText(
        'من جيل 92 الشهير في أكاديمية يونايتد',
        "Part of Man United's famous Class of '92",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'yaya_toure',
    name: LocalizedText('يايا توريه', "Yaya Toure"),
    short: LocalizedText('يايا توريه', "Y. Toure"),
    role: PlayerRole.mf,
    rating: 89,
    legend: true,
    clues: [
      LocalizedText(
        'لاعب وسط اعتزل بعد 2015',
        "A midfielder who retired after 2015",
      ),
      LocalizedText(
        'إيفواري لعب في الدوري الإنجليزي',
        "An Ivorian who played in the Premier League",
      ),
      LocalizedText(
        'فاز بجائزة أفضل لاعب أفريقي 4 مرات',
        "Won African Footballer of the Year four times",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'belloumi',
    name: LocalizedText('لخضر بلومي', "Lakhdar Belloumi"),
    short: LocalizedText('بلومي', "Belloumi"),
    role: PlayerRole.mf,
    label: 'CAM',
    rating: 87,
    legend: true,
    clues: [
      LocalizedText(
        'صانع ألعاب من جيل الثمانينات',
        "A playmaker from the 1980s",
      ),
      LocalizedText('لاعب جزائري', "An Algerian player"),
      LocalizedText(
        'سجل أمام ألمانيا الغربية في مونديال 1982',
        "Scored against West Germany at the 1982 World Cup",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'park_ji_sung',
    name: LocalizedText('بارك جي سونغ', "Park Ji-sung"),
    short: LocalizedText('بارك', "Park"),
    role: PlayerRole.mf,
    label: 'RM',
    rating: 86,
    legend: true,
    clues: [
      LocalizedText(
        'لاعب وسط اعتزل بعد 2010',
        "A midfielder who retired after 2010",
      ),
      LocalizedText(
        'آسيوي لعب لمانشستر يونايتد',
        "An Asian who played for Manchester United",
      ),
      LocalizedText(
        'كوري لعب لآيندهوفن الهولندي',
        "A Korean who played for PSV Eindhoven",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'platini',
    name: LocalizedText('ميشيل بلاتيني', "Michel Platini"),
    short: LocalizedText('بلاتيني', "Platini"),
    role: PlayerRole.mf,
    label: 'CAM',
    rating: 94,
    legend: true,
    clues: [
      LocalizedText(
        'صانع ألعاب من جيل الثمانينات',
        "A playmaker from the 1980s",
      ),
      LocalizedText(
        'فرنسي لعب ليوفنتوس',
        "A Frenchman who played for Juventus",
      ),
      LocalizedText(
        'فاز بالكرة الذهبية 3 مرات',
        "Won the Ballon d'Or three times",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'zico',
    name: LocalizedText('زيكو', "Zico"),
    short: LocalizedText('زيكو', "Zico"),
    role: PlayerRole.mf,
    label: 'CAM',
    rating: 92,
    legend: true,
    clues: [
      LocalizedText(
        'صانع ألعاب من جيل الثمانينات',
        "A playmaker from the 1980s",
      ),
      LocalizedText(
        'برازيلي لعب لفلامنجو',
        "A Brazilian who played for Flamengo",
      ),
      LocalizedText(
        'درّب منتخب اليابان بعد اعتزاله',
        "Coached Japan after retiring",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'matthaus',
    name: LocalizedText('لوثار ماتيوس', "Lothar Matthaus"),
    short: LocalizedText('ماتيوس', "Matthaus"),
    role: PlayerRole.mf,
    rating: 92,
    legend: true,
    clues: [
      LocalizedText(
        'لاعب وسط اعتزل قبل 2005',
        "A midfielder who retired before 2005",
      ),
      LocalizedText(
        'ألماني لعب لبايرن وإنتر',
        "A German who played for Bayern and Inter",
      ),
      LocalizedText(
        'شارك في 5 نسخ من كأس العالم',
        "Was in five World Cup squads",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'makelele',
    name: LocalizedText('كلود ماكيليلي', "Claude Makelele"),
    short: LocalizedText('ماكيليلي', "Makelele"),
    role: PlayerRole.mf,
    label: 'CDM',
    rating: 88,
    legend: true,
    clues: [
      LocalizedText(
        'لاعب وسط دفاعي اعتزل بعد 2010',
        "A defensive midfielder who retired after 2010",
      ),
      LocalizedText(
        'فرنسي لعب لريال مدريد وتشيلسي',
        "A Frenchman who played for Real Madrid and Chelsea",
      ),
      LocalizedText(
        'وُلد في الكونغو ولعب لمنتخب فرنسا',
        "Born in Congo, played for France",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'seedorf',
    name: LocalizedText('كلارنس سيدورف', "Clarence Seedorf"),
    short: LocalizedText('سيدورف', "Seedorf"),
    role: PlayerRole.mf,
    rating: 89,
    legend: true,
    clues: [
      LocalizedText(
        'لاعب وسط اعتزل بعد 2010',
        "A midfielder who retired after 2010",
      ),
      LocalizedText('هولندي لعب لأياكس', "A Dutchman who played for Ajax"),
      LocalizedText(
        'لعب لريال مدريد وميلان',
        "Played for Real Madrid and AC Milan",
      ),
    ],
  ),

  // ───────────────────────────── Forwards ─────────────────────────────
  AuctionPlayer(
    id: 'pele',
    name: LocalizedText('بيليه', "Pele"),
    short: LocalizedText('بيليه', "Pele"),
    role: PlayerRole.fw,
    rating: 98,
    legend: true,
    clues: [
      LocalizedText('مهاجم من جيل الستينات', "A forward from the 1960s"),
      LocalizedText('برازيلي لعب لسانتوس', "A Brazilian who played for Santos"),
      LocalizedText(
        'لعب لنيويورك كوزموس في آخر مسيرته',
        "Played for New York Cosmos late in his career",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'maradona',
    name: LocalizedText('دييغو مارادونا', "Diego Maradona"),
    short: LocalizedText('مارادونا', "Maradona"),
    role: PlayerRole.fw,
    label: 'CF',
    rating: 98,
    legend: true,
    clues: [
      LocalizedText(
        'لاعب هجومي من جيل الثمانينات',
        "An attacker from the 1980s",
      ),
      LocalizedText(
        'أرجنتيني لعب لبرشلونة',
        "An Argentine who played for Barcelona",
      ),
      LocalizedText(
        'قاد نابولي للفوز بالدوري الإيطالي',
        "Led Napoli to the Serie A title",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'ronaldo_r9',
    name: LocalizedText('رونالدو نازاريو', "Ronaldo Nazario"),
    short: LocalizedText('رونالدو', "Ronaldo"),
    role: PlayerRole.fw,
    rating: 97,
    legend: true,
    clues: [
      LocalizedText('مهاجم اعتزل بعد 2010', "A striker who retired after 2010"),
      LocalizedText(
        'برازيلي لعب في إسبانيا وإيطاليا',
        "A Brazilian who played in Spain and Italy",
      ),
      LocalizedText('لعب لإنتر ولميلان', "Played for both Inter and AC Milan"),
    ],
  ),
  AuctionPlayer(
    id: 'henry',
    name: LocalizedText('تييري هنري', "Thierry Henry"),
    short: LocalizedText('هنري', "Henry"),
    role: PlayerRole.fw,
    rating: 94,
    legend: true,
    clues: [
      LocalizedText('مهاجم اعتزل بعد 2010', "A striker who retired after 2010"),
      LocalizedText('فرنسي لعب لأرسنال', "A Frenchman who played for Arsenal"),
      LocalizedText(
        'أنهى مسيرته مع نيويورك ريد بولز',
        "Ended his career at New York Red Bulls",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'ronaldinho',
    name: LocalizedText('رونالدينيو', "Ronaldinho"),
    short: LocalizedText('رونالدينيو', "Ronaldinho"),
    role: PlayerRole.fw,
    label: 'LW',
    rating: 95,
    legend: true,
    clues: [
      LocalizedText(
        'لاعب هجومي اعتزل بعد 2015',
        "An attacker who retired after 2015",
      ),
      LocalizedText(
        'برازيلي لعب لباريس وبرشلونة',
        "A Brazilian who played for PSG and Barcelona",
      ),
      LocalizedText(
        'فاز بالكرة الذهبية وهو لاعب في برشلونة',
        "Won the Ballon d'Or as a Barcelona player",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'shevchenko',
    name: LocalizedText('أندريه شيفتشينكو', "Andriy Shevchenko"),
    short: LocalizedText('شيفتشينكو', "Shevchenko"),
    role: PlayerRole.fw,
    rating: 92,
    legend: true,
    clues: [
      LocalizedText('مهاجم اعتزل بعد 2010', "A striker who retired after 2010"),
      LocalizedText('مهاجم أوكراني', "A Ukrainian striker"),
      LocalizedText(
        'انتقل من ميلان إلى تشيلسي',
        "Moved from AC Milan to Chelsea",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'raul',
    name: LocalizedText('راؤول جونزاليس', "Raul Gonzalez"),
    short: LocalizedText('راؤول', "Raul"),
    role: PlayerRole.fw,
    rating: 92,
    legend: true,
    clues: [
      LocalizedText('مهاجم اعتزل بعد 2010', "A striker who retired after 2010"),
      LocalizedText(
        'إسباني لعب لريال مدريد',
        "A Spaniard who played for Real Madrid",
      ),
      LocalizedText(
        'انتقل من ريال مدريد إلى شالكه الألماني',
        "Moved from Real Madrid to Schalke",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'del_piero',
    name: LocalizedText('أليساندرو ديل بييرو', "Alessandro Del Piero"),
    short: LocalizedText('ديل بييرو', "Del Piero"),
    role: PlayerRole.fw,
    label: 'CF',
    rating: 91,
    legend: true,
    clues: [
      LocalizedText('مهاجم اعتزل بعد 2010', "A forward who retired after 2010"),
      LocalizedText(
        'إيطالي لعب ليوفنتوس',
        "An Italian who played for Juventus",
      ),
      LocalizedText(
        'لعب في أستراليا مع سيدني إف سي',
        "Played in Australia for Sydney FC",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'totti',
    name: LocalizedText('فرانشيسكو توتي', "Francesco Totti"),
    short: LocalizedText('توتي', "Totti"),
    role: PlayerRole.fw,
    label: 'CF',
    rating: 92,
    legend: true,
    clues: [
      LocalizedText('مهاجم اعتزل بعد 2015', "A forward who retired after 2015"),
      LocalizedText(
        'إيطالي لعب لنادٍ واحد طوال مسيرته',
        "An Italian who played for one club only",
      ),
      LocalizedText(
        'لاعب من روما فاز بكأس العالم 2006',
        "A Roma player who won the 2006 World Cup",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'van_basten',
    name: LocalizedText('ماركو فان باستن', "Marco van Basten"),
    short: LocalizedText('فان باستن', "Van Basten"),
    role: PlayerRole.fw,
    rating: 95,
    legend: true,
    clues: [
      LocalizedText(
        'مهاجم اعتزل قبل 2000',
        "A striker who retired before 2000",
      ),
      LocalizedText(
        'هولندي لعب لأياكس وميلان',
        "A Dutchman who played for Ajax and Milan",
      ),
      LocalizedText(
        'اعتزل مبكراً بسبب إصابة مزمنة في الكاحل',
        "Retired early due to a chronic ankle injury",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'cruyff',
    name: LocalizedText('يوهان كرويف', "Johan Cruyff"),
    short: LocalizedText('كرويف', "Cruyff"),
    role: PlayerRole.fw,
    label: 'CF',
    rating: 97,
    legend: true,
    clues: [
      LocalizedText('مهاجم من جيل السبعينات', "A forward from the 1970s"),
      LocalizedText(
        'هولندي لعب لأياكس وبرشلونة',
        "A Dutchman who played for Ajax and Barcelona",
      ),
      LocalizedText(
        'لعب لبرشلونة ثم دربه وفاز بدوري الأبطال',
        "Played for Barça, later coached them to a European Cup",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'drogba',
    name: LocalizedText('ديدييه دروجبا', "Didier Drogba"),
    short: LocalizedText('دروجبا', "Drogba"),
    role: PlayerRole.fw,
    rating: 91,
    legend: true,
    clues: [
      LocalizedText('مهاجم اعتزل بعد 2015', "A striker who retired after 2015"),
      LocalizedText('إيفواري لعب لتشيلسي', "An Ivorian who played for Chelsea"),
      LocalizedText(
        'لعب في الصين وتركيا بعد تشيلسي',
        "Played in China and Turkey after Chelsea",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'etoo',
    name: LocalizedText('صامويل إيتو', "Samuel Eto'o"),
    short: LocalizedText('إيتو', "Eto'o"),
    role: PlayerRole.fw,
    rating: 92,
    legend: true,
    clues: [
      LocalizedText('مهاجم اعتزل بعد 2015', "A striker who retired after 2015"),
      LocalizedText('مهاجم كاميروني', "A Cameroonian striker"),
      LocalizedText(
        'لعب لبرشلونة وإنتر ميلان',
        "Played for Barcelona and Inter Milan",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'weah',
    name: LocalizedText('جورج ويا', "George Weah"),
    short: LocalizedText('ويا', "Weah"),
    role: PlayerRole.fw,
    rating: 93,
    legend: true,
    clues: [
      LocalizedText(
        'مهاجم اعتزل قبل 2005',
        "A striker who retired before 2005",
      ),
      LocalizedText(
        'مهاجم أفريقي لعب في الدوري الفرنسي',
        "An African striker who played in Ligue 1",
      ),
      LocalizedText('لعب لميلان وتشيلسي', "Played for AC Milan and Chelsea"),
    ],
  ),
  AuctionPlayer(
    id: 'hossam_hassan',
    name: LocalizedText('حسام حسن', "Hossam Hassan"),
    short: LocalizedText('حسام حسن', "H. Hassan"),
    role: PlayerRole.fw,
    rating: 90,
    legend: true,
    clues: [
      LocalizedText('مهاجم اعتزل بعد 2005', "A striker who retired after 2005"),
      LocalizedText(
        'مصري لعب للأهلي والزمالك',
        "An Egyptian who played for Al Ahly and Zamalek",
      ),
      LocalizedText(
        'لعب لباوك اليوناني ونوشاتيل السويسري',
        "Played for PAOK and Neuchatel Xamax",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'mohamed_zidan',
    name: LocalizedText('محمد زيدان', "Mohamed Zidan"),
    short: LocalizedText('زيدان', "Zidan"),
    role: PlayerRole.fw,
    rating: 86,
    legend: true,
    clues: [
      LocalizedText('مهاجم اعتزل بعد 2010', "A striker who retired after 2010"),
      LocalizedText(
        'مهاجم مصري احترف في أوروبا',
        "An Egyptian striker who played in Europe",
      ),
      LocalizedText(
        'لعب في الدنمارك ثم ألمانيا',
        "Played in Denmark and then Germany",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'amr_zaki',
    name: LocalizedText('عمرو زكي', "Amr Zaki"),
    short: LocalizedText('عمرو زكي', "Zaki"),
    role: PlayerRole.fw,
    rating: 86,
    legend: true,
    clues: [
      LocalizedText('مهاجم اعتزل بعد 2010', "A striker who retired after 2010"),
      LocalizedText('مصري لعب للزمالك', "An Egyptian who played for Zamalek"),
      LocalizedText(
        'لعب لويجان في البريميرليج',
        "Played for Wigan in the Premier League",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'sami_al_jaber',
    name: LocalizedText('سامي الجابر', "Sami Al-Jaber"),
    short: LocalizedText('الجابر', "Al-Jaber"),
    role: PlayerRole.fw,
    rating: 88,
    legend: true,
    clues: [
      LocalizedText('مهاجم اعتزل بعد 2005', "A striker who retired after 2005"),
      LocalizedText('سعودي لعب للهلال', "A Saudi who played for Al Hilal"),
      LocalizedText('شارك في 4 نسخ من كأس العالم', "Played at four World Cups"),
    ],
  ),
  AuctionPlayer(
    id: 'younis_mahmoud',
    name: LocalizedText('يونس محمود', "Younis Mahmoud"),
    short: LocalizedText('يونس محمود', "Younis"),
    role: PlayerRole.fw,
    rating: 87,
    legend: true,
    clues: [
      LocalizedText('مهاجم اعتزل بعد 2015', "A striker who retired after 2015"),
      LocalizedText('مهاجم عراقي', "An Iraqi striker"),
      LocalizedText(
        'قائد منتخب فاز بكأس آسيا ولعب في قطر',
        "Captained an Asian Cup winner and played in Qatar",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'madjer',
    name: LocalizedText('رابح ماجر', "Rabah Madjer"),
    short: LocalizedText('ماجر', "Madjer"),
    role: PlayerRole.fw,
    rating: 89,
    legend: true,
    clues: [
      LocalizedText('مهاجم من جيل الثمانينات', "A striker from the 1980s"),
      LocalizedText(
        'جزائري لعب في البرتغال',
        "An Algerian who played in Portugal",
      ),
      LocalizedText(
        'لاعب عربي فاز بكأس أوروبا للأندية الأبطال',
        "An Arab player who won the European Cup",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'figo',
    name: LocalizedText('لويس فيغو', "Luis Figo"),
    short: LocalizedText('فيغو', "Figo"),
    role: PlayerRole.fw,
    label: 'RW',
    rating: 92,
    legend: true,
    clues: [
      LocalizedText('جناح اعتزل بعد 2005', "A winger who retired after 2005"),
      LocalizedText(
        'برتغالي لعب لبرشلونة',
        "A Portuguese who played for Barcelona",
      ),
      LocalizedText(
        'انتقل مباشرة من برشلونة لريال مدريد',
        "Moved straight from Barcelona to Real Madrid",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'ibrahimovic',
    name: LocalizedText('زلاتان إبراهيموفيتش', "Zlatan Ibrahimovic"),
    short: LocalizedText('إبراهيموفيتش', "Ibrahimovic"),
    role: PlayerRole.fw,
    rating: 93,
    legend: true,
    clues: [
      LocalizedText('مهاجم اعتزل بعد 2020', "A striker who retired after 2020"),
      LocalizedText('مهاجم سويدي', "A Swedish striker"),
      LocalizedText(
        'لعب لبرشلونة وإنتر وميلان ويوفنتوس',
        "Played for Barcelona, Inter, Milan and Juventus",
      ),
    ],
  ),
];
