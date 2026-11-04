import 'package:fii90/core/localization/localized_text.dart';
import 'package:fii90/feature/auction_round/mock_model/auction_player.dart';

/// Gold tier: currently active players rated 80–84.
const goldPlayers = <AuctionPlayer>[
  // ───────────────────────── Goalkeepers ─────────────────────────
  AuctionPlayer(
    id: 'yassine_bounou',
    name: LocalizedText('ياسين بونو', 'Yassine Bounou'),
    short: LocalizedText('بونو', 'Bounou'),
    role: PlayerRole.gk,
    rating: 84,
    clues: [
      LocalizedText(
        'حارس مرمى يلعب في الدوري السعودي',
        'A goalkeeper in the Saudi Pro League',
      ),
      LocalizedText(
        'حارس مغربي لعب سنوات في الدوري الإسباني',
        'A Moroccan keeper who spent years in La Liga',
      ),
      LocalizedText(
        'وصل لنصف نهائي كأس العالم 2022',
        'Reached the 2022 World Cup semi-final',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'unai_simon',
    name: LocalizedText('أوناي سيمون', 'Unai Simón'),
    short: LocalizedText('سيمون', 'Simón'),
    role: PlayerRole.gk,
    rating: 83,
    clues: [
      LocalizedText(
        'حارس مرمى يلعب في الدوري الإسباني',
        'A goalkeeper in La Liga',
      ),
      LocalizedText(
        'حارس لنادٍ من إقليم الباسك',
        'Keeps goal for a Basque club',
      ),
      LocalizedText(
        'فاز ببطولة يورو 2024 مع إسبانيا',
        'Won Euro 2024 with Spain',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'diogo_costa',
    name: LocalizedText('ديوغو كوستا', 'Diogo Costa'),
    short: LocalizedText('كوستا', 'Costa'),
    role: PlayerRole.gk,
    rating: 84,
    clues: [
      LocalizedText(
        'حارس مرمى يلعب في الدوري البرتغالي',
        'A goalkeeper in the Portuguese league',
      ),
      LocalizedText(
        'حارس منتخب البرتغال',
        'A Portugal international goalkeeper',
      ),
      LocalizedText(
        'تخرج من أكاديمية بورتو وأصبح حارسه الأول',
        'Came through Porto\'s academy to become No. 1',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'guglielmo_vicario',
    name: LocalizedText('غولييلمو فيكاريو', 'Guglielmo Vicario'),
    short: LocalizedText('فيكاريو', 'Vicario'),
    role: PlayerRole.gk,
    rating: 82,
    clues: [
      LocalizedText(
        'حارس مرمى يلعب في الدوري الإنجليزي',
        'A goalkeeper in the Premier League',
      ),
      LocalizedText(
        'حارس إيطالي يلعب خارج إيطاليا',
        'An Italian keeper playing abroad',
      ),
      LocalizedText(
        'فاز بالدوري الأوروبي مع توتنهام 2025',
        'Won the 2025 Europa League with Tottenham',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'jordan_pickford',
    name: LocalizedText('جوردان بيكفورد', 'Jordan Pickford'),
    short: LocalizedText('بيكفورد', 'Pickford'),
    role: PlayerRole.gk,
    rating: 82,
    clues: [
      LocalizedText(
        'حارس مرمى يلعب في الدوري الإنجليزي',
        'A goalkeeper in the Premier League',
      ),
      LocalizedText(
        'حارس منتخب إنجلترا',
        'An England international goalkeeper',
      ),
      LocalizedText(
        'حرس مرمى إنجلترا في نهائيي يورو 2020 و2024',
        'In goal for England in the Euro 2020 and 2024 finals',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'andre_onana',
    name: LocalizedText('أندريه أونانا', 'André Onana'),
    short: LocalizedText('أونانا', 'Onana'),
    role: PlayerRole.gk,
    rating: 80,
    clues: [
      LocalizedText(
        'حارس مرمى أفريقي يلعب في أوروبا',
        'An African goalkeeper playing in Europe',
      ),
      LocalizedText(
        'حارس كاميروني لعب لأياكس',
        'A Cameroonian keeper who played for Ajax',
      ),
      LocalizedText(
        'انتقل من إنتر لمانشستر يونايتد 2023',
        'Moved from Inter to Manchester United in 2023',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'edouard_mendy',
    name: LocalizedText('إدوارد ميندي', 'Édouard Mendy'),
    short: LocalizedText('ميندي', 'Mendy'),
    role: PlayerRole.gk,
    rating: 81,
    clues: [
      LocalizedText(
        'حارس مرمى يلعب في الدوري السعودي',
        'A goalkeeper in the Saudi Pro League',
      ),
      LocalizedText('حارس منتخب السنغال', 'A Senegal international goalkeeper'),
      LocalizedText(
        'فاز بدوري أبطال أوروبا مع تشيلسي 2021',
        'Won the 2021 Champions League with Chelsea',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'mile_svilar',
    name: LocalizedText('ميلي سفيلار', 'Mile Svilar'),
    short: LocalizedText('سفيلار', 'Svilar'),
    role: PlayerRole.gk,
    rating: 83,
    clues: [
      LocalizedText(
        'حارس مرمى يلعب في الدوري الإيطالي',
        'A goalkeeper in Serie A',
      ),
      LocalizedText(
        'حارس صربي دولي وُلد في بلجيكا',
        'A Serbia international born in Belgium',
      ),
      LocalizedText(
        'لعب لبنفيكا قبل انتقاله إلى روما',
        'Played for Benfica before joining Roma',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'bart_verbruggen',
    name: LocalizedText('بارت فيربروغن', 'Bart Verbruggen'),
    short: LocalizedText('فيربروغن', 'Verbruggen'),
    role: PlayerRole.gk,
    rating: 80,
    clues: [
      LocalizedText(
        'حارس مرمى يلعب في الدوري الإنجليزي',
        'A goalkeeper in the Premier League',
      ),
      LocalizedText(
        'حارس منتخب هولندا',
        'A Netherlands international goalkeeper',
      ),
      LocalizedText(
        'انتقل من أندرلخت إلى برايتون 2023',
        'Joined Brighton from Anderlecht in 2023',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'lucas_chevalier',
    name: LocalizedText('لوكاس شوفالييه', 'Lucas Chevalier'),
    short: LocalizedText('شوفالييه', 'Chevalier'),
    role: PlayerRole.gk,
    rating: 82,
    clues: [
      LocalizedText(
        'حارس مرمى يلعب في الدوري الفرنسي',
        'A goalkeeper in Ligue 1',
      ),
      LocalizedText(
        'حارس فرنسي شاب تألق مع ليل',
        'A young French keeper who shone at Lille',
      ),
      LocalizedText(
        'انتقل إلى باريس سان جيرمان صيف 2025',
        'Joined Paris Saint-Germain in summer 2025',
      ),
    ],
  ),

  // ───────────────────────── Defenders ─────────────────────────
  AuctionPlayer(
    id: 'noussair_mazraoui',
    name: LocalizedText('نصير مزراوي', 'Noussair Mazraoui'),
    short: LocalizedText('مزراوي', 'Mazraoui'),
    role: PlayerRole.df,
    rating: 80,
    label: 'RB',
    clues: [
      LocalizedText(
        'ظهير يلعب في الدوري الإنجليزي',
        'A full-back in the Premier League',
      ),
      LocalizedText(
        'مدافع دولي مغربي وُلد في هولندا',
        'A Morocco international born in the Netherlands',
      ),
      LocalizedText(
        'لعب لأياكس وبايرن قبل مانشستر يونايتد',
        'Played for Ajax and Bayern before Man United',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'nayef_aguerd',
    name: LocalizedText('نايف أكرد', 'Nayef Aguerd'),
    short: LocalizedText('أكرد', 'Aguerd'),
    role: PlayerRole.df,
    rating: 80,
    clues: [
      LocalizedText(
        'قلب دفاع يلعب في الدوري الفرنسي',
        'A centre-back in Ligue 1',
      ),
      LocalizedText('مدافع منتخب المغرب', 'A Morocco international defender'),
      LocalizedText(
        'لعب لرين ووست هام قبل مرسيليا',
        'Played for Rennes and West Ham before Marseille',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'rayan_ait_nouri',
    name: LocalizedText('ريان آيت نوري', 'Rayan Aït-Nouri'),
    short: LocalizedText('آيت نوري', 'Aït-Nouri'),
    role: PlayerRole.df,
    rating: 81,
    label: 'LB',
    clues: [
      LocalizedText(
        'ظهير أيسر يلعب في الدوري الإنجليزي',
        'A left-back in the Premier League',
      ),
      LocalizedText(
        'مدافع دولي جزائري وُلد في فرنسا',
        'An Algeria international born in France',
      ),
      LocalizedText(
        'انتقل من وولفرهامبتون لمانشستر سيتي 2025',
        'Moved from Wolves to Manchester City in 2025',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'ramy_bensebaini',
    name: LocalizedText('رامي بن سبعيني', 'Ramy Bensebaini'),
    short: LocalizedText('بن سبعيني', 'Bensebaini'),
    role: PlayerRole.df,
    rating: 80,
    label: 'LB',
    clues: [
      LocalizedText(
        'مدافع يلعب في الدوري الألماني',
        'A defender in the Bundesliga',
      ),
      LocalizedText('مدافع منتخب الجزائر', 'An Algeria international defender'),
      LocalizedText(
        'لعب لغلادباخ ثم انتقل لدورتموند',
        'Played for Gladbach then moved to Dortmund',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'kalidou_koulibaly',
    name: LocalizedText('كاليدو كوليبالي', 'Kalidou Koulibaly'),
    short: LocalizedText('كوليبالي', 'Koulibaly'),
    role: PlayerRole.df,
    rating: 81,
    clues: [
      LocalizedText(
        'قلب دفاع يلعب في الدوري السعودي',
        'A centre-back in the Saudi Pro League',
      ),
      LocalizedText('مدافع منتخب السنغال', 'A Senegal international defender'),
      LocalizedText(
        'لعب لنابولي وتشيلسي قبل الهلال',
        'Played for Napoli and Chelsea before Al Hilal',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'pau_cubarsi',
    name: LocalizedText('باو كوبارسي', 'Pau Cubarsí'),
    short: LocalizedText('كوبارسي', 'Cubarsí'),
    role: PlayerRole.df,
    rating: 84,
    clues: [
      LocalizedText(
        'قلب دفاع يلعب في الدوري الإسباني',
        'A centre-back in La Liga',
      ),
      LocalizedText(
        'مدافع إسباني شاب من أكاديمية لاماسيا',
        'A young Spanish defender from La Masia',
      ),
      LocalizedText(
        'أصبح أساسيًا في برشلونة قبل بلوغه 18 عامًا',
        'Became a Barcelona starter before turning 18',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'dean_huijsen',
    name: LocalizedText('دين هاوسن', 'Dean Huijsen'),
    short: LocalizedText('هاوسن', 'Huijsen'),
    role: PlayerRole.df,
    rating: 82,
    clues: [
      LocalizedText(
        'قلب دفاع يلعب في الدوري الإسباني',
        'A centre-back in La Liga',
      ),
      LocalizedText(
        'مدافع إسباني دولي وُلد في هولندا',
        'A Spain international born in the Netherlands',
      ),
      LocalizedText(
        'انتقل من بورنموث لريال مدريد 2025',
        'Moved from Bournemouth to Real Madrid in 2025',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'riccardo_calafiori',
    name: LocalizedText('ريكاردو كالافيوري', 'Riccardo Calafiori'),
    short: LocalizedText('كالافيوري', 'Calafiori'),
    role: PlayerRole.df,
    rating: 81,
    clues: [
      LocalizedText(
        'مدافع يلعب في الدوري الإنجليزي',
        'A defender in the Premier League',
      ),
      LocalizedText(
        'مدافع إيطالي دولي يلعب خارج إيطاليا',
        'An Italy international defender playing abroad',
      ),
      LocalizedText(
        'انتقل من بولونيا إلى أرسنال 2024',
        'Joined Arsenal from Bologna in 2024',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'micky_van_de_ven',
    name: LocalizedText('ميكي فان دي فين', 'Micky van de Ven'),
    short: LocalizedText('فان دي فين', 'Van de Ven'),
    role: PlayerRole.df,
    rating: 82,
    clues: [
      LocalizedText(
        'قلب دفاع يلعب في الدوري الإنجليزي',
        'A centre-back in the Premier League',
      ),
      LocalizedText(
        'مدافع منتخب هولندا',
        'A Netherlands international defender',
      ),
      LocalizedText(
        'انتقل من فولفسبورغ إلى توتنهام 2023',
        'Joined Tottenham from Wolfsburg in 2023',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'marc_guehi',
    name: LocalizedText('مارك غيهي', 'Marc Guéhi'),
    short: LocalizedText('غيهي', 'Guéhi'),
    role: PlayerRole.df,
    rating: 83,
    clues: [
      LocalizedText(
        'قلب دفاع يلعب في الدوري الإنجليزي',
        'A centre-back in the Premier League',
      ),
      LocalizedText(
        'مدافع إنجليزي تخرج من أكاديمية تشيلسي',
        'An English defender from Chelsea\'s academy',
      ),
      LocalizedText(
        'قاد كريستال بالاس للفوز بكأس الاتحاد 2025',
        'Captained Crystal Palace to the 2025 FA Cup',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'levi_colwill',
    name: LocalizedText('ليفاي كولويل', 'Levi Colwill'),
    short: LocalizedText('كولويل', 'Colwill'),
    role: PlayerRole.df,
    rating: 80,
    clues: [
      LocalizedText(
        'مدافع يلعب في الدوري الإنجليزي',
        'A defender in the Premier League',
      ),
      LocalizedText(
        'مدافع إنجليزي شاب من أكاديمية تشيلسي',
        'A young English defender from Chelsea\'s academy',
      ),
      LocalizedText(
        'لعب معارًا لبرايتون قبل أن يثبت مع تشيلسي',
        'Was on loan at Brighton before settling at Chelsea',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'ibrahima_konate',
    name: LocalizedText('إبراهيما كوناتي', 'Ibrahima Konaté'),
    short: LocalizedText('كوناتي', 'Konaté'),
    role: PlayerRole.df,
    rating: 84,
    clues: [
      LocalizedText(
        'قلب دفاع لعب في الدوري الإنجليزي',
        'A centre-back who played in the Premier League',
      ),
      LocalizedText(
        'مدافع فرنسي دولي لعب في ألمانيا',
        'A France international who played in Germany',
      ),
      LocalizedText(
        'انتقل من لايبزيغ إلى ليفربول 2021',
        'Moved from RB Leipzig to Liverpool in 2021',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'dayot_upamecano',
    name: LocalizedText('دايو أوباميكانو', 'Dayot Upamecano'),
    short: LocalizedText('أوباميكانو', 'Upamecano'),
    role: PlayerRole.df,
    rating: 84,
    clues: [
      LocalizedText(
        'قلب دفاع يلعب في الدوري الألماني',
        'A centre-back in the Bundesliga',
      ),
      LocalizedText('مدافع فرنسي دولي', 'A France international defender'),
      LocalizedText(
        'انتقل من لايبزيغ إلى بايرن ميونخ 2021',
        'Moved from RB Leipzig to Bayern in 2021',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'jonathan_tah',
    name: LocalizedText('يوناتان تاه', 'Jonathan Tah'),
    short: LocalizedText('تاه', 'Tah'),
    role: PlayerRole.df,
    rating: 84,
    clues: [
      LocalizedText(
        'قلب دفاع يلعب في الدوري الألماني',
        'A centre-back in the Bundesliga',
      ),
      LocalizedText('مدافع منتخب ألمانيا', 'A Germany international defender'),
      LocalizedText(
        'فاز بالدوري دون هزيمة مع ليفركوزن 2024',
        'Won an unbeaten league title with Leverkusen in 2024',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'theo_hernandez',
    name: LocalizedText('ثيو هيرنانديز', 'Theo Hernández'),
    short: LocalizedText('ثيو', 'Theo'),
    role: PlayerRole.df,
    rating: 84,
    label: 'LB',
    clues: [
      LocalizedText(
        'ظهير أيسر لعب في الدوري الإيطالي',
        'A left-back who played in Serie A',
      ),
      LocalizedText(
        'فرنسي لعب لأتلتيكو وريال مدريد',
        'A Frenchman who played for Atlético and Real Madrid',
      ),
      LocalizedText(
        'انتقل من ميلان إلى الهلال 2025',
        'Moved from AC Milan to Al Hilal in 2025',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'alejandro_grimaldo',
    name: LocalizedText('أليخاندرو غريمالدو', 'Alejandro Grimaldo'),
    short: LocalizedText('غريمالدو', 'Grimaldo'),
    role: PlayerRole.df,
    rating: 84,
    label: 'LB',
    clues: [
      LocalizedText(
        'ظهير أيسر يلعب في الدوري الألماني',
        'A left-back in the Bundesliga',
      ),
      LocalizedText(
        'إسباني تخرج من لاماسيا ولعب لبنفيكا',
        'A Spaniard from La Masia who played for Benfica',
      ),
      LocalizedText(
        'فاز بالدوري دون هزيمة مع ليفركوزن 2024',
        'Won an unbeaten league title with Leverkusen in 2024',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'federico_dimarco',
    name: LocalizedText('فيديريكو ديماركو', 'Federico Dimarco'),
    short: LocalizedText('ديماركو', 'Dimarco'),
    role: PlayerRole.df,
    rating: 84,
    label: 'LB',
    clues: [
      LocalizedText(
        'ظهير أيسر يلعب في الدوري الإيطالي',
        'A left-back in Serie A',
      ),
      LocalizedText(
        'مدافع إيطالي دولي من مدينة ميلانو',
        'An Italy international from Milan',
      ),
      LocalizedText(
        'تخرج من أكاديمية إنتر وعاد ليصبح أساسيًا',
        'An Inter academy product who returned to star',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'giovanni_di_lorenzo',
    name: LocalizedText('جيوفاني دي لورينزو', 'Giovanni Di Lorenzo'),
    short: LocalizedText('دي لورينزو', 'Di Lorenzo'),
    role: PlayerRole.df,
    rating: 83,
    label: 'RB',
    clues: [
      LocalizedText(
        'ظهير أيمن يلعب في الدوري الإيطالي',
        'A right-back in Serie A',
      ),
      LocalizedText('مدافع منتخب إيطاليا', 'An Italy international defender'),
      LocalizedText(
        'قائد نابولي المتوج بالدوري 2023',
        'Captain of Napoli\'s 2023 title-winning side',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'pedro_porro',
    name: LocalizedText('بيدرو بورو', 'Pedro Porro'),
    short: LocalizedText('بورو', 'Porro'),
    role: PlayerRole.df,
    rating: 82,
    label: 'RB',
    clues: [
      LocalizedText(
        'ظهير أيمن يلعب في الدوري الإنجليزي',
        'A right-back in the Premier League',
      ),
      LocalizedText(
        'مدافع إسباني دولي يلعب في إنجلترا',
        'A Spain international playing in England',
      ),
      LocalizedText(
        'انتقل من سبورتنغ لشبونة إلى توتنهام',
        'Joined Tottenham from Sporting CP',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'reece_james',
    name: LocalizedText('ريس جيمس', 'Reece James'),
    short: LocalizedText('جيمس', 'James'),
    role: PlayerRole.df,
    rating: 83,
    label: 'RB',
    clues: [
      LocalizedText(
        'ظهير أيمن يلعب في الدوري الإنجليزي',
        'A right-back in the Premier League',
      ),
      LocalizedText(
        'مدافع إنجليزي تخرج من أكاديمية تشيلسي',
        'An English defender from Chelsea\'s academy',
      ),
      LocalizedText(
        'أصبح قائدًا لتشيلسي بعد رحيل أزبيليكويتا',
        'Became Chelsea captain after Azpilicueta left',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'alphonso_davies',
    name: LocalizedText('ألفونسو ديفيز', 'Alphonso Davies'),
    short: LocalizedText('ديفيز', 'Davies'),
    role: PlayerRole.df,
    rating: 83,
    label: 'LB',
    clues: [
      LocalizedText(
        'ظهير أيسر يلعب في الدوري الألماني',
        'A left-back in the Bundesliga',
      ),
      LocalizedText(
        'لاعب كندي محترف في أوروبا',
        'A Canadian playing in Europe',
      ),
      LocalizedText(
        'فاز بدوري أبطال أوروبا مع بايرن 2020',
        'Won the 2020 Champions League with Bayern',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'willian_pacho',
    name: LocalizedText('ويليان باتشو', 'Willian Pacho'),
    short: LocalizedText('باتشو', 'Pacho'),
    role: PlayerRole.df,
    rating: 83,
    clues: [
      LocalizedText(
        'قلب دفاع يلعب في الدوري الفرنسي',
        'A centre-back in Ligue 1',
      ),
      LocalizedText(
        'مدافع إكوادوري لعب في ألمانيا',
        'An Ecuadorian defender who played in Germany',
      ),
      LocalizedText(
        'فاز بدوري الأبطال مع باريس 2025',
        'Won the 2025 Champions League with PSG',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'ronald_araujo',
    name: LocalizedText('رونالد أراوخو', 'Ronald Araújo'),
    short: LocalizedText('أراوخو', 'Araújo'),
    role: PlayerRole.df,
    rating: 82,
    clues: [
      LocalizedText(
        'قلب دفاع يلعب في الدوري الإسباني',
        'A centre-back in La Liga',
      ),
      LocalizedText('مدافع منتخب أوروغواي', 'A Uruguay international defender'),
      LocalizedText(
        'انضم لبرشلونة قادمًا من بوستون ريفر',
        'Joined Barcelona from Boston River',
      ),
    ],
  ),

  // ───────────────────────── Midfielders ─────────────────────────
  AuctionPlayer(
    id: 'sandro_tonali',
    name: LocalizedText('ساندرو تونالي', 'Sandro Tonali'),
    short: LocalizedText('تونالي', 'Tonali'),
    role: PlayerRole.mf,
    rating: 83,
    clues: [
      LocalizedText(
        'لاعب وسط يلعب في الدوري الإنجليزي',
        'A midfielder in the Premier League',
      ),
      LocalizedText(
        'لاعب وسط إيطالي دولي يلعب خارج إيطاليا',
        'An Italy international playing abroad',
      ),
      LocalizedText(
        'انتقل من ميلان إلى نيوكاسل 2023',
        'Moved from AC Milan to Newcastle in 2023',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'sofyan_amrabat',
    name: LocalizedText('سفيان أمرابط', 'Sofyan Amrabat'),
    short: LocalizedText('أمرابط', 'Amrabat'),
    role: PlayerRole.mf,
    rating: 80,
    label: 'CDM',
    clues: [
      LocalizedText(
        'لاعب وسط دفاعي يلعب في أوروبا',
        'A defensive midfielder in Europe',
      ),
      LocalizedText(
        'لاعب وسط منتخب المغرب',
        'A Morocco international midfielder',
      ),
      LocalizedText(
        'لعب لفيورنتينا ومانشستر يونايتد',
        'Played for Fiorentina and Manchester United',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'sergej_milinkovic_savic',
    name: LocalizedText('سيرغي ميلينكوفيتش سافيتش', 'Sergej Milinković-Savić'),
    short: LocalizedText('سافيتش', 'Savić'),
    role: PlayerRole.mf,
    rating: 83,
    clues: [
      LocalizedText(
        'لاعب وسط يلعب في الدوري السعودي',
        'A midfielder in the Saudi Pro League',
      ),
      LocalizedText(
        'لاعب وسط منتخب صربيا',
        'A Serbia international midfielder',
      ),
      LocalizedText(
        'قضى ثماني سنوات مع لاتسيو قبل الهلال',
        'Spent eight years at Lazio before Al Hilal',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'ruben_neves',
    name: LocalizedText('روبن نيفيز', 'Rúben Neves'),
    short: LocalizedText('نيفيز', 'Neves'),
    role: PlayerRole.mf,
    rating: 82,
    label: 'CDM',
    clues: [
      LocalizedText(
        'لاعب وسط يلعب في الدوري السعودي',
        'A midfielder in the Saudi Pro League',
      ),
      LocalizedText(
        'برتغالي لعب لبورتو في بداياته',
        'A Portuguese who started out at Porto',
      ),
      LocalizedText(
        'انتقل من وولفرهامبتون إلى الهلال 2023',
        'Moved from Wolves to Al Hilal in 2023',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'ngolo_kante',
    name: LocalizedText('نغولو كانتي', 'N\'Golo Kanté'),
    short: LocalizedText('كانتي', 'Kanté'),
    role: PlayerRole.mf,
    rating: 82,
    label: 'CDM',
    clues: [
      LocalizedText(
        'لاعب وسط دفاعي لعب في الدوري الإنجليزي',
        'A defensive midfielder who played in England',
      ),
      LocalizedText(
        'فرنسي انتقل للدوري السعودي',
        'A Frenchman who moved to Saudi Arabia',
      ),
      LocalizedText(
        'فاز بالدوري الإنجليزي مع ليستر ثم تشيلسي',
        'Won the Premier League with Leicester then Chelsea',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'marcelo_brozovic',
    name: LocalizedText('مارسيلو بروزوفيتش', 'Marcelo Brozović'),
    short: LocalizedText('بروزوفيتش', 'Brozović'),
    role: PlayerRole.mf,
    rating: 81,
    label: 'CDM',
    clues: [
      LocalizedText(
        'لاعب وسط يلعب في الدوري السعودي',
        'A midfielder in the Saudi Pro League',
      ),
      LocalizedText(
        'لاعب وسط منتخب كرواتيا',
        'A Croatia international midfielder',
      ),
      LocalizedText(
        'قضى سنوات طويلة مع إنتر قبل النصر',
        'Spent many years at Inter before Al Nassr',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'dani_olmo',
    name: LocalizedText('داني أولمو', 'Dani Olmo'),
    short: LocalizedText('أولمو', 'Olmo'),
    role: PlayerRole.mf,
    rating: 84,
    label: 'CAM',
    clues: [
      LocalizedText(
        'لاعب وسط هجومي في الدوري الإسباني',
        'An attacking midfielder in La Liga',
      ),
      LocalizedText(
        'إسباني لعب في كرواتيا وألمانيا',
        'A Spaniard who played in Croatia and Germany',
      ),
      LocalizedText(
        'عاد لبرشلونة قادمًا من لايبزيغ 2024',
        'Returned to Barcelona from RB Leipzig in 2024',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'fermin_lopez',
    name: LocalizedText('فيرمين لوبيز', 'Fermín López'),
    short: LocalizedText('فيرمين', 'Fermín'),
    role: PlayerRole.mf,
    rating: 81,
    label: 'CAM',
    clues: [
      LocalizedText(
        'لاعب وسط يلعب في الدوري الإسباني',
        'A midfielder in La Liga',
      ),
      LocalizedText(
        'لاعب إسباني شاب من أكاديمية برشلونة',
        'A young Spaniard from Barcelona\'s academy',
      ),
      LocalizedText(
        'فاز بذهبية أولمبياد باريس 2024 مع إسبانيا',
        'Won Olympic gold with Spain at Paris 2024',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'gavi',
    name: LocalizedText('غافي', 'Gavi'),
    short: LocalizedText('غافي', 'Gavi'),
    role: PlayerRole.mf,
    rating: 82,
    clues: [
      LocalizedText(
        'لاعب وسط يلعب في الدوري الإسباني',
        'A midfielder in La Liga',
      ),
      LocalizedText(
        'لاعب إسباني من أكاديمية لاماسيا',
        'A Spaniard from La Masia',
      ),
      LocalizedText(
        'فاز بجائزة الفتى الذهبي 2022',
        'Won the 2022 Golden Boy award',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'aurelien_tchouameni',
    name: LocalizedText('أوريليان تشواميني', 'Aurélien Tchouaméni'),
    short: LocalizedText('تشواميني', 'Tchouaméni'),
    role: PlayerRole.mf,
    rating: 84,
    label: 'CDM',
    clues: [
      LocalizedText(
        'لاعب وسط دفاعي في الدوري الإسباني',
        'A defensive midfielder in La Liga',
      ),
      LocalizedText('لاعب وسط فرنسي دولي', 'A France international midfielder'),
      LocalizedText(
        'انتقل من موناكو لريال مدريد 2022',
        'Moved from Monaco to Real Madrid in 2022',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'eduardo_camavinga',
    name: LocalizedText('إدواردو كامافينغا', 'Eduardo Camavinga'),
    short: LocalizedText('كامافينغا', 'Camavinga'),
    role: PlayerRole.mf,
    rating: 83,
    clues: [
      LocalizedText(
        'لاعب وسط يلعب في الدوري الإسباني',
        'A midfielder in La Liga',
      ),
      LocalizedText(
        'لاعب وسط فرنسي دولي وُلد في أنغولا',
        'A France international born in Angola',
      ),
      LocalizedText(
        'انتقل من رين لريال مدريد 2021',
        'Moved from Rennes to Real Madrid in 2021',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'arda_guler',
    name: LocalizedText('أردا غولر', 'Arda Güler'),
    short: LocalizedText('غولر', 'Güler'),
    role: PlayerRole.mf,
    rating: 83,
    label: 'CAM',
    clues: [
      LocalizedText(
        'لاعب وسط هجومي في الدوري الإسباني',
        'An attacking midfielder in La Liga',
      ),
      LocalizedText(
        'لاعب تركي شاب محترف في أوروبا',
        'A young Turkish player abroad',
      ),
      LocalizedText(
        'انتقل من فنربخشة لريال مدريد 2023',
        'Moved from Fenerbahçe to Real Madrid in 2023',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'scott_mctominay',
    name: LocalizedText('سكوت مكتوميناي', 'Scott McTominay'),
    short: LocalizedText('مكتوميناي', 'McTominay'),
    role: PlayerRole.mf,
    rating: 84,
    clues: [
      LocalizedText(
        'لاعب وسط يلعب في الدوري الإيطالي',
        'A midfielder in Serie A',
      ),
      LocalizedText(
        'اسكتلندي تخرج من أكاديمية مانشستر يونايتد',
        'A Scot from Manchester United\'s academy',
      ),
      LocalizedText(
        'اختير أفضل لاعب في الدوري الإيطالي 2025',
        'Named Serie A MVP in 2025',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'eberechi_eze',
    name: LocalizedText('إيبيريتشي إيزي', 'Eberechi Eze'),
    short: LocalizedText('إيزي', 'Eze'),
    role: PlayerRole.mf,
    rating: 83,
    label: 'CAM',
    clues: [
      LocalizedText(
        'لاعب وسط هجومي في الدوري الإنجليزي',
        'An attacking midfielder in the Premier League',
      ),
      LocalizedText(
        'إنجليزي دولي لعب لكريستال بالاس',
        'An England international who played for Palace',
      ),
      LocalizedText(
        'انتقل لأرسنال بعد التتويج بكأس الاتحاد 2025',
        'Joined Arsenal after winning the 2025 FA Cup',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'morgan_rogers',
    name: LocalizedText('مورغان روجرز', 'Morgan Rogers'),
    short: LocalizedText('روجرز', 'Rogers'),
    role: PlayerRole.mf,
    rating: 82,
    label: 'CAM',
    clues: [
      LocalizedText(
        'لاعب وسط هجومي في الدوري الإنجليزي',
        'An attacking midfielder in the Premier League',
      ),
      LocalizedText(
        'إنجليزي شاب تخرج من أكاديمية مانشستر سيتي',
        'A young Englishman from Man City\'s academy',
      ),
      LocalizedText(
        'تألق مع أستون فيلا بعد قدومه من ميدلزبره',
        'Shone at Aston Villa after joining from Middlesbrough',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'aleksandar_pavlovic',
    name: LocalizedText('ألكسندر بافلوفيتش', 'Aleksandar Pavlović'),
    short: LocalizedText('بافلوفيتش', 'Pavlović'),
    role: PlayerRole.mf,
    rating: 82,
    label: 'CDM',
    clues: [
      LocalizedText(
        'لاعب وسط يلعب في الدوري الألماني',
        'A midfielder in the Bundesliga',
      ),
      LocalizedText(
        'ألماني شاب من أصول صربية',
        'A young German of Serbian descent',
      ),
      LocalizedText(
        'تخرج من أكاديمية بايرن ميونخ',
        'Came through Bayern Munich\'s academy',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'xavi_simons',
    name: LocalizedText('تشافي سيمونز', 'Xavi Simons'),
    short: LocalizedText('سيمونز', 'Simons'),
    role: PlayerRole.mf,
    rating: 82,
    label: 'CAM',
    clues: [
      LocalizedText(
        'لاعب وسط هجومي في الدوري الإنجليزي',
        'An attacking midfielder in the Premier League',
      ),
      LocalizedText(
        'هولندي نشأ في أكاديمية برشلونة',
        'A Dutchman who grew up at Barcelona\'s academy',
      ),
      LocalizedText(
        'انتقل من لايبزيغ إلى توتنهام 2025',
        'Moved from RB Leipzig to Tottenham in 2025',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'teun_koopmeiners',
    name: LocalizedText('تون كوبماينرز', 'Teun Koopmeiners'),
    short: LocalizedText('كوبماينرز', 'Koopmeiners'),
    role: PlayerRole.mf,
    rating: 81,
    clues: [
      LocalizedText(
        'لاعب وسط يلعب في الدوري الإيطالي',
        'A midfielder in Serie A',
      ),
      LocalizedText(
        'لاعب وسط منتخب هولندا',
        'A Netherlands international midfielder',
      ),
      LocalizedText(
        'انتقل من أتالانتا إلى يوفنتوس 2024',
        'Moved from Atalanta to Juventus in 2024',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'brahim_diaz',
    name: LocalizedText('إبراهيم دياز', 'Brahim Díaz'),
    short: LocalizedText('إبراهيم', 'Brahim'),
    role: PlayerRole.mf,
    rating: 81,
    label: 'CAM',
    clues: [
      LocalizedText(
        'لاعب وسط هجومي في الدوري الإسباني',
        'An attacking midfielder in La Liga',
      ),
      LocalizedText(
        'لاعب دولي مغربي وُلد في إسبانيا',
        'A Morocco international born in Spain',
      ),
      LocalizedText(
        'لعب لمانشستر سيتي وميلان ثم ريال مدريد',
        'Played for Man City and Milan, then Real Madrid',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'youri_tielemans',
    name: LocalizedText('يوري تيليمانس', 'Youri Tielemans'),
    short: LocalizedText('تيليمانس', 'Tielemans'),
    role: PlayerRole.mf,
    rating: 81,
    clues: [
      LocalizedText(
        'لاعب وسط يلعب في الدوري الإنجليزي',
        'A midfielder in the Premier League',
      ),
      LocalizedText(
        'لاعب وسط منتخب بلجيكا',
        'A Belgium international midfielder',
      ),
      LocalizedText(
        'فاز بكأس الاتحاد الإنجليزي مع ليستر 2021',
        'Won the 2021 FA Cup with Leicester',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'granit_xhaka',
    name: LocalizedText('غرانيت تشاكا', 'Granit Xhaka'),
    short: LocalizedText('تشاكا', 'Xhaka'),
    role: PlayerRole.mf,
    rating: 83,
    clues: [
      LocalizedText(
        'لاعب وسط يلعب في الدوري الإنجليزي',
        'A midfielder in the Premier League',
      ),
      LocalizedText(
        'لاعب وسط سويسري لعب لأرسنال سابقًا',
        'A Swiss midfielder who once played for Arsenal',
      ),
      LocalizedText(
        'فاز بالدوري دون هزيمة مع ليفركوزن 2024',
        'Won an unbeaten league title with Leverkusen in 2024',
      ),
    ],
  ),

  // ───────────────────────── Forwards ─────────────────────────
  AuctionPlayer(
    id: 'omar_marmoush',
    name: LocalizedText('عمر مرموش', 'Omar Marmoush'),
    short: LocalizedText('مرموش', 'Marmoush'),
    role: PlayerRole.fw,
    rating: 84,
    clues: [
      LocalizedText(
        'مهاجم يلعب في الدوري الإنجليزي',
        'A forward in the Premier League',
      ),
      LocalizedText(
        'لاعب مصري محترف في أوروبا',
        'An Egyptian playing in Europe',
      ),
      LocalizedText(
        'تألق مع آينتراخت فرانكفورت قبل انتقاله لإنجلترا',
        'Shone at Eintracht Frankfurt before moving to England',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'riyad_mahrez',
    name: LocalizedText('رياض محرز', 'Riyad Mahrez'),
    short: LocalizedText('محرز', 'Mahrez'),
    role: PlayerRole.fw,
    rating: 82,
    label: 'RW',
    clues: [
      LocalizedText(
        'جناح يلعب في الدوري السعودي',
        'A winger in the Saudi Pro League',
      ),
      LocalizedText(
        'جناح جزائري لعب سنوات في إنجلترا',
        'An Algerian winger who spent years in England',
      ),
      LocalizedText(
        'فاز بالدوري الإنجليزي مع ليستر سيتي 2016',
        'Won the 2016 Premier League with Leicester',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'amine_gouiri',
    name: LocalizedText('أمين غويري', 'Amine Gouiri'),
    short: LocalizedText('غويري', 'Gouiri'),
    role: PlayerRole.fw,
    rating: 80,
    clues: [
      LocalizedText('مهاجم يلعب في الدوري الفرنسي', 'A forward in Ligue 1'),
      LocalizedText(
        'مهاجم دولي جزائري وُلد في فرنسا',
        'An Algeria international born in France',
      ),
      LocalizedText(
        'لعب لنيس ورين قبل انتقاله لمرسيليا',
        'Played for Nice and Rennes before Marseille',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'youssef_en_nesyri',
    name: LocalizedText('يوسف النصيري', 'Youssef En-Nesyri'),
    short: LocalizedText('النصيري', 'En-Nesyri'),
    role: PlayerRole.fw,
    rating: 80,
    clues: [
      LocalizedText(
        'مهاجم لعب في الدوري الإسباني',
        'A striker who played in La Liga',
      ),
      LocalizedText('مهاجم منتخب المغرب', 'A Morocco international striker'),
      LocalizedText(
        'فاز بالدوري الأوروبي مع إشبيلية 2023',
        'Won the 2023 Europa League with Sevilla',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'sadio_mane',
    name: LocalizedText('ساديو ماني', 'Sadio Mané'),
    short: LocalizedText('ماني', 'Mané'),
    role: PlayerRole.fw,
    rating: 82,
    label: 'LW',
    clues: [
      LocalizedText(
        'مهاجم يلعب في الدوري السعودي',
        'A forward in the Saudi Pro League',
      ),
      LocalizedText(
        'سنغالي لعب لليفربول وبايرن',
        'A Senegalese who played for Liverpool and Bayern',
      ),
      LocalizedText(
        'فاز بكأس أمم أفريقيا 2021 مع بلاده',
        'Won the 2021 Africa Cup of Nations',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'ademola_lookman',
    name: LocalizedText('أديمولا لوكمان', 'Ademola Lookman'),
    short: LocalizedText('لوكمان', 'Lookman'),
    role: PlayerRole.fw,
    rating: 83,
    label: 'LW',
    clues: [
      LocalizedText('مهاجم يلعب في الدوري الإيطالي', 'A forward in Serie A'),
      LocalizedText(
        'جناح دولي نيجيري وُلد في لندن',
        'A Nigeria international born in London',
      ),
      LocalizedText(
        'فاز بالدوري الأوروبي مع أتالانتا 2024',
        'Won the 2024 Europa League with Atalanta',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'serhou_guirassy',
    name: LocalizedText('سيرو غيراسي', 'Serhou Guirassy'),
    short: LocalizedText('غيراسي', 'Guirassy'),
    role: PlayerRole.fw,
    rating: 83,
    clues: [
      LocalizedText(
        'مهاجم يلعب في الدوري الألماني',
        'A striker in the Bundesliga',
      ),
      LocalizedText('مهاجم منتخب غينيا', 'A Guinea international striker'),
      LocalizedText(
        'تألق تهديفيًا مع شتوتغارت قبل دورتموند',
        'Scored freely at Stuttgart before Dortmund',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'ollie_watkins',
    name: LocalizedText('أولي واتكينز', 'Ollie Watkins'),
    short: LocalizedText('واتكينز', 'Watkins'),
    role: PlayerRole.fw,
    rating: 83,
    clues: [
      LocalizedText(
        'مهاجم يلعب في الدوري الإنجليزي',
        'A striker in the Premier League',
      ),
      LocalizedText('مهاجم منتخب إنجلترا', 'An England international striker'),
      LocalizedText(
        'انتقل من برينتفورد إلى أستون فيلا 2020',
        'Moved from Brentford to Aston Villa in 2020',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'jarrod_bowen',
    name: LocalizedText('جارود بوين', 'Jarrod Bowen'),
    short: LocalizedText('بوين', 'Bowen'),
    role: PlayerRole.fw,
    rating: 82,
    label: 'RW',
    clues: [
      LocalizedText(
        'جناح يلعب في الدوري الإنجليزي',
        'A winger in the Premier League',
      ),
      LocalizedText(
        'إنجليزي دولي جاء من هال سيتي',
        'An England international who came from Hull City',
      ),
      LocalizedText(
        'فاز بدوري المؤتمر الأوروبي مع وست هام 2023',
        'Won the 2023 Conference League with West Ham',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'bryan_mbeumo',
    name: LocalizedText('برايان مبيومو', 'Bryan Mbeumo'),
    short: LocalizedText('مبيومو', 'Mbeumo'),
    role: PlayerRole.fw,
    rating: 83,
    label: 'RW',
    clues: [
      LocalizedText(
        'جناح يلعب في الدوري الإنجليزي',
        'A winger in the Premier League',
      ),
      LocalizedText(
        'لاعب دولي كاميروني وُلد في فرنسا',
        'A Cameroon international born in France',
      ),
      LocalizedText(
        'انتقل من برينتفورد لمانشستر يونايتد 2025',
        'Moved from Brentford to Manchester United in 2025',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'matheus_cunha',
    name: LocalizedText('ماتيوس كونيا', 'Matheus Cunha'),
    short: LocalizedText('كونيا', 'Cunha'),
    role: PlayerRole.fw,
    rating: 82,
    clues: [
      LocalizedText(
        'مهاجم يلعب في الدوري الإنجليزي',
        'A forward in the Premier League',
      ),
      LocalizedText(
        'برازيلي لعب لأتلتيكو مدريد',
        'A Brazilian who played for Atlético Madrid',
      ),
      LocalizedText(
        'انتقل من وولفرهامبتون لمانشستر يونايتد 2025',
        'Moved from Wolves to Manchester United in 2025',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'dusan_vlahovic',
    name: LocalizedText('دوسان فلاهوفيتش', 'Dušan Vlahović'),
    short: LocalizedText('فلاهوفيتش', 'Vlahović'),
    role: PlayerRole.fw,
    rating: 82,
    clues: [
      LocalizedText(
        'مهاجم لعب في الدوري الإيطالي',
        'A striker who played in Serie A',
      ),
      LocalizedText('مهاجم منتخب صربيا', 'A Serbia international striker'),
      LocalizedText(
        'انتقل من فيورنتينا إلى يوفنتوس 2022',
        'Moved from Fiorentina to Juventus in 2022',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'marcus_thuram',
    name: LocalizedText('ماركوس تورام', 'Marcus Thuram'),
    short: LocalizedText('تورام', 'Thuram'),
    role: PlayerRole.fw,
    rating: 84,
    clues: [
      LocalizedText('مهاجم يلعب في الدوري الإيطالي', 'A striker in Serie A'),
      LocalizedText(
        'فرنسي دولي والده بطل عالم سابق',
        'A France international whose father won the World Cup',
      ),
      LocalizedText(
        'انتقل من غلادباخ إلى إنتر 2023',
        'Moved from Gladbach to Inter in 2023',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'rafael_leao',
    name: LocalizedText('رافائيل لياو', 'Rafael Leão'),
    short: LocalizedText('لياو', 'Leão'),
    role: PlayerRole.fw,
    rating: 84,
    label: 'LW',
    clues: [
      LocalizedText(
        'جناح أيسر يلعب في الدوري الإيطالي',
        'A left winger in Serie A',
      ),
      LocalizedText(
        'جناح برتغالي دولي لعب في فرنسا',
        'A Portugal international who played in France',
      ),
      LocalizedText(
        'اختير أفضل لاعب في الدوري مع ميلان 2022',
        'Serie A MVP with AC Milan in 2022',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'christopher_nkunku',
    name: LocalizedText('كريستوفر نكونكو', 'Christopher Nkunku'),
    short: LocalizedText('نكونكو', 'Nkunku'),
    role: PlayerRole.fw,
    rating: 81,
    clues: [
      LocalizedText('مهاجم يلعب في الدوري الإيطالي', 'A forward in Serie A'),
      LocalizedText(
        'فرنسي تخرج من أكاديمية باريس سان جيرمان',
        'A Frenchman from PSG\'s academy',
      ),
      LocalizedText(
        'توّج هدافًا للدوري الألماني مع لايبزيغ',
        'Was Bundesliga top scorer with RB Leipzig',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'bradley_barcola',
    name: LocalizedText('برادلي باركولا', 'Bradley Barcola'),
    short: LocalizedText('باركولا', 'Barcola'),
    role: PlayerRole.fw,
    rating: 83,
    label: 'LW',
    clues: [
      LocalizedText('جناح يلعب في الدوري الفرنسي', 'A winger in Ligue 1'),
      LocalizedText(
        'فرنسي شاب تخرج من أكاديمية ليون',
        'A young Frenchman from Lyon\'s academy',
      ),
      LocalizedText(
        'انتقل من ليون إلى باريس سان جيرمان 2023',
        'Moved from Lyon to PSG in 2023',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'desire_doue',
    name: LocalizedText('ديزيريه دويه', 'Désiré Doué'),
    short: LocalizedText('دويه', 'Doué'),
    role: PlayerRole.fw,
    rating: 84,
    label: 'RW',
    clues: [
      LocalizedText('جناح يلعب في الدوري الفرنسي', 'A winger in Ligue 1'),
      LocalizedText(
        'فرنسي شاب بدأ مسيرته مع رين',
        'A young Frenchman who started at Rennes',
      ),
      LocalizedText(
        'سجل في نهائي دوري الأبطال 2025',
        'Scored in the 2025 Champions League final',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'nico_williams',
    name: LocalizedText('نيكو ويليامز', 'Nico Williams'),
    short: LocalizedText('نيكو', 'Nico'),
    role: PlayerRole.fw,
    rating: 84,
    label: 'LW',
    clues: [
      LocalizedText('جناح يلعب في الدوري الإسباني', 'A winger in La Liga'),
      LocalizedText(
        'جناح إسباني دولي من أصول غانية',
        'A Spain international of Ghanaian descent',
      ),
      LocalizedText('سجل في نهائي يورو 2024', 'Scored in the Euro 2024 final'),
    ],
  ),
  AuctionPlayer(
    id: 'mikel_oyarzabal',
    name: LocalizedText('ميكيل أويارزابال', 'Mikel Oyarzabal'),
    short: LocalizedText('أويارزابال', 'Oyarzabal'),
    role: PlayerRole.fw,
    rating: 82,
    clues: [
      LocalizedText('مهاجم يلعب في الدوري الإسباني', 'A forward in La Liga'),
      LocalizedText('قائد نادٍ من إقليم الباسك', 'Captain of a Basque club'),
      LocalizedText('سجل في نهائي يورو 2024', 'Scored in the Euro 2024 final'),
    ],
  ),
  AuctionPlayer(
    id: 'kingsley_coman',
    name: LocalizedText('كينغسلي كومان', 'Kingsley Coman'),
    short: LocalizedText('كومان', 'Coman'),
    role: PlayerRole.fw,
    rating: 82,
    label: 'LW',
    clues: [
      LocalizedText(
        'جناح يلعب في الدوري السعودي',
        'A winger in the Saudi Pro League',
      ),
      LocalizedText(
        'فرنسي دولي لعب لباريس ويوفنتوس',
        'A France international who played for PSG and Juventus',
      ),
      LocalizedText(
        'انتقل من بايرن إلى النصر 2025',
        'Moved from Bayern to Al Nassr in 2025',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'joao_felix',
    name: LocalizedText('جواو فيليكس', 'João Félix'),
    short: LocalizedText('فيليكس', 'Félix'),
    role: PlayerRole.fw,
    rating: 80,
    label: 'CF',
    clues: [
      LocalizedText(
        'مهاجم يلعب في الدوري السعودي',
        'A forward in the Saudi Pro League',
      ),
      LocalizedText(
        'برتغالي لعب لتشيلسي وبرشلونة معارًا',
        'A Portuguese who had loans at Chelsea and Barcelona',
      ),
      LocalizedText(
        'انتقل من بنفيكا لأتلتيكو بصفقة ضخمة 2019',
        'Joined Atlético from Benfica in a huge 2019 deal',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'darwin_nunez',
    name: LocalizedText('داروين نونيز', 'Darwin Núñez'),
    short: LocalizedText('نونيز', 'Núñez'),
    role: PlayerRole.fw,
    rating: 81,
    clues: [
      LocalizedText(
        'مهاجم يلعب في الدوري السعودي',
        'A striker in the Saudi Pro League',
      ),
      LocalizedText('مهاجم منتخب أوروغواي', 'A Uruguay international striker'),
      LocalizedText(
        'انتقل من ليفربول إلى الهلال 2025',
        'Moved from Liverpool to Al Hilal in 2025',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'hugo_ekitike',
    name: LocalizedText('هوغو إيكيتيكي', 'Hugo Ekitiké'),
    short: LocalizedText('إيكيتيكي', 'Ekitiké'),
    role: PlayerRole.fw,
    rating: 83,
    clues: [
      LocalizedText(
        'مهاجم يلعب في الدوري الإنجليزي',
        'A striker in the Premier League',
      ),
      LocalizedText(
        'فرنسي لعب لباريس سان جيرمان',
        'A Frenchman who played for PSG',
      ),
      LocalizedText(
        'انتقل من فرانكفورت إلى ليفربول 2025',
        'Moved from Eintracht Frankfurt to Liverpool in 2025',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'jonathan_david',
    name: LocalizedText('جوناثان ديفيد', 'Jonathan David'),
    short: LocalizedText('ديفيد', 'David'),
    role: PlayerRole.fw,
    rating: 82,
    clues: [
      LocalizedText('مهاجم يلعب في الدوري الإيطالي', 'A striker in Serie A'),
      LocalizedText('مهاجم كندي دولي', 'A Canada international striker'),
      LocalizedText(
        'انتقل من ليل إلى يوفنتوس 2025',
        'Moved from Lille to Juventus in 2025',
      ),
    ],
  ),
  AuctionPlayer(
    id: 'leroy_sane',
    name: LocalizedText('ليروي ساني', 'Leroy Sané'),
    short: LocalizedText('ساني', 'Sané'),
    role: PlayerRole.fw,
    rating: 82,
    label: 'RW',
    clues: [
      LocalizedText(
        'جناح لعب في الدوري الألماني',
        'A winger who played in the Bundesliga',
      ),
      LocalizedText(
        'جناح ألماني دولي لعب في إنجلترا',
        'A Germany international who played in England',
      ),
      LocalizedText(
        'انتقل من بايرن إلى غلطة سراي 2025',
        'Moved from Bayern to Galatasaray in 2025',
      ),
    ],
  ),
];
