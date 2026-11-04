import 'package:fii90/core/localization/localized_text.dart';
import 'package:fii90/feature/auction_round/mock_model/auction_player.dart';

/// Currently active players rated 85–97.
const elitePlayers = <AuctionPlayer>[
  // ───────────────────────────── 90+ ─────────────────────────────
  AuctionPlayer(
    id: 'kylian_mbappe',
    name: LocalizedText('كيليان مبابي', 'Kylian Mbappé'),
    short: LocalizedText('مبابي', 'Mbappé'),
    role: PlayerRole.fw,
    rating: 92,
    clues: [
      LocalizedText('مهاجم يلعب في الدوري الإسباني', 'A forward in La Liga'),
      LocalizedText(
        'لاعب فرنسي لعب لباريس سان جيرمان',
        'A French player who played for PSG',
      ),
      LocalizedText(
        'فاز بكأس العالم وهو مراهق',
        'Won the World Cup as a teenager',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'erling_haaland',
    name: LocalizedText('إيرلينج هالاند', 'Erling Haaland'),
    short: LocalizedText('هالاند', 'Haaland'),
    role: PlayerRole.fw,
    rating: 91,
    clues: [
      LocalizedText(
        'مهاجم يلعب في الدوري الإنجليزي',
        'A striker in the Premier League',
      ),
      LocalizedText(
        'لاعب اسكندنافي لعب في الدوري الألماني',
        'A Scandinavian who played in the Bundesliga',
      ),
      LocalizedText(
        'حطم رقم أكثر أهداف في موسم واحد بالبريمرليج',
        'Broke the record for most goals in a Premier League season',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'lamine_yamal',
    name: LocalizedText('لامين يامال', 'Lamine Yamal'),
    short: LocalizedText('يامال', 'Yamal'),
    role: PlayerRole.fw,
    label: 'RW',
    rating: 91,
    clues: [
      LocalizedText('جناح يلعب في الدوري الإسباني', 'A winger in La Liga'),
      LocalizedText(
        'لاعب إسباني من أكاديمية لاماسيا',
        'A Spanish La Masia graduate',
      ),
      LocalizedText(
        'فاز بجائزة كوبا لأفضل لاعب شاب مرتين',
        'Won the Kopa Trophy for best young player twice',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'mo_salah',
    name: LocalizedText('محمد صلاح', 'Mohamed Salah'),
    short: LocalizedText('صلاح', 'Salah'),
    role: PlayerRole.fw,
    label: 'RW',
    rating: 90,
    clues: [
      LocalizedText(
        'جناح يلعب في الدوري التركي',
        'A winger in the Turkish Süper Lig',
      ),
      LocalizedText('لاعب عربي من شمال أفريقيا', 'A North African Arab player'),
      LocalizedText(
        'كسب الحذاء الذهبي للدوري الإنجليزي أكثر من مرة',
        'Won the Premier League Golden Boot more than once',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'ousmane_dembele',
    name: LocalizedText('عثمان ديمبيلي', 'Ousmane Dembélé'),
    short: LocalizedText('ديمبيلي', 'Dembélé'),
    role: PlayerRole.fw,
    label: 'RW',
    rating: 91,
    clues: [
      LocalizedText('مهاجم يلعب في الدوري الفرنسي', 'A forward in Ligue 1'),
      LocalizedText(
        'لاعب فرنسي لعب لبرشلونة',
        'A French player who played for Barcelona',
      ),
      LocalizedText(
        'فاز بالكرة الذهبية بعد موسم الثلاثية',
        "Won the Ballon d'Or after a treble-winning season",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'harry_kane',
    name: LocalizedText('هاري كين', 'Harry Kane'),
    short: LocalizedText('كين', 'Kane'),
    role: PlayerRole.fw,
    rating: 90,
    clues: [
      LocalizedText(
        'مهاجم يلعب في الدوري الألماني',
        'A striker in the Bundesliga',
      ),
      LocalizedText(
        'لاعب إنجليزي لعب لتوتنهام',
        'An English player who played for Tottenham',
      ),
      LocalizedText(
        'الهداف التاريخي لمنتخب بلاده',
        "His national team's all-time top scorer",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'vinicius_jr',
    name: LocalizedText('فينيسيوس جونيور', 'Vinícius Júnior'),
    short: LocalizedText('فينيسيوس', 'Vinícius'),
    role: PlayerRole.fw,
    label: 'LW',
    rating: 90,
    clues: [
      LocalizedText('جناح يلعب في الدوري الإسباني', 'A winger in La Liga'),
      LocalizedText(
        'لاعب برازيلي بدأ مسيرته في فلامنجو',
        'A Brazilian who started at Flamengo',
      ),
      LocalizedText(
        'سجل في نهائيين لدوري أبطال أوروبا',
        'Scored in two Champions League finals',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'raphinha',
    name: LocalizedText('رافينيا', 'Raphinha'),
    short: LocalizedText('رافينيا', 'Raphinha'),
    role: PlayerRole.fw,
    label: 'LW',
    rating: 90,
    clues: [
      LocalizedText('جناح يلعب في الدوري الإسباني', 'A winger in La Liga'),
      LocalizedText(
        'لاعب برازيلي لعب في الدوري الإنجليزي',
        'A Brazilian who played in the Premier League',
      ),
      LocalizedText(
        'تقاسم لقب هداف دوري الأبطال 2024-25',
        'Shared the 2024-25 Champions League top-scorer title',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'rodri',
    name: LocalizedText('رودري', 'Rodri'),
    short: LocalizedText('رودري', 'Rodri'),
    role: PlayerRole.mf,
    label: 'CDM',
    rating: 90,
    clues: [
      LocalizedText(
        'لاعب وسط دفاعي في الدوري الإسباني',
        'A holding midfielder in La Liga',
      ),
      LocalizedText(
        'لاعب إسباني لعب لأتلتيكو مدريد',
        'A Spaniard who played for Atlético Madrid',
      ),
      LocalizedText(
        'سجل هدف الفوز في نهائي دوري الأبطال',
        'Scored the winner in a Champions League final',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'jude_bellingham',
    name: LocalizedText('جود بيلينجهام', 'Jude Bellingham'),
    short: LocalizedText('بيلينجهام', 'Bellingham'),
    role: PlayerRole.mf,
    label: 'CAM',
    rating: 90,
    clues: [
      LocalizedText(
        'لاعب وسط يلعب في الدوري الإسباني',
        'A midfielder in La Liga',
      ),
      LocalizedText(
        'لاعب إنجليزي لعب لدورتموند',
        'An English player who played for Dortmund',
      ),
      LocalizedText(
        'يرتدي القميص رقم 5 في ريال مدريد',
        'Wears the number 5 shirt at Real Madrid',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'pedri',
    name: LocalizedText('بيدري', 'Pedri'),
    short: LocalizedText('بيدري', 'Pedri'),
    role: PlayerRole.mf,
    rating: 90,
    clues: [
      LocalizedText(
        'لاعب وسط يلعب في الدوري الإسباني',
        'A midfielder in La Liga',
      ),
      LocalizedText(
        'لاعب إسباني من جزر الكناري',
        'A Spaniard from the Canary Islands',
      ),
      LocalizedText(
        'انضم لبرشلونة من لاس بالماس وهو مراهق',
        'Joined Barcelona from Las Palmas as a teenager',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'virgil_van_dijk',
    name: LocalizedText('فيرجيل فان دايك', 'Virgil van Dijk'),
    short: LocalizedText('فان دايك', 'Van Dijk'),
    role: PlayerRole.df,
    rating: 90,
    clues: [
      LocalizedText(
        'مدافع يلعب في الدوري الإنجليزي',
        'A defender in the Premier League',
      ),
      LocalizedText(
        'مدافع هولندي لعب في اسكتلندا',
        'A Dutch defender who played in Scotland',
      ),
      LocalizedText(
        'حل ثانياً في سباق الكرة الذهبية',
        "Finished runner-up in a Ballon d'Or vote",
      ),
    ],
  ),

  // ─────────────────────────── Goalkeepers ───────────────────────────
  AuctionPlayer(
    id: 'thibaut_courtois',
    name: LocalizedText('تيبو كورتوا', 'Thibaut Courtois'),
    short: LocalizedText('كورتوا', 'Courtois'),
    role: PlayerRole.gk,
    rating: 89,
    clues: [
      LocalizedText(
        'حارس مرمى يلعب في الدوري الإسباني',
        'A goalkeeper in La Liga',
      ),
      LocalizedText('حارس بلجيكي', 'A Belgian goalkeeper'),
      LocalizedText(
        'لعب لأتلتيكو مدريد وريال مدريد',
        'Played for both Atlético and Real Madrid',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'alisson_becker',
    name: LocalizedText('أليسون بيكر', 'Alisson Becker'),
    short: LocalizedText('أليسون', 'Alisson'),
    role: PlayerRole.gk,
    rating: 88,
    clues: [
      LocalizedText(
        'حارس مرمى يلعب في الدوري الإنجليزي',
        'A goalkeeper in the Premier League',
      ),
      LocalizedText(
        'حارس برازيلي لعب في الدوري الإيطالي',
        'A Brazilian keeper who played in Serie A',
      ),
      LocalizedText(
        'سجل هدفاً برأسه في مباراة رسمية',
        'Scored a headed goal in a competitive match',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'gianluigi_donnarumma',
    name: LocalizedText('جيانلويجي دوناروما', 'Gianluigi Donnarumma'),
    short: LocalizedText('دوناروما', 'Donnarumma'),
    role: PlayerRole.gk,
    rating: 89,
    clues: [
      LocalizedText(
        'حارس مرمى يلعب في الدوري الإنجليزي',
        'A goalkeeper in the Premier League',
      ),
      LocalizedText(
        'حارس إيطالي بدأ مسيرته في ميلان',
        'An Italian keeper who started at Milan',
      ),
      LocalizedText(
        'فاز بدوري الأبطال مع باريس سان جيرمان',
        'Won the Champions League with PSG',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'jan_oblak',
    name: LocalizedText('يان أوبلاك', 'Jan Oblak'),
    short: LocalizedText('أوبلاك', 'Oblak'),
    role: PlayerRole.gk,
    rating: 87,
    clues: [
      LocalizedText(
        'حارس مرمى يلعب في الدوري الإسباني',
        'A goalkeeper in La Liga',
      ),
      LocalizedText('حارس من منطقة البلقان', 'A goalkeeper from the Balkans'),
      LocalizedText(
        'فاز بجائزة زامورا لأفضل حارس في الليغا عدة مرات',
        'Won the Zamora Trophy several times',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'mike_maignan',
    name: LocalizedText('مايك ماينان', 'Mike Maignan'),
    short: LocalizedText('ماينان', 'Maignan'),
    role: PlayerRole.gk,
    rating: 87,
    clues: [
      LocalizedText(
        'حارس مرمى يلعب في الدوري الإيطالي',
        'A goalkeeper in Serie A',
      ),
      LocalizedText(
        'حارس فرنسي لعب لليل',
        'A French keeper who played for Lille',
      ),
      LocalizedText('فاز بالدوري الإيطالي مع ميلان', 'Won Serie A with Milan'),
    ],
  ),
  AuctionPlayer(
    id: 'david_raya',
    name: LocalizedText('دافيد رايا', 'David Raya'),
    short: LocalizedText('رايا', 'Raya'),
    role: PlayerRole.gk,
    rating: 87,
    clues: [
      LocalizedText(
        'حارس مرمى يلعب في الدوري الإنجليزي',
        'A goalkeeper in the Premier League',
      ),
      LocalizedText('حارس إسباني', 'A Spanish goalkeeper'),
      LocalizedText(
        'فاز بالقفاز الذهبي للبريمرليج أكثر من مرة',
        'Won the Premier League Golden Glove more than once',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'emiliano_martinez',
    name: LocalizedText('إيميليانو مارتينيز', 'Emiliano Martínez'),
    short: LocalizedText('مارتينيز', 'E. Martínez'),
    role: PlayerRole.gk,
    rating: 87,
    clues: [
      LocalizedText(
        'حارس مرمى يلعب في الدوري الإنجليزي',
        'A goalkeeper in the Premier League',
      ),
      LocalizedText('حارس أرجنتيني', 'An Argentine goalkeeper'),
      LocalizedText(
        'فاز بجائزة ياشين لأفضل حارس',
        'Won the Yashin Trophy for best goalkeeper',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'ederson',
    name: LocalizedText('إيدرسون', 'Ederson'),
    short: LocalizedText('إيدرسون', 'Ederson'),
    role: PlayerRole.gk,
    rating: 86,
    clues: [
      LocalizedText(
        'حارس مرمى يلعب في الدوري التركي',
        'A goalkeeper in the Turkish Süper Lig',
      ),
      LocalizedText(
        'حارس برازيلي لعب لبنفيكا',
        'A Brazilian keeper who played for Benfica',
      ),
      LocalizedText(
        'معروف بتمريراته الطويلة الدقيقة بالقدم',
        'Known for his accurate long passing',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'gregor_kobel',
    name: LocalizedText('جريجور كوبل', 'Gregor Kobel'),
    short: LocalizedText('كوبل', 'Kobel'),
    role: PlayerRole.gk,
    rating: 86,
    clues: [
      LocalizedText(
        'حارس مرمى يلعب في الدوري الألماني',
        'A goalkeeper in the Bundesliga',
      ),
      LocalizedText('حارس سويسري', 'A Swiss goalkeeper'),
      LocalizedText(
        'لعب نهائي دوري الأبطال 2024 مع دورتموند',
        'Played the 2024 Champions League final with Dortmund',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'yann_sommer',
    name: LocalizedText('يان سومر', 'Yann Sommer'),
    short: LocalizedText('سومر', 'Sommer'),
    role: PlayerRole.gk,
    rating: 85,
    clues: [
      LocalizedText(
        'حارس مرمى يلعب في الدوري البلجيكي',
        'A goalkeeper in the Belgian league',
      ),
      LocalizedText(
        'حارس سويسري لعب في الدوري الألماني',
        'A Swiss keeper who played in the Bundesliga',
      ),
      LocalizedText(
        'لعب لبايرن ميونخ ثم انتقل إلى إنتر',
        'Played for Bayern before joining Inter',
      ),
    ],
  ),

  // ─────────────────────────── Defenders ───────────────────────────
  AuctionPlayer(
    id: 'william_saliba',
    name: LocalizedText('ويليام صليبا', 'William Saliba'),
    short: LocalizedText('صليبا', 'Saliba'),
    role: PlayerRole.df,
    rating: 88,
    clues: [
      LocalizedText(
        'مدافع يلعب في الدوري الإنجليزي',
        'A defender in the Premier League',
      ),
      LocalizedText(
        'مدافع فرنسي لعب معاراً في الدوري الفرنسي',
        'A French defender who had loans in Ligue 1',
      ),
      LocalizedText(
        'تألق مع أرسنال بعد إعارة إلى مارسيليا',
        'Shone at Arsenal after a loan at Marseille',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'gabriel_magalhaes',
    name: LocalizedText('جابرييل ماجاليش', 'Gabriel Magalhães'),
    short: LocalizedText('جابرييل', 'Gabriel'),
    role: PlayerRole.df,
    rating: 87,
    clues: [
      LocalizedText(
        'مدافع يلعب في الدوري الإنجليزي',
        'A defender in the Premier League',
      ),
      LocalizedText(
        'مدافع برازيلي لعب لليل',
        'A Brazilian defender who played for Lille',
      ),
      LocalizedText(
        'معروف بأهدافه الكثيرة من الكرات الثابتة',
        'Known for scoring lots of set-piece goals',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'ruben_dias',
    name: LocalizedText('روبن دياز', 'Rúben Dias'),
    short: LocalizedText('دياز', 'Dias'),
    role: PlayerRole.df,
    rating: 87,
    clues: [
      LocalizedText(
        'مدافع يلعب في الدوري الإنجليزي',
        'A defender in the Premier League',
      ),
      LocalizedText(
        'مدافع برتغالي بدأ في بنفيكا',
        'A Portuguese defender who started at Benfica',
      ),
      LocalizedText(
        'فاز بجائزة أفضل لاعب في البريمرليج كمدافع',
        'Won Premier League Player of the Season as a defender',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'marquinhos',
    name: LocalizedText('ماركينيوس', 'Marquinhos'),
    short: LocalizedText('ماركينيوس', 'Marquinhos'),
    role: PlayerRole.df,
    rating: 86,
    clues: [
      LocalizedText('مدافع يلعب في الدوري الفرنسي', 'A defender in Ligue 1'),
      LocalizedText(
        'مدافع برازيلي لعب لروما',
        'A Brazilian defender who played for Roma',
      ),
      LocalizedText(
        'قاد ناديه لأول لقب في دوري الأبطال',
        'Captained his club to its first Champions League',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'antonio_rudiger',
    name: LocalizedText('أنطونيو روديجر', 'Antonio Rüdiger'),
    short: LocalizedText('روديجر', 'Rüdiger'),
    role: PlayerRole.df,
    rating: 86,
    clues: [
      LocalizedText('مدافع يلعب في الدوري الإسباني', 'A defender in La Liga'),
      LocalizedText(
        'مدافع ألماني لعب لتشيلسي',
        'A German defender who played for Chelsea',
      ),
      LocalizedText(
        'فاز بدوري الأبطال مع ناديين مختلفين',
        'Won the Champions League with two clubs',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'kim_min_jae',
    name: LocalizedText('كيم مين جاي', 'Kim Min-jae'),
    short: LocalizedText('كيم', 'Kim'),
    role: PlayerRole.df,
    rating: 85,
    clues: [
      LocalizedText(
        'مدافع يلعب في الدوري الألماني',
        'A defender in the Bundesliga',
      ),
      LocalizedText('مدافع آسيوي', 'An Asian defender'),
      LocalizedText(
        'أفضل مدافع في إيطاليا موسم تتويج نابولي',
        'Serie A best defender in Napoli\'s title season',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'alessandro_bastoni',
    name: LocalizedText('أليساندرو باستوني', 'Alessandro Bastoni'),
    short: LocalizedText('باستوني', 'Bastoni'),
    role: PlayerRole.df,
    rating: 87,
    clues: [
      LocalizedText('مدافع يلعب في الدوري الإيطالي', 'A defender in Serie A'),
      LocalizedText('مدافع إيطالي أعسر', 'A left-footed Italian defender'),
      LocalizedText(
        'لعب نهائيين لدوري الأبطال مع إنتر',
        'Played two Champions League finals with Inter',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'josko_gvardiol',
    name: LocalizedText('يوشكو جفارديول', 'Joško Gvardiol'),
    short: LocalizedText('جفارديول', 'Gvardiol'),
    role: PlayerRole.df,
    rating: 86,
    clues: [
      LocalizedText(
        'مدافع يلعب في الدوري الإنجليزي',
        'A defender in the Premier League',
      ),
      LocalizedText('مدافع كرواتي', 'A Croatian defender'),
      LocalizedText(
        'أغلى مدافع في التاريخ عند انتقاله',
        'The most expensive defender ever when he moved',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'eder_militao',
    name: LocalizedText('إيدير ميليتاو', 'Éder Militão'),
    short: LocalizedText('ميليتاو', 'Militão'),
    role: PlayerRole.df,
    rating: 85,
    clues: [
      LocalizedText('مدافع يلعب في الدوري الإسباني', 'A defender in La Liga'),
      LocalizedText(
        'مدافع برازيلي لعب في البرتغال',
        'A Brazilian defender who played in Portugal',
      ),
      LocalizedText(
        'انتقل من بورتو إلى ريال مدريد',
        'Moved from Porto to Real Madrid',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'achraf_hakimi',
    name: LocalizedText('أشرف حكيمي', 'Achraf Hakimi'),
    short: LocalizedText('حكيمي', 'Hakimi'),
    role: PlayerRole.df,
    label: 'RB',
    rating: 89,
    clues: [
      LocalizedText(
        'ظهير أيمن يلعب في الدوري الفرنسي',
        'A right-back in Ligue 1',
      ),
      LocalizedText(
        'لاعب مغربي نشأ في ريال مدريد',
        'A Moroccan who came through Real Madrid',
      ),
      LocalizedText(
        'وصل لنصف نهائي كأس العالم مع منتخب بلاده',
        'Reached a World Cup semi-final with his country',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'trent_alexander_arnold',
    name: LocalizedText('ترينت ألكسندر أرنولد', 'Trent Alexander-Arnold'),
    short: LocalizedText('أرنولد', 'Arnold'),
    role: PlayerRole.df,
    label: 'RB',
    rating: 86,
    clues: [
      LocalizedText(
        'ظهير أيمن يلعب في الدوري الإسباني',
        'A right-back in La Liga',
      ),
      LocalizedText(
        'لاعب إنجليزي من أكاديمية ليفربول',
        'An Englishman from Liverpool\'s academy',
      ),
      LocalizedText(
        'صنع أهدافاً قياسية لظهير في البريمرليج',
        'Set assist records for a Premier League full-back',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'nuno_mendes',
    name: LocalizedText('نونو منديش', 'Nuno Mendes'),
    short: LocalizedText('منديش', 'Mendes'),
    role: PlayerRole.df,
    label: 'LB',
    rating: 87,
    clues: [
      LocalizedText(
        'ظهير أيسر يلعب في الدوري الفرنسي',
        'A left-back in Ligue 1',
      ),
      LocalizedText(
        'لاعب برتغالي بدأ في سبورتنج لشبونة',
        'A Portuguese who started at Sporting CP',
      ),
      LocalizedText(
        'فاز بدوري الأبطال ودوري الأمم في 2025',
        'Won the Champions League and Nations League in 2025',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'jules_kounde',
    name: LocalizedText('جول كوندي', 'Jules Koundé'),
    short: LocalizedText('كوندي', 'Koundé'),
    role: PlayerRole.df,
    label: 'RB',
    rating: 86,
    clues: [
      LocalizedText(
        'ظهير أيمن يلعب في الدوري الإسباني',
        'A right-back in La Liga',
      ),
      LocalizedText(
        'لاعب فرنسي لعب لإشبيلية',
        'A Frenchman who played for Sevilla',
      ),
      LocalizedText(
        'تحول من قلب دفاع إلى ظهير أيمن في برشلونة',
        'Converted from centre-back to right-back at Barça',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'marc_cucurella',
    name: LocalizedText('مارك كوكوريا', 'Marc Cucurella'),
    short: LocalizedText('كوكوريا', 'Cucurella'),
    role: PlayerRole.df,
    label: 'LB',
    rating: 85,
    clues: [
      LocalizedText(
        'ظهير أيسر يلعب في الدوري الإسباني',
        'A left-back in La Liga',
      ),
      LocalizedText(
        'لاعب إسباني لعب لبرايتون',
        'A Spaniard who played for Brighton',
      ),
      LocalizedText(
        'فاز بيورو 2024 مع منتخب بلاده',
        'Won Euro 2024 with his country',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'jeremie_frimpong',
    name: LocalizedText('جيريمي فريمبونج', 'Jeremie Frimpong'),
    short: LocalizedText('فريمبونج', 'Frimpong'),
    role: PlayerRole.df,
    label: 'RB',
    rating: 85,
    clues: [
      LocalizedText(
        'ظهير أيمن يلعب في الدوري الإنجليزي',
        'A right-back in the Premier League',
      ),
      LocalizedText(
        'لاعب هولندي لعب لليفركوزن',
        'A Dutchman who played for Leverkusen',
      ),
      LocalizedText(
        'نشأ في أكاديمية مانشستر سيتي ولعب لسلتيك',
        'Came through Man City\'s academy, then Celtic',
      ),
    ],
  ),

  // ─────────────────────────── Midfielders ───────────────────────────
  AuctionPlayer(
    id: 'federico_valverde',
    name: LocalizedText('فيديريكو فالفيردي', 'Federico Valverde'),
    short: LocalizedText('فالفيردي', 'Valverde'),
    role: PlayerRole.mf,
    rating: 88,
    clues: [
      LocalizedText(
        'لاعب وسط يلعب في الدوري الإسباني',
        'A midfielder in La Liga',
      ),
      LocalizedText('لاعب وسط من أوروجواي', 'A Uruguayan midfielder'),
      LocalizedText(
        'فاز بدوري الأبطال مرتين مع ريال مدريد',
        'Won the Champions League twice with Real Madrid',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'declan_rice',
    name: LocalizedText('ديكلان رايس', 'Declan Rice'),
    short: LocalizedText('رايس', 'Rice'),
    role: PlayerRole.mf,
    rating: 88,
    clues: [
      LocalizedText(
        'لاعب وسط يلعب في الدوري الإنجليزي',
        'A midfielder in the Premier League',
      ),
      LocalizedText(
        'لاعب إنجليزي لعب لوست هام',
        'An Englishman who played for West Ham',
      ),
      LocalizedText(
        'رفع لقباً أوروبياً كقائد لوست هام',
        'Lifted a European trophy as West Ham captain',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'martin_odegaard',
    name: LocalizedText('مارتن أوديجارد', 'Martin Ødegaard'),
    short: LocalizedText('أوديجارد', 'Ødegaard'),
    role: PlayerRole.mf,
    label: 'CAM',
    rating: 87,
    clues: [
      LocalizedText(
        'لاعب وسط يلعب في الدوري الإنجليزي',
        'A midfielder in the Premier League',
      ),
      LocalizedText(
        'لاعب وسط اسكندنافي لعب لريال مدريد',
        'A Scandinavian midfielder who played for Real Madrid',
      ),
      LocalizedText(
        'يحمل شارة القيادة في ناديه ومنتخب بلاده',
        'Captains both his club and his country',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'florian_wirtz',
    name: LocalizedText('فلوريان فيرتز', 'Florian Wirtz'),
    short: LocalizedText('فيرتز', 'Wirtz'),
    role: PlayerRole.mf,
    label: 'CAM',
    rating: 88,
    clues: [
      LocalizedText(
        'لاعب وسط يلعب في الدوري الإنجليزي',
        'A midfielder in the Premier League',
      ),
      LocalizedText(
        'لاعب ألماني لعب لليفركوزن',
        'A German who played for Leverkusen',
      ),
      LocalizedText(
        'انتقل إلى ليفربول بصفقة قياسية',
        'Joined Liverpool in a record deal',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'jamal_musiala',
    name: LocalizedText('جمال موسيالا', 'Jamal Musiala'),
    short: LocalizedText('موسيالا', 'Musiala'),
    role: PlayerRole.mf,
    label: 'CAM',
    rating: 88,
    clues: [
      LocalizedText(
        'لاعب وسط يلعب في الدوري الألماني',
        'A midfielder in the Bundesliga',
      ),
      LocalizedText(
        'لاعب ألماني يلعب لبايرن ميونخ',
        'A German who plays for Bayern Munich',
      ),
      LocalizedText(
        'بدأ مسيرته في أكاديمية تشيلسي',
        'Started out in Chelsea\'s academy',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'vitinha',
    name: LocalizedText('فيتينيا', 'Vitinha'),
    short: LocalizedText('فيتينيا', 'Vitinha'),
    role: PlayerRole.mf,
    rating: 89,
    clues: [
      LocalizedText(
        'لاعب وسط يلعب في الدوري الفرنسي',
        'A midfielder in Ligue 1',
      ),
      LocalizedText(
        'لاعب برتغالي لعب لبورتو',
        'A Portuguese who played for Porto',
      ),
      LocalizedText(
        'فاز بالثلاثية مع باريس سان جيرمان',
        'Won the treble with PSG',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'joao_neves',
    name: LocalizedText('جواو نيفيش', 'João Neves'),
    short: LocalizedText('نيفيش', 'Neves'),
    role: PlayerRole.mf,
    rating: 87,
    clues: [
      LocalizedText(
        'لاعب وسط يلعب في الدوري الفرنسي',
        'A midfielder in Ligue 1',
      ),
      LocalizedText(
        'لاعب برتغالي بدأ في بنفيكا',
        'A Portuguese who started at Benfica',
      ),
      LocalizedText(
        'انتقل من بنفيكا إلى باريس وهو مراهق',
        'Joined PSG from Benfica as a teenager',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'nicolo_barella',
    name: LocalizedText('نيكولو باريلا', 'Nicolò Barella'),
    short: LocalizedText('باريلا', 'Barella'),
    role: PlayerRole.mf,
    rating: 87,
    clues: [
      LocalizedText(
        'لاعب وسط يلعب في الدوري الإيطالي',
        'A midfielder in Serie A',
      ),
      LocalizedText(
        'لاعب إيطالي من سردينيا لعب لكالياري',
        'A Sardinian who played for Cagliari',
      ),
      LocalizedText(
        'فاز ببطولة يورو 2020 مع منتخب بلاده',
        'Won Euro 2020 with his country',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'bruno_fernandes',
    name: LocalizedText('برونو فرنانديز', 'Bruno Fernandes'),
    short: LocalizedText('برونو', 'Bruno'),
    role: PlayerRole.mf,
    label: 'CAM',
    rating: 87,
    clues: [
      LocalizedText(
        'لاعب وسط يلعب في الدوري الإنجليزي',
        'A midfielder in the Premier League',
      ),
      LocalizedText(
        'لاعب برتغالي لعب لسبورتنج لشبونة',
        'A Portuguese who played for Sporting CP',
      ),
      LocalizedText(
        'يحمل شارة قيادة مانشستر يونايتد',
        'Captain of Manchester United',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'joshua_kimmich',
    name: LocalizedText('يوشوا كيميش', 'Joshua Kimmich'),
    short: LocalizedText('كيميش', 'Kimmich'),
    role: PlayerRole.mf,
    label: 'CDM',
    rating: 88,
    clues: [
      LocalizedText(
        'لاعب وسط يلعب في الدوري الألماني',
        'A midfielder in the Bundesliga',
      ),
      LocalizedText(
        'لاعب ألماني لعب للايبزيج',
        'A German who played for Leipzig',
      ),
      LocalizedText(
        'يلعب ظهيراً أيمن ولاعب وسط بنفس الكفاءة',
        'Equally good at right-back and in midfield',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'frenkie_de_jong',
    name: LocalizedText('فرينكي دي يونج', 'Frenkie de Jong'),
    short: LocalizedText('دي يونج', 'De Jong'),
    role: PlayerRole.mf,
    rating: 86,
    clues: [
      LocalizedText(
        'لاعب وسط يلعب في الدوري الإسباني',
        'A midfielder in La Liga',
      ),
      LocalizedText('لاعب هولندي لعب لأياكس', 'A Dutchman who played for Ajax'),
      LocalizedText(
        'بلغ نصف نهائي دوري الأبطال مع أياكس 2019',
        'Reached the 2019 UCL semi-final with Ajax',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'alexis_mac_allister',
    name: LocalizedText('أليكسيس ماك أليستر', 'Alexis Mac Allister'),
    short: LocalizedText('ماك أليستر', 'Mac Allister'),
    role: PlayerRole.mf,
    rating: 87,
    clues: [
      LocalizedText(
        'لاعب وسط يلعب في الدوري الإنجليزي',
        'A midfielder in the Premier League',
      ),
      LocalizedText(
        'لاعب أرجنتيني لعب لبرايتون',
        'An Argentine who played for Brighton',
      ),
      LocalizedText('فاز بكأس العالم 2022', 'Won the 2022 World Cup'),
    ],
  ),
  AuctionPlayer(
    id: 'dominik_szoboszlai',
    name: LocalizedText('دومينيك سوبوسلاي', 'Dominik Szoboszlai'),
    short: LocalizedText('سوبوسلاي', 'Szoboszlai'),
    role: PlayerRole.mf,
    rating: 86,
    clues: [
      LocalizedText(
        'لاعب وسط يلعب في الدوري الإنجليزي',
        'A midfielder in the Premier League',
      ),
      LocalizedText(
        'لاعب من وسط أوروبا لعب للايبزيج',
        'A Central European who played for Leipzig',
      ),
      LocalizedText(
        'لعب في النمسا لريد بول سالزبورج',
        'Played in Austria for Red Bull Salzburg',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'ryan_gravenberch',
    name: LocalizedText('رايان جرافينبيرش', 'Ryan Gravenberch'),
    short: LocalizedText('جرافينبيرش', 'Gravenberch'),
    role: PlayerRole.mf,
    label: 'CDM',
    rating: 86,
    clues: [
      LocalizedText(
        'لاعب وسط يلعب في الدوري الإنجليزي',
        'A midfielder in the Premier League',
      ),
      LocalizedText(
        'لاعب هولندي لعب لبايرن ميونخ',
        'A Dutchman who played for Bayern Munich',
      ),
      LocalizedText(
        'تحول لارتكاز أساسي في ليفربول البطل',
        'Became the anchor of a title-winning Liverpool',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'enzo_fernandez',
    name: LocalizedText('إنزو فرنانديز', 'Enzo Fernández'),
    short: LocalizedText('إنزو', 'Enzo'),
    role: PlayerRole.mf,
    rating: 86,
    clues: [
      LocalizedText(
        'لاعب وسط يلعب في الدوري الإنجليزي',
        'A midfielder in the Premier League',
      ),
      LocalizedText(
        'لاعب أرجنتيني لعب لبنفيكا',
        'An Argentine who played for Benfica',
      ),
      LocalizedText(
        'انتقل لتشيلسي في صفقة قياسية بريطانية',
        'Joined Chelsea in a British record deal',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'moises_caicedo',
    name: LocalizedText('مويسيس كايسيدو', 'Moisés Caicedo'),
    short: LocalizedText('كايسيدو', 'Caicedo'),
    role: PlayerRole.mf,
    label: 'CDM',
    rating: 87,
    clues: [
      LocalizedText(
        'لاعب وسط يلعب في الدوري الإنجليزي',
        'A midfielder in the Premier League',
      ),
      LocalizedText(
        'لاعب لاتيني لعب لبرايتون',
        'A South American who played for Brighton',
      ),
      LocalizedText(
        'فاز بكأس العالم للأندية مع تشيلسي',
        'Won the Club World Cup with Chelsea',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'cole_palmer',
    name: LocalizedText('كول بالمر', 'Cole Palmer'),
    short: LocalizedText('بالمر', 'Palmer'),
    role: PlayerRole.mf,
    label: 'CAM',
    rating: 87,
    clues: [
      LocalizedText(
        'لاعب وسط يلعب في الدوري الإنجليزي',
        'A midfielder in the Premier League',
      ),
      LocalizedText(
        'لاعب إنجليزي نشأ في مانشستر سيتي',
        'An Englishman who came through Man City',
      ),
      LocalizedText(
        'أفضل لاعب شاب في البريمرليج موسم 2023-24',
        'Premier League Young Player of 2023-24',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'tijjani_reijnders',
    name: LocalizedText('تيجاني رايندرز', 'Tijjani Reijnders'),
    short: LocalizedText('رايندرز', 'Reijnders'),
    role: PlayerRole.mf,
    rating: 85,
    clues: [
      LocalizedText(
        'لاعب وسط يلعب في الدوري السعودي',
        'A midfielder in the Saudi Pro League',
      ),
      LocalizedText(
        'لاعب هولندي لعب في الدوري الإيطالي',
        'A Dutchman who played in Serie A',
      ),
      LocalizedText(
        'انتقل من ميلان إلى البريمرليج في 2025',
        'Left Milan for the Premier League in 2025',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'martin_zubimendi',
    name: LocalizedText('مارتن زوبيميندي', 'Martín Zubimendi'),
    short: LocalizedText('زوبيميندي', 'Zubimendi'),
    role: PlayerRole.mf,
    label: 'CDM',
    rating: 86,
    clues: [
      LocalizedText(
        'لاعب وسط يلعب في الدوري الإنجليزي',
        'A midfielder in the Premier League',
      ),
      LocalizedText(
        'لاعب إسباني لعب لريال سوسيداد',
        'A Spaniard who played for Real Sociedad',
      ),
      LocalizedText(
        'انتقل من ريال سوسيداد إلى أرسنال',
        'Moved from Real Sociedad to Arsenal',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'bruno_guimaraes',
    name: LocalizedText('برونو جيماريش', 'Bruno Guimarães'),
    short: LocalizedText('جيماريش', 'Guimarães'),
    role: PlayerRole.mf,
    rating: 86,
    clues: [
      LocalizedText(
        'لاعب وسط يلعب في الدوري الإنجليزي',
        'A midfielder in the Premier League',
      ),
      LocalizedText(
        'لاعب برازيلي لعب لليون',
        'A Brazilian who played for Lyon',
      ),
      LocalizedText(
        'فاز بكأس الرابطة مع نيوكاسل 2025',
        'Won the 2025 League Cup with Newcastle',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'kevin_de_bruyne',
    name: LocalizedText('كيفين دي بروين', 'Kevin De Bruyne'),
    short: LocalizedText('دي بروين', 'De Bruyne'),
    role: PlayerRole.mf,
    label: 'CAM',
    rating: 86,
    clues: [
      LocalizedText(
        'لاعب وسط يلعب في الدوري الإيطالي',
        'A midfielder in Serie A',
      ),
      LocalizedText(
        'لاعب بلجيكي لعب في الدوري الألماني',
        'A Belgian who played in the Bundesliga',
      ),
      LocalizedText(
        'يتقاسم رقم أكثر تمريرات حاسمة بموسم بالبريمرليج',
        'Shares the record for most assists in a PL season',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'hakan_calhanoglu',
    name: LocalizedText('هاكان تشالهان أوغلو', 'Hakan Çalhanoğlu'),
    short: LocalizedText('تشالهان أوغلو', 'Çalhanoğlu'),
    role: PlayerRole.mf,
    label: 'CDM',
    rating: 85,
    clues: [
      LocalizedText(
        'لاعب وسط يلعب في الدوري الإيطالي',
        'A midfielder in Serie A',
      ),
      LocalizedText(
        'لاعب تركي لعب في الدوري الألماني',
        'A Turk who played in the Bundesliga',
      ),
      LocalizedText('لعب لقطبي مدينة ميلانو', 'Played for both Milan clubs'),
    ],
  ),
  AuctionPlayer(
    id: 'phil_foden',
    name: LocalizedText('فيل فودين', 'Phil Foden'),
    short: LocalizedText('فودين', 'Foden'),
    role: PlayerRole.mf,
    label: 'CAM',
    rating: 85,
    clues: [
      LocalizedText(
        'لاعب وسط يلعب في الدوري الإنجليزي',
        'A midfielder in the Premier League',
      ),
      LocalizedText(
        'لاعب إنجليزي من أكاديمية مانشستر سيتي',
        'An Englishman from Man City\'s academy',
      ),
      LocalizedText(
        'أفضل لاعب في البريمرليج موسم 2023-24',
        'Premier League Player of the Season 2023-24',
      ),
    ],
  ),

  // ─────────────────────────── Forwards ───────────────────────────
  AuctionPlayer(
    id: 'lautaro_martinez',
    name: LocalizedText('لاوتارو مارتينيز', 'Lautaro Martínez'),
    short: LocalizedText('لاوتارو', 'Lautaro'),
    role: PlayerRole.fw,
    rating: 88,
    clues: [
      LocalizedText('مهاجم يلعب في الدوري الإيطالي', 'A striker in Serie A'),
      LocalizedText('مهاجم أرجنتيني', 'An Argentine striker'),
      LocalizedText('هداف كوبا أمريكا 2024', 'Top scorer at Copa América 2024'),
    ],
  ),
  AuctionPlayer(
    id: 'victor_osimhen',
    name: LocalizedText('فيكتور أوسيمين', 'Victor Osimhen'),
    short: LocalizedText('أوسيمين', 'Osimhen'),
    role: PlayerRole.fw,
    rating: 87,
    clues: [
      LocalizedText(
        'مهاجم يلعب في الدوري التركي',
        'A striker in the Turkish league',
      ),
      LocalizedText('مهاجم نيجيري', 'A Nigerian striker'),
      LocalizedText(
        'هداف الدوري الإيطالي موسم تتويج نابولي',
        'Serie A top scorer in Napoli\'s title season',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'bukayo_saka',
    name: LocalizedText('بوكايو ساكا', 'Bukayo Saka'),
    short: LocalizedText('ساكا', 'Saka'),
    role: PlayerRole.fw,
    label: 'RW',
    rating: 88,
    clues: [
      LocalizedText(
        'جناح يلعب في الدوري الإنجليزي',
        'A winger in the Premier League',
      ),
      LocalizedText(
        'لاعب إنجليزي من أكاديمية أرسنال',
        'An Englishman from Arsenal\'s academy',
      ),
      LocalizedText(
        'أفضل لاعب في منتخب إنجلترا لعامين متتاليين',
        'England Player of the Year two years running',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'alexander_isak',
    name: LocalizedText('ألكسندر إيزاك', 'Alexander Isak'),
    short: LocalizedText('إيزاك', 'Isak'),
    role: PlayerRole.fw,
    rating: 87,
    clues: [
      LocalizedText(
        'مهاجم يلعب في الدوري الإنجليزي',
        'A striker in the Premier League',
      ),
      LocalizedText('مهاجم سويدي', 'A Swedish striker'),
      LocalizedText(
        'سجل في نهائي كأس الرابطة 2025',
        'Scored in the 2025 League Cup final',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'khvicha_kvaratskhelia',
    name: LocalizedText('خفيتشا كفاراتسخيليا', 'Khvicha Kvaratskhelia'),
    short: LocalizedText('كفارا', 'Kvara'),
    role: PlayerRole.fw,
    label: 'LW',
    rating: 88,
    clues: [
      LocalizedText('جناح يلعب في الدوري الفرنسي', 'A winger in Ligue 1'),
      LocalizedText(
        'لاعب من القوقاز لعب في الدوري الإيطالي',
        'A Caucasus-born player who played in Serie A',
      ),
      LocalizedText(
        'أفضل لاعب في إيطاليا موسم تتويج نابولي',
        'Serie A MVP in Napoli\'s title season',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'michael_olise',
    name: LocalizedText('مايكل أوليسيه', 'Michael Olise'),
    short: LocalizedText('أوليسيه', 'Olise'),
    role: PlayerRole.fw,
    label: 'RW',
    rating: 88,
    clues: [
      LocalizedText(
        'جناح يلعب في الدوري الألماني',
        'A winger in the Bundesliga',
      ),
      LocalizedText(
        'لاعب فرنسي لعب في الدوري الإنجليزي',
        'A Frenchman who played in the Premier League',
      ),
      LocalizedText(
        'وُلد في لندن واختار تمثيل فرنسا',
        'Born in London but chose to play for France',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'julian_alvarez',
    name: LocalizedText('خوليان ألفاريز', 'Julián Álvarez'),
    short: LocalizedText('ألفاريز', 'Álvarez'),
    role: PlayerRole.fw,
    label: 'CF',
    rating: 88,
    clues: [
      LocalizedText('مهاجم يلعب في الدوري الإسباني', 'A forward in La Liga'),
      LocalizedText(
        'مهاجم أرجنتيني لعب لمانشستر سيتي',
        'An Argentine who played for Man City',
      ),
      LocalizedText(
        'فاز بكأس العالم ودوري الأبطال في موسم واحد',
        'Won the World Cup and the UCL in the same season',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'luis_diaz',
    name: LocalizedText('لويس دياز', 'Luis Díaz'),
    short: LocalizedText('دياز', 'L. Díaz'),
    role: PlayerRole.fw,
    label: 'LW',
    rating: 87,
    clues: [
      LocalizedText(
        'جناح يلعب في الدوري الألماني',
        'A winger in the Bundesliga',
      ),
      LocalizedText(
        'لاعب كولومبي لعب لبورتو',
        'A Colombian who played for Porto',
      ),
      LocalizedText(
        'فاز بالدوري الإنجليزي مع ليفربول',
        'Won the Premier League with Liverpool',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'viktor_gyokeres',
    name: LocalizedText('فيكتور جيوكيريس', 'Viktor Gyökeres'),
    short: LocalizedText('جيوكيريس', 'Gyökeres'),
    role: PlayerRole.fw,
    rating: 86,
    clues: [
      LocalizedText(
        'مهاجم يلعب في الدوري الإنجليزي',
        'A striker in the Premier League',
      ),
      LocalizedText(
        'مهاجم سويدي لعب في البرتغال',
        'A Swedish striker who played in Portugal',
      ),
      LocalizedText(
        'هداف الدوري البرتغالي مع سبورتنج',
        'Portuguese league top scorer with Sporting',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'robert_lewandowski',
    name: LocalizedText('روبرت ليفاندوفسكي', 'Robert Lewandowski'),
    short: LocalizedText('ليفاندوفسكي', 'Lewandowski'),
    role: PlayerRole.fw,
    rating: 85,
    clues: [
      LocalizedText('مهاجم يلعب في الدوري الأمريكي', 'A striker in MLS'),
      LocalizedText('مهاجم بولندي', 'A Polish striker'),
      LocalizedText(
        'فاز بالحذاء الذهبي الأوروبي أكثر من مرة',
        'Won the European Golden Shoe more than once',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'rodrygo',
    name: LocalizedText('رودريجو', 'Rodrygo'),
    short: LocalizedText('رودريجو', 'Rodrygo'),
    role: PlayerRole.fw,
    label: 'RW',
    rating: 85,
    clues: [
      LocalizedText('جناح يلعب في الدوري الإسباني', 'A winger in La Liga'),
      LocalizedText(
        'لاعب برازيلي بدأ في سانتوس',
        'A Brazilian who started at Santos',
      ),
      LocalizedText(
        'سجل هدفين متأخرين أمام سيتي في نصف نهائي 2022',
        'Scored a late double vs Man City in the 2022 semi',
      ),
    ],
  ),
];
