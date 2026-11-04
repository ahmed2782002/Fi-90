import 'package:fii90/core/localization/localized_text.dart';

class ComebackQuestion {
  const ComebackQuestion({
    required this.name,
    required this.aliases,
    required this.meta,
    required this.wrong,
    required this.clubs,
  });

  final LocalizedText name;
  final List<String> aliases;
  final LocalizedText meta;
  final List<String> wrong;
  final List<({LocalizedText name, String year, String logo, int color})> clubs;

  static const _dir = 'assets/image/comeback/';

  static const _atm = LocalizedText('أتلتيكو مدريد', 'Atlético Madrid');
  static const _liv = LocalizedText('ليفربول', 'Liverpool');
  static const _che = LocalizedText('تشيلسي', 'Chelsea');
  static const _mil = LocalizedText('ميلان', 'AC Milan');
  static const _mun = LocalizedText('مانشستر يونايتد', 'Manchester United');
  static const _rma = LocalizedText('ريال مدريد', 'Real Madrid');
  static const _juv = LocalizedText('يوفنتوس', 'Juventus');
  static const _bar = LocalizedText('برشلونة', 'Barcelona');
  static const _san = LocalizedText('سانتوس', 'Santos');
  static const _ars = LocalizedText('أرسنال', 'Arsenal');
  static const _spfc = LocalizedText('ساو باولو', 'São Paulo');

