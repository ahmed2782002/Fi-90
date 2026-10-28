class HomeSummary {
  const HomeSummary({
    required this.coins,
    required this.notifications,
    required this.onlinePlayers,
    required this.dailyDone,
    required this.dailyTotal,
    required this.dailyHoursLeft,
    required this.dailyXp,
  });

  final int coins;
  final int notifications;
  final String onlinePlayers;
  final int dailyDone;
  final int dailyTotal;
  final int dailyHoursLeft;
  final int dailyXp;

  double get dailyProgress => dailyDone / dailyTotal;

  static const mock = HomeSummary(
    coins: 250,
    notifications: 6,
    onlinePlayers: '1,284',
    dailyDone: 1,
    dailyTotal: 3,
    dailyHoursLeft: 6,
    dailyXp: 150,
  );
}
