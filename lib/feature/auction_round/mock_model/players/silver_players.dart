import 'package:fii90/core/localization/localized_text.dart';
import 'package:fii90/feature/auction_round/mock_model/auction_player.dart';

const silverPlayers = <AuctionPlayer>[
  // ───────────────────────── Goalkeepers ─────────────────────────
  AuctionPlayer(
    id: 'mohamed_el_shenawy',
    name: LocalizedText('محمد الشناوي', 'Mohamed El Shenawy'),
    short: LocalizedText('الشناوي', 'El Shenawy'),
    role: PlayerRole.gk,
    rating: 76,
    clues: [
      LocalizedText(
        'حارس مرمى في الدوري المصري',
        'A goalkeeper in the Egyptian league',
      ),
      LocalizedText(
        'حارس دولي مصري يلعب للأهلي',
        'An Egypt international keeper at Al Ahly',
      ),
      LocalizedText(
        'حرس مرمى مصر في كأس العالم 2018',
        "Kept goal for Egypt at the 2018 World Cup",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'mostafa_shobeir',
    name: LocalizedText('مصطفى شوبير', 'Mostafa Shobeir'),
    short: LocalizedText('شوبير', 'Shobeir'),
    role: PlayerRole.gk,
    rating: 72,
    clues: [
      LocalizedText(
        'حارس مرمى في الدوري المصري',
        'A goalkeeper in the Egyptian league',
      ),
      LocalizedText(
        'حارس شاب من أبناء الأهلي',
        'A young keeper from the Al Ahly academy',
      ),
      LocalizedText(
        'والده حارس سابق للأهلي ومنتخب مصر',
        'His father also kept goal for Ahly and Egypt',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'ahmed_el_shenawy',
    name: LocalizedText('أحمد الشناوي', 'Ahmed El Shenawy'),
    short: LocalizedText('أ. الشناوي', 'A. Shenawy'),
    role: PlayerRole.gk,
    rating: 71,
    clues: [
      LocalizedText(
        'حارس مرمى في الدوري المصري',
        'A goalkeeper in the Egyptian league',
      ),
      LocalizedText(
        'حارس مصري يلعب لبيراميدز',
        'An Egyptian keeper at Pyramids',
      ),
      LocalizedText(
        'حارس بيراميدز الذي لعب للزمالك سابقًا',
        'Pyramids keeper who used to play for Zamalek',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'munir_mohamedi',
    name: LocalizedText('منير المحمدي', 'Munir Mohamedi'),
    short: LocalizedText('المحمدي', 'Mohamedi'),
    role: PlayerRole.gk,
    rating: 72,
    clues: [
      LocalizedText('حارس مرمى عربي', 'An Arab goalkeeper'),
      LocalizedText(
        'حارس دولي مغربي مخضرم',
        'A veteran Morocco international keeper',
      ),
      LocalizedText(
        'بديل بونو في مونديال 2022 ولعب أمام بلجيكا',
        "Bounou's backup at WC 2022, started vs Belgium",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'anthony_lopes',
    name: LocalizedText('أنتوني لوبيز', 'Anthony Lopes'),
    short: LocalizedText('لوبيز', 'Lopes'),
    role: PlayerRole.gk,
    rating: 78,
    clues: [
      LocalizedText('حارس مرمى في الدوري الفرنسي', 'A goalkeeper in Ligue 1'),
      LocalizedText(
        'حارس برتغالي وُلد في فرنسا',
        'A Portugal keeper born in France',
      ),
      LocalizedText(
        'حارس ليون الأساسي لأكثر من عشر سنوات',
        "Lyon's number one for over a decade",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'alban_lafont',
    name: LocalizedText('ألبان لافون', 'Alban Lafont'),
    short: LocalizedText('لافون', 'Lafont'),
    role: PlayerRole.gk,
    rating: 77,
    clues: [
      LocalizedText('حارس مرمى فرنسي', 'A French goalkeeper'),
      LocalizedText(
        'حارس فرنسي يلعب في الدوري اليوناني',
        'A French keeper in the Greek league',
      ),
      LocalizedText(
        'حارس تولوز ونانت السابق',
        'Former Toulouse and Nantes keeper',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'kepa_arrizabalaga',
    name: LocalizedText('كيبا أريزابالاغا', 'Kepa Arrizabalaga'),
    short: LocalizedText('كيبا', 'Kepa'),
    role: PlayerRole.gk,
    rating: 78,
    clues: [
      LocalizedText(
        'حارس مرمى في الدوري الإنجليزي',
        'A goalkeeper in the Premier League',
      ),
      LocalizedText(
        'حارس إسباني من الباسك لعب لأتلتيك بلباو',
        'A Basque Spanish keeper, ex-Athletic Bilbao',
      ),
      LocalizedText(
        'كان أغلى حارس مرمى في التاريخ',
        'Was once the most expensive keeper ever',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'aaron_ramsdale',
    name: LocalizedText('آرون رامسديل', 'Aaron Ramsdale'),
    short: LocalizedText('رامسديل', 'Ramsdale'),
    role: PlayerRole.gk,
    rating: 78,
    clues: [
      LocalizedText('حارس مرمى إنجليزي', 'An English goalkeeper'),
      LocalizedText('حارس أرسنال السابق', 'A former Arsenal keeper'),
      LocalizedText(
        'هبط مع أكثر من نادٍ في الدوري الإنجليزي',
        'Has been relegated with several PL clubs',
      ),
    ],
  ),

  // ───────────────────────── Defenders ─────────────────────────
  AuctionPlayer(
    id: 'mohamed_hany',
    name: LocalizedText('محمد هاني', 'Mohamed Hany'),
    short: LocalizedText('هاني', 'Hany'),
    role: PlayerRole.df,
    label: 'RB',
    rating: 72,
    clues: [
      LocalizedText(
        'مدافع في الدوري المصري',
        'A defender in the Egyptian league',
      ),
      LocalizedText(
        'ظهير أيمن الأهلي ومنتخب مصر',
        'Al Ahly and Egypt right-back',
      ),
      LocalizedText(
        'ظهير أيمن قضى مسيرته كلها في الأهلي',
        'A right-back who has spent his career at Ahly',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'yasser_ibrahim',
    name: LocalizedText('ياسر إبراهيم', 'Yasser Ibrahim'),
    short: LocalizedText('ياسر', 'Yasser'),
    role: PlayerRole.df,
    rating: 72,
    clues: [
      LocalizedText(
        'مدافع في الدوري المصري',
        'A defender in the Egyptian league',
      ),
      LocalizedText(
        'قلب دفاع الأهلي ومنتخب مصر',
        'Al Ahly and Egypt centre-back',
      ),
      LocalizedText(
        'قلب دفاع توّج مع الأهلي بعدة ألقاب إفريقية',
        'Ahly CB with several CAF Champions League titles',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'mohamed_abdelmonem',
    name: LocalizedText('محمد عبد المنعم', 'Mohamed Abdelmonem'),
    short: LocalizedText('عبد المنعم', 'Abdelmonem'),
    role: PlayerRole.df,
    rating: 74,
    clues: [
      LocalizedText('مدافع مصري دولي', 'An Egypt international defender'),
      LocalizedText(
        'قلب دفاع مصري يلعب في فرنسا',
        'An Egyptian centre-back playing in France',
      ),
      LocalizedText(
        'رحل من الأهلي إلى الدوري الفرنسي في 2024',
        'Left Al Ahly for Ligue 1 in 2024',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'ahmed_fattouh',
    name: LocalizedText('أحمد فتوح', 'Ahmed Fattouh'),
    short: LocalizedText('فتوح', 'Fattouh'),
    role: PlayerRole.df,
    label: 'LB',
    rating: 71,
    clues: [
      LocalizedText(
        'مدافع في الدوري المصري',
        'A defender in the Egyptian league',
      ),
      LocalizedText('ظهير أيسر يلعب للزمالك', 'A left-back at Zamalek'),
      LocalizedText(
        'ظهير أيسر الزمالك والمنتخب المصري',
        'Zamalek and Egypt left-back',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'mahmoud_hamdy_elwensh',
    name: LocalizedText('محمود حمدي الونش', 'Mahmoud Hamdy El Wensh'),
    short: LocalizedText('الونش', 'El Wensh'),
    role: PlayerRole.df,
    rating: 71,
    clues: [
      LocalizedText(
        'مدافع في الدوري المصري',
        'A defender in the Egyptian league',
      ),
      LocalizedText('قلب دفاع الزمالك', 'A Zamalek centre-back'),
      LocalizedText(
        'مدافع مخضرم فاز بالسوبر الإفريقي 2024 مع الزمالك',
        'Veteran CB, won the 2024 CAF Super Cup with Zamalek',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'achraf_dari',
    name: LocalizedText('أشرف داري', 'Achraf Dari'),
    short: LocalizedText('داري', 'Dari'),
    role: PlayerRole.df,
    rating: 74,
    clues: [
      LocalizedText('مدافع عربي دولي', 'An Arab international defender'),
      LocalizedText(
        'مدافع مغربي يلعب في الدوري المصري',
        'A Moroccan defender in the Egyptian league',
      ),
      LocalizedText(
        'انضم للأهلي قادمًا من بريست الفرنسي',
        'Joined Al Ahly from French club Brest',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'mohamed_chibi',
    name: LocalizedText('محمد الشيبي', 'Mohamed Chibi'),
    short: LocalizedText('الشيبي', 'Chibi'),
    role: PlayerRole.df,
    label: 'RB',
    rating: 72,
    clues: [
      LocalizedText(
        'مدافع في الدوري المصري',
        'A defender in the Egyptian league',
      ),
      LocalizedText(
        'ظهير مغربي دولي يلعب في مصر',
        'A Morocco international full-back in Egypt',
      ),
      LocalizedText(
        'ظهير أيمن بيراميدز بطل إفريقيا 2025',
        "Pyramids' right-back, 2025 CAF CL winner",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'romain_saiss',
    name: LocalizedText('رومان سايس', 'Romain Saïss'),
    short: LocalizedText('سايس', 'Saïss'),
    role: PlayerRole.df,
    rating: 74,
    clues: [
      LocalizedText('مدافع عربي مخضرم', 'A veteran Arab defender'),
      LocalizedText(
        'قلب دفاع مغربي يلعب في قطر',
        'A Moroccan centre-back playing in Qatar',
      ),
      LocalizedText(
        'قائد المغرب في نصف نهائي مونديال 2022',
        'Captained Morocco in the 2022 World Cup semis',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'aissa_mandi',
    name: LocalizedText('عيسى ماندي', 'Aïssa Mandi'),
    short: LocalizedText('ماندي', 'Mandi'),
    role: PlayerRole.df,
    rating: 76,
    clues: [
      LocalizedText('مدافع عربي في أوروبا', 'An Arab defender in Europe'),
      LocalizedText(
        'قلب دفاع جزائري في الدوري الفرنسي',
        'An Algerian centre-back in Ligue 1',
      ),
      LocalizedText(
        'لعب لبيتيس وفياريال قبل العودة لفرنسا',
        'Played for Betis and Villarreal before France',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'montassar_talbi',
    name: LocalizedText('منتصر الطالبي', 'Montassar Talbi'),
    short: LocalizedText('الطالبي', 'Talbi'),
    role: PlayerRole.df,
    rating: 75,
    clues: [
      LocalizedText('مدافع عربي في أوروبا', 'An Arab defender in Europe'),
      LocalizedText(
        'قلب دفاع تونسي في الدوري الفرنسي',
        'A Tunisian centre-back in Ligue 1',
      ),
      LocalizedText(
        'لعب في روسيا مع روبين كازان قبل لوريان',
        'Played for Rubin Kazan before Lorient',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'ali_abdi',
    name: LocalizedText('علي العابدي', 'Ali Abdi'),
    short: LocalizedText('العابدي', 'Abdi'),
    role: PlayerRole.df,
    label: 'LB',
    rating: 75,
    clues: [
      LocalizedText('مدافع عربي في أوروبا', 'An Arab defender in Europe'),
      LocalizedText(
        'ظهير أيسر تونسي في الدوري الفرنسي',
        'A Tunisian left-back in Ligue 1',
      ),
      LocalizedText(
        'انتقل من كان إلى نيس في 2024',
        'Moved from Caen to Nice in 2024',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'ali_al_bulayhi',
    name: LocalizedText('علي البليهي', 'Ali Al-Bulayhi'),
    short: LocalizedText('البليهي', 'Al-Bulayhi'),
    role: PlayerRole.df,
    rating: 72,
    clues: [
      LocalizedText(
        'مدافع في الدوري السعودي',
        'A defender in the Saudi league',
      ),
      LocalizedText(
        'قلب دفاع الهلال والمنتخب السعودي',
        'Al-Hilal and Saudi Arabia centre-back',
      ),
      LocalizedText(
        'اشتهر بموقفه مع ميسي في مونديال 2022',
        'Famous for his exchange with Messi at WC 2022',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'saud_abdulhamid',
    name: LocalizedText('سعود عبد الحميد', 'Saud Abdulhamid'),
    short: LocalizedText('سعود', 'Saud'),
    role: PlayerRole.df,
    label: 'RB',
    rating: 72,
    clues: [
      LocalizedText('مدافع سعودي دولي', 'A Saudi international defender'),
      LocalizedText(
        'ظهير أيمن سعودي احترف في أوروبا',
        'A Saudi right-back who moved to Europe',
      ),
      LocalizedText(
        'ظهير سعودي لعب في إيطاليا وفرنسا',
        'A Saudi full-back who has played in Italy and France',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'harry_maguire',
    name: LocalizedText('هاري ماغواير', 'Harry Maguire'),
    short: LocalizedText('ماغواير', 'Maguire'),
    role: PlayerRole.df,
    rating: 78,
    clues: [
      LocalizedText(
        'مدافع في الدوري الإنجليزي',
        'A defender in the Premier League',
      ),
      LocalizedText(
        'قلب دفاع إنجليزي في مانشستر يونايتد',
        'An English centre-back at Man United',
      ),
      LocalizedText(
        'كان أغلى مدافع في العالم يومًا ما',
        "Was once the world's most expensive defender",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'joe_gomez',
    name: LocalizedText('جو جوميز', 'Joe Gomez'),
    short: LocalizedText('جوميز', 'Gomez'),
    role: PlayerRole.df,
    rating: 78,
    clues: [
      LocalizedText(
        'مدافع في الدوري الإنجليزي',
        'A defender in the Premier League',
      ),
      LocalizedText(
        'مدافع إنجليزي في ليفربول',
        'An English defender at Liverpool',
      ),
      LocalizedText(
        'انضم لليفربول من تشارلتون وهو مراهق',
        'Joined Liverpool from Charlton as a teenager',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'victor_lindelof',
    name: LocalizedText('فيكتور ليندلوف', 'Victor Lindelöf'),
    short: LocalizedText('ليندلوف', 'Lindelöf'),
    role: PlayerRole.df,
    rating: 77,
    clues: [
      LocalizedText(
        'مدافع في الدوري الإنجليزي',
        'A defender in the Premier League',
      ),
      LocalizedText(
        'قلب دفاع سويدي دولي',
        'A Sweden international centre-back',
      ),
      LocalizedText(
        'لعب لبنفيكا ومانشستر يونايتد',
        'Ex-Benfica and Manchester United',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'kieran_tierney',
    name: LocalizedText('كيران تيرني', 'Kieran Tierney'),
    short: LocalizedText('تيرني', 'Tierney'),
    role: PlayerRole.df,
    label: 'LB',
    rating: 76,
    clues: [
      LocalizedText('مدافع بريطاني', 'A British defender'),
      LocalizedText(
        'ظهير أيسر اسكتلندي دولي',
        'A Scotland international left-back',
      ),
      LocalizedText(
        'عاد إلى سلتيك بعد سنوات في أرسنال',
        'Returned to Celtic after years at Arsenal',
      ),
    ],
  ),

  // ───────────────────────── Midfielders ─────────────────────────
  AuctionPlayer(
    id: 'emam_ashour',
    name: LocalizedText('إمام عاشور', 'Emam Ashour'),
    short: LocalizedText('عاشور', 'Ashour'),
    role: PlayerRole.mf,
    label: 'CAM',
    rating: 77,
    clues: [
      LocalizedText(
        'لاعب وسط يلعب في الدوري المصري',
        'A midfielder in the Egyptian league',
      ),
      LocalizedText(
        'لاعب وسط مصري لعب للأهلي والزمالك',
        'An Egyptian midfielder who played for Ahly and Zamalek',
      ),
      LocalizedText(
        'احترف في الدنمارك قبل انضمامه للأهلي',
        'Played in Denmark before joining Al Ahly',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'mohamed_elneny',
    name: LocalizedText('محمد النني', 'Mohamed Elneny'),
    short: LocalizedText('النني', 'Elneny'),
    role: PlayerRole.mf,
    rating: 72,
    clues: [
      LocalizedText('لاعب وسط مصري دولي', 'An Egypt international midfielder'),
      LocalizedText(
        'لاعب وسط مصري يلعب في الإمارات',
        'An Egyptian midfielder playing in the UAE',
      ),
      LocalizedText(
        'قضى قرابة ثماني سنوات في أرسنال',
        'Spent around eight years at Arsenal',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'marwan_attia',
    name: LocalizedText('مروان عطية', 'Marwan Attia'),
    short: LocalizedText('عطية', 'Attia'),
    role: PlayerRole.mf,
    label: 'CDM',
    rating: 73,
    clues: [
      LocalizedText(
        'لاعب وسط يلعب في الدوري المصري',
        'A midfielder in the Egyptian league',
      ),
      LocalizedText(
        'لاعب وسط دفاعي في الأهلي',
        'A defensive midfielder at Al Ahly',
      ),
      LocalizedText(
        'ارتكاز الأهلي ومنتخب مصر الأساسي',
        "Ahly and Egypt's first-choice holding midfielder",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'mohamed_magdy_afsha',
    name: LocalizedText('محمد مجدي أفشة', 'Mohamed Magdy Afsha'),
    short: LocalizedText('أفشة', 'Afsha'),
    role: PlayerRole.mf,
    label: 'CAM',
    rating: 74,
    clues: [
      LocalizedText(
        'لاعب وسط يلعب في الدوري المصري',
        'A midfielder in the Egyptian league',
      ),
      LocalizedText(
        'صانع ألعاب في الأهلي',
        'An attacking midfielder at Al Ahly',
      ),
      LocalizedText(
        'انضم للأهلي قادمًا من بيراميدز في 2019',
        'Joined Al Ahly from Pyramids in 2019',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'mohanad_lasheen',
    name: LocalizedText('مهند لاشين', 'Mohanad Lasheen'),
    short: LocalizedText('لاشين', 'Lasheen'),
    role: PlayerRole.mf,
    label: 'CDM',
    rating: 71,
    clues: [
      LocalizedText(
        'لاعب وسط يلعب في الدوري المصري',
        'A midfielder in the Egyptian league',
      ),
      LocalizedText(
        'لاعب وسط مصري في بيراميدز',
        'An Egyptian midfielder at Pyramids',
      ),
      LocalizedText(
        'ارتكاز بيراميدز بطل إفريقيا 2025',
        "Pyramids' holding mid, 2025 CAF CL winner",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'walid_el_karti',
    name: LocalizedText('وليد الكرتي', 'Walid El Karti'),
    short: LocalizedText('الكرتي', 'El Karti'),
    role: PlayerRole.mf,
    rating: 72,
    clues: [
      LocalizedText(
        'لاعب وسط يلعب في الدوري المصري',
        'A midfielder in the Egyptian league',
      ),
      LocalizedText(
        'لاعب وسط مغربي دولي يلعب في مصر',
        'A Morocco international midfielder in Egypt',
      ),
      LocalizedText(
        'انضم لبيراميدز قادمًا من الوداد',
        'Joined Pyramids from Wydad',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'blati_toure',
    name: LocalizedText('بلاتي توريه', 'Blati Touré'),
    short: LocalizedText('بلاتي', 'Blati'),
    role: PlayerRole.mf,
    rating: 71,
    clues: [
      LocalizedText(
        'لاعب وسط يلعب في الدوري المصري',
        'A midfielder in the Egyptian league',
      ),
      LocalizedText(
        'لاعب وسط إفريقي محترف في بيراميدز',
        'An African midfielder at Pyramids',
      ),
      LocalizedText(
        'دولي بوركينابي في وسط بيراميدز',
        'A Burkina Faso international in Pyramids midfield',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'azzedine_ounahi',
    name: LocalizedText('عز الدين أوناحي', 'Azzedine Ounahi'),
    short: LocalizedText('أوناحي', 'Ounahi'),
    role: PlayerRole.mf,
    rating: 77,
    clues: [
      LocalizedText('لاعب وسط عربي في أوروبا', 'An Arab midfielder in Europe'),
      LocalizedText(
        'لاعب وسط مغربي في الدوري الإسباني',
        'A Moroccan midfielder in La Liga',
      ),
      LocalizedText(
        'انتقل من أنجيه إلى مارسيليا بعد مونديال 2022',
        'Moved from Angers to Marseille after WC 2022',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'houssem_aouar',
    name: LocalizedText('حسام عوار', 'Houssem Aouar'),
    short: LocalizedText('عوار', 'Aouar'),
    role: PlayerRole.mf,
    rating: 77,
    clues: [
      LocalizedText(
        'لاعب وسط في الدوري السعودي',
        'A midfielder in the Saudi league',
      ),
      LocalizedText(
        'لاعب وسط جزائري دولي',
        'An Algeria international midfielder',
      ),
      LocalizedText(
        'خريج أكاديمية ليون ولعب لروما',
        'Lyon academy graduate who also played for Roma',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'ellyes_skhiri',
    name: LocalizedText('إلياس السخيري', 'Ellyes Skhiri'),
    short: LocalizedText('السخيري', 'Skhiri'),
    role: PlayerRole.mf,
    label: 'CDM',
    rating: 78,
    clues: [
      LocalizedText('لاعب وسط عربي في أوروبا', 'An Arab midfielder in Europe'),
      LocalizedText(
        'لاعب وسط تونسي في الدوري الألماني',
        'A Tunisian midfielder in the Bundesliga',
      ),
      LocalizedText(
        'انتقل من كولن إلى آينتراخت فرانكفورت',
        'Moved from Cologne to Eintracht Frankfurt',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'mohamed_kanno',
    name: LocalizedText('محمد كنو', 'Mohamed Kanno'),
    short: LocalizedText('كنو', 'Kanno'),
    role: PlayerRole.mf,
    rating: 73,
    clues: [
      LocalizedText(
        'لاعب وسط في الدوري السعودي',
        'A midfielder in the Saudi league',
      ),
      LocalizedText(
        'لاعب وسط سعودي دولي في الهلال',
        'A Saudi international midfielder at Al-Hilal',
      ),
      LocalizedText(
        'لاعب وسط الهلال الطويل الذي شارك في مونديال 2022',
        'Tall Al-Hilal midfielder who played at WC 2022',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'jordan_henderson',
    name: LocalizedText('جوردان هندرسون', 'Jordan Henderson'),
    short: LocalizedText('هندرسون', 'Henderson'),
    role: PlayerRole.mf,
    rating: 77,
    clues: [
      LocalizedText('لاعب وسط إنجليزي مخضرم', 'A veteran English midfielder'),
      LocalizedText('لاعب وسط ليفربول السابق', 'A former Liverpool midfielder'),
      LocalizedText(
        'لعب في السعودية وهولندا ثم عاد لإنجلترا',
        'Played in Saudi and the Netherlands, then back to England',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'christian_eriksen',
    name: LocalizedText('كريستيان إريكسن', 'Christian Eriksen'),
    short: LocalizedText('إريكسن', 'Eriksen'),
    role: PlayerRole.mf,
    rating: 77,
    clues: [
      LocalizedText('لاعب وسط أوروبي مخضرم', 'A veteran European midfielder'),
      LocalizedText(
        'لاعب وسط دنماركي دولي',
        'A Denmark international midfielder',
      ),
      LocalizedText(
        'لعب لتوتنهام وإنتر ومانشستر يونايتد',
        'Ex-Tottenham, Inter and Manchester United',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'mason_mount',
    name: LocalizedText('ماسون ماونت', 'Mason Mount'),
    short: LocalizedText('ماونت', 'Mount'),
    role: PlayerRole.mf,
    label: 'CAM',
    rating: 78,
    clues: [
      LocalizedText(
        'لاعب وسط في الدوري الإنجليزي',
        'A midfielder in the Premier League',
      ),
      LocalizedText(
        'لاعب وسط إنجليزي في مانشستر يونايتد',
        'An English midfielder at Man United',
      ),
      LocalizedText(
        'خريج أكاديمية تشيلسي وبطل أوروبا 2021',
        'Chelsea academy product, 2021 UCL winner',
      ),
    ],
  ),

  // ───────────────────────── Forwards ─────────────────────────
  AuctionPlayer(
    id: 'zizo',
    name: LocalizedText('أحمد سيد زيزو', 'Ahmed Sayed Zizo'),
    short: LocalizedText('زيزو', 'Zizo'),
    role: PlayerRole.fw,
    label: 'RW',
    rating: 76,
    clues: [
      LocalizedText(
        'جناح يلعب في الدوري المصري',
        'A winger in the Egyptian league',
      ),
      LocalizedText(
        'جناح مصري لعب للزمالك والأهلي',
        'An Egyptian winger who played for Zamalek and Ahly',
      ),
      LocalizedText(
        'انتقل من الزمالك للأهلي في صيف 2025',
        'Moved from Zamalek to Al Ahly in summer 2025',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'trezeguet',
    name: LocalizedText('محمود حسن تريزيجيه', 'Mahmoud Trezeguet'),
    short: LocalizedText('تريزيجيه', 'Trezeguet'),
    role: PlayerRole.fw,
    label: 'LW',
    rating: 75,
    clues: [
      LocalizedText(
        'جناح يلعب في الدوري المصري',
        'A winger in the Egyptian league',
      ),
      LocalizedText(
        'جناح الأهلي العائد من الاحتراف',
        'An Ahly winger who returned from abroad',
      ),
      LocalizedText(
        'لعب لأستون فيلا وطرابزون سبور',
        'Played for Aston Villa and Trabzonspor',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'mohamed_sherif',
    name: LocalizedText('محمد شريف', 'Mohamed Sherif'),
    short: LocalizedText('شريف', 'Sherif'),
    role: PlayerRole.fw,
    rating: 73,
    clues: [
      LocalizedText(
        'مهاجم يلعب في الدوري المصري',
        'A striker in the Egyptian league',
      ),
      LocalizedText('مهاجم الأهلي ومنتخب مصر', 'Al Ahly and Egypt striker'),
      LocalizedText(
        'مهاجم أهلاوي لعب موسمًا مع الخليج السعودي',
        'Ahly striker who had a season at Saudi Al-Khaleej',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'wessam_abou_ali',
    name: LocalizedText('وسام أبو علي', 'Wessam Abou Ali'),
    short: LocalizedText('أبو علي', 'Abou Ali'),
    role: PlayerRole.fw,
    rating: 74,
    clues: [
      LocalizedText('مهاجم عربي دولي', 'An Arab international striker'),
      LocalizedText('مهاجم دولي فلسطيني', 'A Palestine international striker'),
      LocalizedText(
        'رحل من الأهلي إلى الدوري الأمريكي في 2025',
        'Left Al Ahly for MLS in 2025',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'ibrahim_adel',
    name: LocalizedText('إبراهيم عادل', 'Ibrahim Adel'),
    short: LocalizedText('إبراهيم عادل', 'I. Adel'),
    role: PlayerRole.fw,
    label: 'LW',
    rating: 73,
    clues: [
      LocalizedText('جناح مصري دولي', 'An Egypt international winger'),
      LocalizedText(
        'جناح مصري تألق مع بيراميدز',
        'An Egyptian winger who shone at Pyramids',
      ),
      LocalizedText(
        'رحل من بيراميدز إلى الدوري الدنماركي',
        'Left Pyramids for the Danish league',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'fiston_mayele',
    name: LocalizedText('فيستون مايلي', 'Fiston Mayele'),
    short: LocalizedText('مايلي', 'Mayele'),
    role: PlayerRole.fw,
    rating: 74,
    clues: [
      LocalizedText(
        'مهاجم يلعب في الدوري المصري',
        'A striker in the Egyptian league',
      ),
      LocalizedText(
        'مهاجم كونغولي في بيراميدز',
        'A Congolese striker at Pyramids',
      ),
      LocalizedText(
        'كان هداف يانغ أفريكانز التنزاني',
        "Was Young Africans' top scorer in Tanzania",
      ),
    ],
  ),
  AuctionPlayer(
    id: 'mostafa_fathi',
    name: LocalizedText('مصطفى فتحي', 'Mostafa Fathi'),
    short: LocalizedText('فتحي', 'Fathi'),
    role: PlayerRole.fw,
    label: 'RW',
    rating: 72,
    clues: [
      LocalizedText(
        'جناح يلعب في الدوري المصري',
        'A winger in the Egyptian league',
      ),
      LocalizedText('جناح مصري في بيراميدز', 'An Egyptian winger at Pyramids'),
      LocalizedText(
        'جناح قصير القامة لعب للزمالك قبل بيراميدز',
        'Small winger who played for Zamalek before Pyramids',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'mostafa_mohamed',
    name: LocalizedText('مصطفى محمد', 'Mostafa Mohamed'),
    short: LocalizedText('مصطفى محمد', 'Mostafa'),
    role: PlayerRole.fw,
    rating: 75,
    clues: [
      LocalizedText('مهاجم مصري دولي', 'An Egypt international striker'),
      LocalizedText(
        'مهاجم مصري يلعب في فرنسا',
        'An Egyptian striker playing in France',
      ),
      LocalizedText(
        'مهاجم الزمالك السابق لعب لجالطة سراي',
        'Ex-Zamalek striker who played for Galatasaray',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'salem_al_dawsari',
    name: LocalizedText('سالم الدوسري', 'Salem Al-Dawsari'),
    short: LocalizedText('الدوسري', 'Al-Dawsari'),
    role: PlayerRole.fw,
    label: 'LW',
    rating: 76,
    clues: [
      LocalizedText('جناح في الدوري السعودي', 'A winger in the Saudi league'),
      LocalizedText(
        'جناح الهلال والمنتخب السعودي',
        'Al-Hilal and Saudi Arabia winger',
      ),
      LocalizedText(
        'سجّل في شباك الأرجنتين بمونديال 2022',
        'Scored against Argentina at WC 2022',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'akram_afif',
    name: LocalizedText('أكرم عفيف', 'Akram Afif'),
    short: LocalizedText('عفيف', 'Afif'),
    role: PlayerRole.fw,
    label: 'LW',
    rating: 79,
    clues: [
      LocalizedText('مهاجم عربي في الخليج', 'An Arab forward in the Gulf'),
      LocalizedText('جناح قطري يلعب للسد', 'A Qatari winger at Al-Sadd'),
      LocalizedText(
        'أفضل لاعب وهداف كأس آسيا 2023',
        'Best player and top scorer of the 2023 Asian Cup',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'ayoub_el_kaabi',
    name: LocalizedText('أيوب الكعبي', 'Ayoub El Kaabi'),
    short: LocalizedText('الكعبي', 'El Kaabi'),
    role: PlayerRole.fw,
    rating: 77,
    clues: [
      LocalizedText('مهاجم عربي في أوروبا', 'An Arab striker in Europe'),
      LocalizedText(
        'مهاجم مغربي يلعب في اليونان',
        'A Moroccan striker playing in Greece',
      ),
      LocalizedText(
        'توّج بلقب أوروبي مع أولمبياكوس',
        'Won a European trophy with Olympiacos',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'firas_al_buraikan',
    name: LocalizedText('فراس البريكان', 'Firas Al-Buraikan'),
    short: LocalizedText('البريكان', 'Al-Buraikan'),
    role: PlayerRole.fw,
    rating: 74,
    clues: [
      LocalizedText('مهاجم في الدوري السعودي', 'A striker in the Saudi league'),
      LocalizedText('مهاجم سعودي دولي', 'A Saudi international striker'),
      LocalizedText(
        'توّج بدوري أبطال آسيا 2025 مع الأهلي',
        'Won the 2025 AFC Champions League with Al-Ahli',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'musa_al_taamari',
    name: LocalizedText('موسى التعمري', 'Musa Al-Taamari'),
    short: LocalizedText('التعمري', 'Al-Taamari'),
    role: PlayerRole.fw,
    label: 'RW',
    rating: 76,
    clues: [
      LocalizedText('جناح عربي في أوروبا', 'An Arab winger in Europe'),
      LocalizedText(
        'جناح أردني في الدوري الفرنسي',
        'A Jordanian winger in Ligue 1',
      ),
      LocalizedText(
        'قاد الأردن لنهائي كأس آسيا 2023',
        'Led Jordan to the 2023 Asian Cup final',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'dominic_calvert_lewin',
    name: LocalizedText('دومينيك كالفرت لوين', 'Dominic Calvert-Lewin'),
    short: LocalizedText('كالفرت لوين', 'Calvert-Lewin'),
    role: PlayerRole.fw,
    rating: 76,
    clues: [
      LocalizedText(
        'مهاجم في الدوري الإنجليزي',
        'A striker in the Premier League',
      ),
      LocalizedText(
        'مهاجم إنجليزي قضى سنوات طويلة في إيفرتون',
        'An English striker who spent years at Everton',
      ),
      LocalizedText(
        'انضم إلى ليدز في 2025 بعد رحيله عن إيفرتون',
        'Joined Leeds in 2025 after leaving Everton',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'jamie_vardy',
    name: LocalizedText('جيمي فاردي', 'Jamie Vardy'),
    short: LocalizedText('فاردي', 'Vardy'),
    role: PlayerRole.fw,
    rating: 75,
    clues: [
      LocalizedText('مهاجم إنجليزي مخضرم', 'A veteran English striker'),
      LocalizedText('أسطورة ليستر سيتي', 'A Leicester City legend'),
      LocalizedText(
        'بطل البريميرليغ 2016 مع ليستر',
        'Won the 2016 Premier League with Leicester',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'callum_wilson',
    name: LocalizedText('كالوم ويلسون', 'Callum Wilson'),
    short: LocalizedText('ويلسون', 'Wilson'),
    role: PlayerRole.fw,
    rating: 75,
    clues: [
      LocalizedText(
        'مهاجم في الدوري الإنجليزي',
        'A striker in the Premier League',
      ),
      LocalizedText(
        'مهاجم إنجليزي لعب لنيوكاسل',
        'An English striker who played for Newcastle',
      ),
      LocalizedText(
        'لعب لبورنموث ونيوكاسل ثم وست هام',
        'Played for Bournemouth, Newcastle, then West Ham',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'ciro_immobile',
    name: LocalizedText('تشيرو إيموبيلي', 'Ciro Immobile'),
    short: LocalizedText('إيموبيلي', 'Immobile'),
    role: PlayerRole.fw,
    rating: 77,
    clues: [
      LocalizedText('مهاجم أوروبي مخضرم', 'A veteran European striker'),
      LocalizedText('مهاجم إيطالي دولي', 'An Italy international striker'),
      LocalizedText(
        'الهداف التاريخي لنادي لاتسيو',
        "Lazio's all-time top scorer",
      ),
    ],
  ),
];