  static const mock = [
    ComebackQuestion(
      name: LocalizedText('فرناندو توريس', 'Fernando Torres'),
      aliases: [
        'فرناندو توريس',
        'توريس',
        'fernando torres',
        'torres',
        'el nino',
        'النينيو',
      ],
      meta: LocalizedText('إسبانيا · مهاجم', 'Spain · Striker'),
      wrong: ['ديفيد فيا', 'فرناندو مورينتس'],
      clubs: [
        (name: _atm, year: '2001', logo: '${_dir}atm.png', color: 0xFFCB3524),
        (name: _liv, year: '2007', logo: '${_dir}liv.png', color: 0xFFC8102E),
        (name: _che, year: '2011', logo: '${_dir}che.png', color: 0xFF034694),
        (name: _mil, year: '2014', logo: '${_dir}mil.png', color: 0xFFE1000F),
        (name: _atm, year: '2015', logo: '${_dir}atm.png', color: 0xFFCB3524),
        (
          name: LocalizedText('ساغان توسو', 'Sagan Tosu'),
          year: '2018',
          logo: '${_dir}sagan_tosu.png',
          color: 0xFF2A7FC9,
        ),
      ],
    ),
    ComebackQuestion(
      name: LocalizedText('كريستيانو رونالدو', 'Cristiano Ronaldo'),
      aliases: [
        'كريستيانو رونالدو',
        'رونالدو',
        'كريستيانو',
        'cristiano ronaldo',
        'ronaldo',
        'cr7',
      ],
      meta: LocalizedText('البرتغال · مهاجم', 'Portugal · Forward'),
      wrong: ['ناني', 'لويس فيغو'],
      clubs: [
        (
          name: LocalizedText('سبورتينغ لشبونة', 'Sporting CP'),
          year: '2002',
          logo: '${_dir}sporting.png',
          color: 0xFF008057,
        ),
        (name: _mun, year: '2003', logo: '${_dir}mun.png', color: 0xFFDA291C),
        (name: _rma, year: '2009', logo: '${_dir}rma.png', color: 0xFFFEBE10),
        (name: _juv, year: '2018', logo: '${_dir}juv.png', color: 0xFF111111),
        (name: _mun, year: '2021', logo: '${_dir}mun.png', color: 0xFFDA291C),
        (
          name: LocalizedText('النصر', 'Al Nassr'),
          year: '2023',
          logo: '${_dir}nassr.png',
          color: 0xFFF7D417,
        ),
      ],
    ),
    ComebackQuestion(
      name: LocalizedText('محمد صلاح', 'Mohamed Salah'),
      aliases: ['محمد صلاح', 'صلاح', 'mohamed salah', 'salah'],
      meta: LocalizedText('مصر · جناح', 'Egypt · Winger'),
      wrong: ['محمد النني', 'عمر مرموش'],
      clubs: [
        (
          name: LocalizedText('المقاولون العرب', 'El Mokawloon'),
          year: '2010',
          logo: '${_dir}mokawloon.png',
          color: 0xFFF2C200,
        ),
        (
          name: LocalizedText('بازل', 'Basel'),
          year: '2012',
          logo: '${_dir}basel.png',
          color: 0xFFC8102E,
        ),
        (name: _che, year: '2014', logo: '${_dir}che.png', color: 0xFF034694),
        (
          name: LocalizedText('فيورنتينا', 'Fiorentina'),
          year: '2015',
          logo: '${_dir}fio.png',
          color: 0xFF5B2B82,
        ),
        (
          name: LocalizedText('روما', 'Roma'),
          year: '2015',
          logo: '${_dir}rom.png',
          color: 0xFF8E1F2F,
        ),
        (name: _liv, year: '2017', logo: '${_dir}liv.png', color: 0xFFC8102E),
      ],
    ),
    ComebackQuestion(
      name: LocalizedText('نيمار', 'Neymar'),
      aliases: ['نيمار', 'نيمار جونيور', 'neymar'],
      meta: LocalizedText('البرازيل · جناح', 'Brazil · Winger'),
      wrong: ['رونالدينيو', 'فينيسيوس جونيور'],
      clubs: [
        (name: _san, year: '2009', logo: '${_dir}santos.png', color: 0xFF111111),
        (name: _bar, year: '2013', logo: '${_dir}bar.png', color: 0xFFA50044),
        (
          name: LocalizedText('باريس سان جيرمان', 'Paris Saint-Germain'),
          year: '2017',
          logo: '${_dir}psg.png',
          color: 0xFF004170,
        ),
        (
          name: LocalizedText('الهلال', 'Al Hilal'),
          year: '2023',
          logo: '${_dir}hilal.png',
          color: 0xFF1A4FB3,
        ),
        (name: _san, year: '2025', logo: '${_dir}santos.png', color: 0xFF111111),
      ],
    ),
    ComebackQuestion(
      name: LocalizedText('روبرت ليفاندوفسكي', 'Robert Lewandowski'),
      aliases: [
        'روبرت ليفاندوفسكي',
        'ليفاندوفسكي',
        'lewandowski',
        'robert lewandowski',
      ],
      meta: LocalizedText('بولندا · مهاجم', 'Poland · Striker'),
      wrong: ['ماريو جوتزه', 'ماركو رويس'],
      clubs: [
        (
          name: LocalizedText('زنيتش بروشكوف', 'Znicz Pruszków'),
          year: '2006',
          logo: '${_dir}znicz.png',
          color: 0xFFE30613,
        ),
        (
          name: LocalizedText('ليخ بوزنان', 'Lech Poznań'),
          year: '2008',
          logo: '${_dir}lech.png',
          color: 0xFF1D5CA8,
        ),
        (
          name: LocalizedText('بوروسيا دورتموند', 'Borussia Dortmund'),
          year: '2010',
          logo: '${_dir}bvb.png',
          color: 0xFFFDE100,
        ),
        (
          name: LocalizedText('بايرن ميونخ', 'Bayern Munich'),
          year: '2014',
          logo: '${_dir}bayern.png',
          color: 0xFFDC052D,
        ),
        (name: _bar, year: '2022', logo: '${_dir}bar.png', color: 0xFFA50044),
      ],
    ),
    ComebackQuestion(
      name: LocalizedText('تييري هنري', 'Thierry Henry'),
      aliases: ['تييري هنري', 'هنري', 'thierry henry', 'henry'],
      meta: LocalizedText('فرنسا · مهاجم', 'France · Striker'),
      wrong: ['دافيد تريزيجيه', 'نيكولا أنيلكا'],
      clubs: [
        (
          name: LocalizedText('موناكو', 'Monaco'),
          year: '1994',
          logo: '${_dir}monaco.png',
          color: 0xFFE51B22,
        ),
        (name: _juv, year: '1999', logo: '${_dir}juv.png', color: 0xFF111111),
        (name: _ars, year: '1999', logo: '${_dir}ars.png', color: 0xFFEF0107),
        (name: _bar, year: '2007', logo: '${_dir}bar.png', color: 0xFFA50044),
        (
          name: LocalizedText('نيويورك ريد بولز', 'New York Red Bulls'),
          year: '2010',
          logo: '${_dir}nyrb.png',
          color: 0xFFED1E36,
        ),
        (name: _ars, year: '2012', logo: '${_dir}ars.png', color: 0xFFEF0107),
      ],
    ),
    ComebackQuestion(
      name: LocalizedText('كاكا', 'Kaká'),
      aliases: ['كاكا', 'kaka', 'ricardo kaka'],
      meta: LocalizedText('البرازيل · وسط', 'Brazil · Midfielder'),
      wrong: ['رونالدينيو', 'ريفالدو'],
      clubs: [
        (name: _spfc, year: '2001', logo: '${_dir}spfc.png', color: 0xFFE30613),
        (name: _mil, year: '2003', logo: '${_dir}mil.png', color: 0xFFE1000F),
        (name: _rma, year: '2009', logo: '${_dir}rma.png', color: 0xFFFEBE10),
        (name: _mil, year: '2013', logo: '${_dir}mil.png', color: 0xFFE1000F),
        (name: _spfc, year: '2014', logo: '${_dir}spfc.png', color: 0xFFE30613),
        (
          name: LocalizedText('أورلاندو سيتي', 'Orlando City'),
          year: '2015',
          logo: '${_dir}orlando.png',
          color: 0xFF633492,
        ),
      ],
    ),
  ];
}
