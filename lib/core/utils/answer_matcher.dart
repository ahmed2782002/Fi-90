abstract final class AnswerMatcher {
  static final _marks = RegExp('[̀-ًͯ-ٰٟـ]');
  static final _alef = RegExp('[أإآ]');
  static final _symbols = RegExp(r'[^\p{L}\p{N} ]', unicode: true);
  static final _spaces = RegExp(r'\s+');

  static String normalize(String input) {
    var s = input.toLowerCase().replaceAll(_marks, '');
    s = s
        .replaceAll(_alef, 'ا')
        .replaceAll('ة', 'ه')
        .replaceAll('ى', 'ي')
        .replaceAll(_symbols, ' ')
        .replaceAll(_spaces, ' ')
        .trim();
    if (s.startsWith('ال')) s = s.substring(2);
    return s.replaceAll(' ', '');
  }

  static int indexIn(String input, List<List<String>> bank) {
    final key = normalize(input);
    if (key.isEmpty) return -1;
    return bank.indexWhere(
      (aliases) => aliases.any((a) => normalize(a) == key),
    );
  }

  static bool matches(String input, List<String> aliases) =>
      indexIn(input, [aliases]) == 0;
}
