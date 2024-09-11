import 'dart:ui';

// class ColorConst {
//   // Light Theme
//   static Color mainColor = HexColor.fromHex("#45AEFF");
//   static Color success = HexColor.fromHex("#00AC56");
//   static Color error = HexColor.fromHex("#FF1F7D");
//   static Color warning = HexColor.fromHex("#F5BF3D");
//   static Color background = HexColor.fromHex("#F5F5F5");
//   static Color backgroundBlue = HexColor.fromHex("#ECF1F6");
//   static Color backgroundCyan = HexColor.fromHex("#19BEC8");
//     // Gray scale
//   static Color g50 = HexColor.fromHex("#FAFAFA");
//   static Color g100 = HexColor.fromHex("#F5F5F5");
//   static Color g200 = HexColor.fromHex("#E5E5E5");
//   static Color g300 = HexColor.fromHex("#D4D4D4");
//   static Color g400 = HexColor.fromHex("#A3A3A3");
//   static Color g500 = HexColor.fromHex("#737373");
//   static Color g600 = HexColor.fromHex("#525252");
//   static Color g700 = HexColor.fromHex("#404040");
//   static Color g800 = HexColor.fromHex("#262626");
//   static Color g900 = HexColor.fromHex("#191919");
// }

class ColorConst {
  // Light Theme
  static Color mainColor = HexColor.fromHex("#45AEFF");
  static Color success = HexColor.fromHex("#00AC56");
  static Color error = HexColor.fromHex("#FF1F7D");
  static Color warning = HexColor.fromHex("#F5BF3D");
  static Color background = HexColor.fromHex("#191919");
  static Color backgroundBlue = HexColor.fromHex("#ECF1F6");
  static Color backgroundLight = HexColor.fromHex("#F5F5F5");
  static Color backgroundCyan = HexColor.fromHex("#19BEC8");
  // Gray scale
  static Color g50 = HexColor.fromHex("#FAFAFA");
  static Color g100 = HexColor.fromHex("#F5F5F5");
  static Color g200 = HexColor.fromHex("#E5E5E5");
  static Color g300 = HexColor.fromHex("#D4D4D4");
  static Color g400 = HexColor.fromHex("#A3A3A3");
  static Color g500 = HexColor.fromHex("#737373");
  static Color g600 = HexColor.fromHex("#525252");
  static Color g700 = HexColor.fromHex("#404040");
  static Color g800 = HexColor.fromHex("#262626");
  static Color g900 = HexColor.fromHex("#191919");
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}