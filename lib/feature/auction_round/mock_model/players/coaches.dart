import 'package:fii90/core/localization/localized_text.dart';
import 'package:fii90/feature/auction_round/mock_model/auction_player.dart';

const coaches = <AuctionPlayer>[
  AuctionPlayer(
    id: 'guardiola',
    name: LocalizedText('بيب جوارديولا', "Pep Guardiola"),
    short: LocalizedText('جوارديولا', "Guardiola"),
    role: PlayerRole.co,
    rating: 95,
    clues: [
      LocalizedText(
        'مدرب فاز بدوري الأبطال أكثر من مرة',
        "A coach who won the Champions League more than once",
      ),
      LocalizedText(
        'مدرب إسباني درّب في الدوري الإنجليزي',
        "A Spanish coach who managed in the Premier League",
      ),
      LocalizedText(
        'حقق الثلاثية مع ناديين مختلفين',
        "Won the treble with two different clubs",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'ancelotti',
    name: LocalizedText('كارلو أنشيلوتي', "Carlo Ancelotti"),
    short: LocalizedText('أنشيلوتي', "Ancelotti"),
    role: PlayerRole.co,
    rating: 94,
    clues: [
      LocalizedText(
        'مدرب فاز بالدوري في أكثر من دولة',
        "A coach who won league titles in several countries",
      ),
      LocalizedText(
        'مدرب إيطالي درّب ريال مدريد',
        "An Italian coach who managed Real Madrid",
      ),
      LocalizedText(
        'درّب ميلان وتشيلسي وريال مدريد',
        "Managed Milan, Chelsea and Real Madrid",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'mourinho',
    name: LocalizedText('جوزيه مورينيو', "Jose Mourinho"),
    short: LocalizedText('مورينيو', "Mourinho"),
    role: PlayerRole.co,
    rating: 92,
    clues: [
      LocalizedText(
        'مدرب فاز بدوري الأبطال مع ناديين',
        "A coach who won the Champions League with two clubs",
      ),
      LocalizedText('مدرب برتغالي', "A Portuguese coach"),
      LocalizedText(
        'درّب في إنجلترا وإيطاليا وإسبانيا',
        "Managed in England, Italy and Spain",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'klopp',
    name: LocalizedText('يورجن كلوب', "Jurgen Klopp"),
    short: LocalizedText('كلوب', "Klopp"),
    role: PlayerRole.co,
    rating: 93,
    clues: [
      LocalizedText(
        'مدرب فاز بدوري الأبطال والدوري الإنجليزي',
        "A coach who won the Champions League and Premier League",
      ),
      LocalizedText('مدرب ألماني', "A German coach"),
      LocalizedText(
        'درّب ماينز ثم بوروسيا دورتموند',
        "Managed Mainz and then Borussia Dortmund",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'zidane_coach',
    name: LocalizedText('زين الدين زيدان', "Zinedine Zidane"),
    short: LocalizedText('زيدان', "Zidane"),
    role: PlayerRole.co,
    rating: 92,
    clues: [
      LocalizedText(
        'مدرب فاز بدوري الأبطال',
        "A coach who won the Champions League",
      ),
      LocalizedText(
        'مدرب فرنسي درّب ريال مدريد',
        "A French coach who managed Real Madrid",
      ),
      LocalizedText(
        'فاز بدوري الأبطال لاعباً ومدرباً مع نفس النادي',
        "Won the Champions League as player and coach of one club",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'simeone',
    name: LocalizedText('دييغو سيميوني', "Diego Simeone"),
    short: LocalizedText('سيميوني', "Simeone"),
    role: PlayerRole.co,
    rating: 90,
    clues: [
      LocalizedText(
        'مدرب لاتيني يدرب في أوروبا',
        "A Latin American coach working in Europe",
      ),
      LocalizedText('مدرب أرجنتيني', "An Argentine coach"),
      LocalizedText(
        'خسر نهائيين لدوري الأبطال أمام ريال مدريد',
        "Lost two Champions League finals to Real Madrid",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'arteta',
    name: LocalizedText('ميكيل أرتيتا', "Mikel Arteta"),
    short: LocalizedText('أرتيتا', "Arteta"),
    role: PlayerRole.co,
    rating: 88,
    clues: [
      LocalizedText(
        'مدرب شاب في الدوري الإنجليزي',
        "A young coach in the Premier League",
      ),
      LocalizedText(
        'مدرب إسباني لعب سابقاً في البريميرليج',
        "A Spanish coach who played in the Premier League",
      ),
      LocalizedText(
        'كان مساعداً لجوارديولا في مانشستر سيتي',
        "Was Guardiola's assistant at Manchester City",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'xabi_alonso',
    name: LocalizedText('تشابي ألونسو', "Xabi Alonso"),
    short: LocalizedText('ألونسو', "Xabi Alonso"),
    role: PlayerRole.co,
    rating: 89,
    clues: [
      LocalizedText(
        'مدرب شاب كان لاعباً من الطراز الأول',
        "A young coach who was a top-level player",
      ),
      LocalizedText(
        'إسباني لعب لليفربول وريال مدريد',
        "A Spaniard who played for Liverpool and Real Madrid",
      ),
      LocalizedText(
        'أنهى هيمنة بايرن على الدوري الألماني',
        "Ended Bayern's grip on the Bundesliga title",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'luis_enrique',
    name: LocalizedText('لويس إنريكي', "Luis Enrique"),
    short: LocalizedText('إنريكي', "Luis Enrique"),
    role: PlayerRole.co,
    rating: 91,
    clues: [
      LocalizedText(
        'مدرب فاز بدوري الأبطال مع ناديين',
        "A coach who won the Champions League with two clubs",
      ),
      LocalizedText(
        'مدرب إسباني درّب منتخب إسبانيا',
        "A Spanish coach who managed Spain",
      ),
      LocalizedText(
        'لعب لريال مدريد ثم لبرشلونة',
        "Played for Real Madrid and then Barcelona",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'flick',
    name: LocalizedText('هانزي فليك', "Hansi Flick"),
    short: LocalizedText('فليك', "Flick"),
    role: PlayerRole.co,
    rating: 89,
    clues: [
      LocalizedText('مدرب ألماني', "A German coach"),
      LocalizedText(
        'مدرب درّب منتخب ألمانيا',
        "A coach who managed the Germany national team",
      ),
      LocalizedText(
        'درّب بايرن ميونخ وبرشلونة',
        "Managed Bayern Munich and Barcelona",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'conte',
    name: LocalizedText('أنطونيو كونتي', "Antonio Conte"),
    short: LocalizedText('كونتي', "Conte"),
    role: PlayerRole.co,
    rating: 88,
    clues: [
      LocalizedText('مدرب إيطالي', "An Italian coach"),
      LocalizedText(
        'فاز بالدوري الإيطالي مع أكثر من نادٍ',
        "Won Serie A with more than one club",
      ),
      LocalizedText('درّب يوفنتوس وتشيلسي', "Managed Juventus and Chelsea"),
    ],
  ),
  AuctionPlayer(
    id: 'slot',
    name: LocalizedText('آرني سلوت', "Arne Slot"),
    short: LocalizedText('سلوت', "Slot"),
    role: PlayerRole.co,
    rating: 87,
    clues: [
      LocalizedText(
        'مدرب فاز بالدوري الإنجليزي',
        "A coach who won the Premier League",
      ),
      LocalizedText('مدرب هولندي', "A Dutch coach"),
      LocalizedText(
        'فاز بالدوري الإنجليزي في موسمه الأول',
        "Won the Premier League in his first season",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'hossam_hassan_coach',
    name: LocalizedText('حسام حسن', "Hossam Hassan"),
    short: LocalizedText('حسام حسن', "H. Hassan"),
    role: PlayerRole.co,
    rating: 82,
    clues: [
      LocalizedText('مدرب عربي', "An Arab coach"),
      LocalizedText(
        'مدرب مصري لعب للأهلي والزمالك',
        "An Egyptian coach who played for Al Ahly and Zamalek",
      ),
      LocalizedText('درّب منتخب الأردن', "Managed the Jordan national team"),
    ],
  ),
  AuctionPlayer(
    id: 'koller',
    name: LocalizedText('مارسيل كولر', "Marcel Koller"),
    short: LocalizedText('كولر', "Koller"),
    role: PlayerRole.co,
    rating: 84,
    clues: [
      LocalizedText(
        'مدرب أوروبي عمل في أفريقيا',
        "A European coach who worked in Africa",
      ),
      LocalizedText('مدرب سويسري', "A Swiss coach"),
      LocalizedText(
        'فاز بدوري أبطال أفريقيا مرتين مع الأهلي',
        "Won the CAF Champions League twice with Al Ahly",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'regragui',
    name: LocalizedText('وليد الركراكي', "Walid Regragui"),
    short: LocalizedText('الركراكي', "Regragui"),
    role: PlayerRole.co,
    rating: 87,
    clues: [
      LocalizedText('مدرب عربي', "An Arab coach"),
      LocalizedText(
        'مدرب مغربي لعب في فرنسا',
        "A Moroccan coach who played in France",
      ),
      LocalizedText(
        'فاز بدوري أبطال أفريقيا مع الوداد',
        "Won the CAF Champions League with Wydad",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'mancini',
    name: LocalizedText('روبرتو مانشيني', "Roberto Mancini"),
    short: LocalizedText('مانشيني', "Mancini"),
    role: PlayerRole.co,
    rating: 86,
    clues: [
      LocalizedText('مدرب إيطالي', "An Italian coach"),
      LocalizedText(
        'مدرب درّب مانشستر سيتي',
        "A coach who managed Manchester City",
      ),
      LocalizedText(
        'درّب منتخب السعودية',
        "Managed the Saudi Arabia national team",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'ferguson',
    name: LocalizedText('أليكس فيرجسون', "Alex Ferguson"),
    short: LocalizedText('فيرجسون', "Ferguson"),
    role: PlayerRole.co,
    rating: 95,
    clues: [
      LocalizedText(
        'مدرب اعتزل التدريب',
        "A coach who has retired from management",
      ),
      LocalizedText('مدرب اسكتلندي', "A Scottish coach"),
      LocalizedText(
        'فاز بدوري الأبطال مع مانشستر يونايتد',
        "Won the European Cup with Manchester United",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'hassan_shehata',
    name: LocalizedText('حسن شحاتة', "Hassan Shehata"),
    short: LocalizedText('شحاتة', "Shehata"),
    role: PlayerRole.co,
    rating: 86,
    clues: [
      LocalizedText('مدرب أفريقي', "An African coach"),
      LocalizedText(
        'مدرب مصري لعب للزمالك',
        "An Egyptian coach who played for Zamalek",
      ),
      LocalizedText(
        'قاد منتخب مصر للفوز بأمم أفريقيا',
        "Led Egypt to an Africa Cup of Nations title",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'manuel_jose',
    name: LocalizedText('مانويل جوزيه', "Manuel Jose"),
    short: LocalizedText('جوزيه', "Manuel Jose"),
    role: PlayerRole.co,
    rating: 85,
    clues: [
      LocalizedText(
        'مدرب أوروبي عمل في أفريقيا',
        "A European coach who worked in Africa",
      ),
      LocalizedText('مدرب برتغالي', "A Portuguese coach"),
      LocalizedText(
        'درّب الأهلي على فترات وحقق ألقاباً قارية',
        "Had several spells at Al Ahly, winning continental titles",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'scaloni',
    name: LocalizedText('ليونيل سكالوني', "Lionel Scaloni"),
    short: LocalizedText('سكالوني', "Scaloni"),
    role: PlayerRole.co,
    rating: 89,
    clues: [
      LocalizedText(
        'مدرب قاد منتخباً وطنياً',
        "A coach who has led a national team",
      ),
      LocalizedText('مدرب أرجنتيني', "An Argentine coach"),
      LocalizedText(
        'فاز بكأس العالم وكوبا أمريكا مدرباً',
        "Won the World Cup and Copa America as a coach",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'deschamps',
    name: LocalizedText('ديدييه ديشان', "Didier Deschamps"),
    short: LocalizedText('ديشان', "Deschamps"),
    role: PlayerRole.co,
    rating: 89,
    clues: [
      LocalizedText(
        'مدرب قاد منتخباً وطنياً',
        "A coach who has led a national team",
      ),
      LocalizedText(
        'فرنسي درّب موناكو ويوفنتوس',
        "A Frenchman who managed Monaco and Juventus",
      ),
      LocalizedText(
        'فاز بكأس العالم لاعباً ومدرباً',
        "Won the World Cup as a player and as a coach",
      ),
    ],
  ),
];
