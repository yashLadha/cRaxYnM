import 'dart:math';

class Craxy {
  // Mapping of characters to a list of unique symbols that are some fancy stuff only
  Map<String, List<String>> symbols = {
    'a': ['α', 'Á', 'ค', 'ä', 'á', 'Λ', 'ⓐ', 'ﾑ'],
    'b': ['в', 'ß', 'b', '乃', 'ⓑ', '8', '๒', '𝓫'],
    'c': ['🅒', 'ƈ', '₵', 'ḉ', '🄲', '૮', 'ς', 'c̷'],
    'd': ['d̶', '∂', 'Ꮄ', '🅳', '🄳', '🌛', '𝔡', '𝕕'],
    'e': ['ǝ', 'є', '€', 'პ', '🇪​', '乇', '🅴', 'e҉'],
    'f': ['f҉', '🅵', '千', 'ƒ', 'ꎇ', '🄵', '🎏', '𝓯'],
    'g': ['₲', '𝕘', '🅖', '𝓰', '🌀', '9', 'ƃ', 'Ꮆ'],
    'h': ['卄', 'h҉', '🄷', '♓', 'ɦ', 'ԋ', '𝓱', '𝕙'],
    'i': ['🅘', '♗', 'ɨ', '🎐', '!', '🄸', 'ι', '🇮​'],
    'j': ['🇯​', 'ʝ', 'Ĵ', 'ʝ', 'ʆ', 'ว', 'ქ', '🎷'],
    'k': ['🎋', 'k', 'ӄ', '𝙠', 'ƙ', '🅚', '𝕜', 'ⓚ', 'ᴋ'],
    'l': ['ⓛ', 'Ⱡ', 'ℓ', '↳', '𝘭', '👢', 'Ꮭ', '🄻', 'ㄥ'],
    'm': ['ɱ', '๓', '🇲​', 'ʍ', 'ᙢ', 'ℳ', '爪', '〽️'],
    'n': ['🎵', 'n', 'ᑎ', 'ռ', '𝙣', '♫', 'ɳ', 'и', 'ⓝ'],
    'o': ['Ꮎ', 'ø', '๏', 'Ő', '🅾', '🄾', 'Ꭷ', '⚽'],
    'p': ['🅿️', 'Ꭾ', 'ｐ', 'Ꮲ', '卩', 'Ƥ', 'ρ', 'ק', 'ᖘ'],
    'q': ['զ', 'Ƣ', 'ᕴ', 'q̶', 'Ǫ', 'q҉', '🆀', '🅀'],
    'r': ['Ꮢ', '🅁', 'ᖇ', '☈', '𝓻', 'Ɽ', '🌱', 'r', 'r҉'],
    's': ['s', 'ら', '丂', '§', 'ş', 'ֆ', 'ꌗ', 'Ƨ', 'ʂ'],
    't': ['ᖶ', 't̶', 't̲', 'Ե', 'Ƭ', '✞', 't҉', '🌴', '🅃'],
    'u': ['🅄', '⛎', 'ʊ', '☋', '𝓾', '𝖚', 'ⓤ', 'Ꮼ'],
    'v': ['Ꮙ', 'ש', 'v', 'ง', 'v̶', '✅', '✓', '𝖛', '🆅'],
    'w': ['Ꮃ', 'щ', 'Ŵ', 'Ꮗ', 'Ꮗ', 'ᗯ', '𝚠', '𝐰', '🅦'],
    'x': ['ⓧ', 'χ', '𝔁', '⌘', '❎', '🅇', 'ж', '乂', 'א'],
    'y': ['ყ', 'Ƴ', '🇾​', '¥', 'ᖻ', 'Ў', 'Ꮍ', 'ꌩ', 'Ƴ'],
    'z': ['Հ', 'Z', 'ɀ', '乙', 'ፚ', '🆉', 'z҉', '🅉', '💤', 'ᘔ'],
  };

  List<String> generateCraxyNames(String str) {
    List<String> results = new List();
    var rng = Random(); // Random number generator for generating indexes
    for (int trials = 0; trials < 10; ++trials) {
      String text = "";
      for (int idx = 0; idx < str.length; ++idx) {
        if (isCharacter(str[idx])) {
          String _char = str[idx].toLowerCase();
          int _randNo = rng.nextInt(symbols[_char].length);
          text += symbols[_char][_randNo];
        } else {
          text += str[idx];
        }
      }
      print(text);
      results.add(text);
    }
    return results;
  }

  bool isCharacter(String char) {
    if (char.toLowerCase().compareTo('a') >= 0 &&
        char.toLowerCase().compareTo('z') <= 0) {
      return true;
    }
    return false;
  }
}
