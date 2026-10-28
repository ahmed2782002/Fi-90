import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/localization/localized_text.dart';

class ActCard {
  const ActCard(this.name, this.level);

  final LocalizedText name;
  final int level;

  String get levelKey => switch (level) {
    1 => AppStrings.levelEasy,
    2 => AppStrings.levelMedium,
    _ => AppStrings.levelHard,
  };

  static const mock = [
    ActCard(LocalizedText('ليونيل ميسي', 'Lionel Messi'), 1),
    ActCard(LocalizedText('كريستيانو رونالدو', 'Cristiano Ronaldo'), 1),
    ActCard(LocalizedText('محمد صلاح', 'Mohamed Salah'), 1),
    ActCard(LocalizedText('نيمار', 'Neymar'), 1),
    ActCard(LocalizedText('زين الدين زيدان', 'Zinedine Zidane'), 1),
    ActCard(LocalizedText('كيليان مبابي', 'Kylian Mbappé'), 2),
    ActCard(LocalizedText('ديفيد بيكهام', 'David Beckham'), 2),
    ActCard(LocalizedText('رونالدينيو', 'Ronaldinho'), 2),
    ActCard(LocalizedText('زلاتان إبراهيموفيتش', 'Zlatan Ibrahimović'), 2),
    ActCard(LocalizedText('جانلويجي بوفون', 'Gianluigi Buffon'), 2),
    ActCard(LocalizedText('محمد أبوتريكة', 'Mohamed Aboutrika'), 2),
    ActCard(LocalizedText('نجولو كانتي', "N'Golo Kanté"), 3),
    ActCard(LocalizedText('سيرجيو بوسكيتس', 'Sergio Busquets'), 3),
    ActCard(LocalizedText('أندريا بيرلو', 'Andrea Pirlo'), 3),
    ActCard(LocalizedText('كافو', 'Cafu'), 3),
    ActCard(LocalizedText('بارك جي سونغ', 'Park Ji-sung'), 3),
    ActCard(LocalizedText('كلود ماكيليلي', 'Claude Makélélé'), 3),
  ];
}
