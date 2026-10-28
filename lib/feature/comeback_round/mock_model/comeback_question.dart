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
  final List<({LocalizedText name, String year, String abbr, int color})> clubs;

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
        (name: _atm, year: '2001', abbr: 'ATM', color: 0xFFCB3524),
        (name: _liv, year: '2007', abbr: 'LFC', color: 0xFFC8102E),
        (name: _che, year: '2011', abbr: 'CFC', color: 0xFF034694),
        (name: _mil, year: '2014', abbr: 'ACM', color: 0xFFE1000F),
        (name: _atm, year: '2015', abbr: 'ATM', color: 0xFFCB3524),
        (
          name: LocalizedText('ساغان توسو', 'Sagan Tosu'),
          year: '2018',
          abbr: 'SGN',
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
          abbr: 'SCP',
          color: 0xFF008057,
        ),
        (name: _mun, year: '2003', abbr: 'MUN', color: 0xFFDA291C),
        (name: _rma, year: '2009', abbr: 'RMA', color: 0xFFFEBE10),
        (name: _juv, year: '2018', abbr: 'JUV', color: 0xFF111111),
        (name: _mun, year: '2021', abbr: 'MUN', color: 0xFFDA291C),
        (
          name: LocalizedText('النصر', 'Al Nassr'),
          year: '2023',
          abbr: 'NSR',
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
          abbr: 'MOK',
          color: 0xFFF2C200,
        ),
        (
          name: LocalizedText('بازل', 'Basel'),
          year: '2012',
          abbr: 'BAS',
          color: 0xFFC8102E,
        ),
        (name: _che, year: '2014', abbr: 'CFC', color: 0xFF034694),
        (
          name: LocalizedText('فيورنتينا', 'Fiorentina'),
          year: '2015',
          abbr: 'FIO',
          color: 0xFF5B2B82,
        ),
        (
          name: LocalizedText('روما', 'Roma'),
          year: '2015',
          abbr: 'ROM',
          color: 0xFF8E1F2F,
        ),
        (name: _liv, year: '2017', abbr: 'LFC', color: 0xFFC8102E),
      ],
    ),
    ComebackQuestion(
      name: LocalizedText('نيمار', 'Neymar'),
      aliases: ['نيمار', 'نيمار جونيور', 'neymar'],
      meta: LocalizedText('البرازيل · جناح', 'Brazil · Winger'),
      wrong: ['رونالدينيو', 'فينيسيوس جونيور'],
      clubs: [
        (name: _san, year: '2009', abbr: 'SAN', color: 0xFF111111),
        (name: _bar, year: '2013', abbr: 'FCB', color: 0xFFA50044),
        (
          name: LocalizedText('باريس سان جيرمان', 'Paris Saint-Germain'),
          year: '2017',
          abbr: 'PSG',
          color: 0xFF004170,
        ),
        (
          name: LocalizedText('الهلال', 'Al Hilal'),
          year: '2023',
          abbr: 'HIL',
          color: 0xFF1A4FB3,
        ),
        (name: _san, year: '2025', abbr: 'SAN', color: 0xFF111111),
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
          abbr: 'ZNI',
          color: 0xFFE30613,
        ),
        (
          name: LocalizedText('ليخ بوزنان', 'Lech Poznań'),
          year: '2008',
          abbr: 'LEC',
          color: 0xFF1D5CA8,
        ),
        (
          name: LocalizedText('بوروسيا دورتموند', 'Borussia Dortmund'),
          year: '2010',
          abbr: 'BVB',
          color: 0xFFFDE100,
        ),
        (
          name: LocalizedText('بايرن ميونخ', 'Bayern Munich'),
          year: '2014',
          abbr: 'FCB',
          color: 0xFFDC052D,
        ),
        (name: _bar, year: '2022', abbr: 'FCB', color: 0xFFA50044),
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
          abbr: 'ASM',
          color: 0xFFE51B22,
        ),
        (name: _juv, year: '1999', abbr: 'JUV', color: 0xFF111111),
        (name: _ars, year: '1999', abbr: 'ARS', color: 0xFFEF0107),
        (name: _bar, year: '2007', abbr: 'FCB', color: 0xFFA50044),
        (
          name: LocalizedText('نيويورك ريد بولز', 'New York Red Bulls'),
          year: '2010',
          abbr: 'NYRB',
          color: 0xFFED1E36,
        ),
        (name: _ars, year: '2012', abbr: 'ARS', color: 0xFFEF0107),
      ],
    ),
    ComebackQuestion(
      name: LocalizedText('كاكا', 'Kaká'),
      aliases: ['كاكا', 'kaka', 'ricardo kaka'],
      meta: LocalizedText('البرازيل · وسط', 'Brazil · Midfielder'),
      wrong: ['رونالدينيو', 'ريفالدو'],
      clubs: [
        (name: _spfc, year: '2001', abbr: 'SPFC', color: 0xFFE30613),
        (name: _mil, year: '2003', abbr: 'ACM', color: 0xFFE1000F),
        (name: _rma, year: '2009', abbr: 'RMA', color: 0xFFFEBE10),
        (name: _mil, year: '2013', abbr: 'ACM', color: 0xFFE1000F),
        (name: _spfc, year: '2014', abbr: 'SPFC', color: 0xFFE30613),
        (
          name: LocalizedText('أورلاندو سيتي', 'Orlando City'),
          year: '2015',
          abbr: 'ORL',
          color: 0xFF633492,
        ),
      ],
    ),
  ];
}
