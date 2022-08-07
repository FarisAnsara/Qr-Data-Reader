String qrCode = "00020101021228280004CliQ0108TESTJOA002040001520412345303400540511.355502015802JO5913Merchant 00016005Amman6105111186263010400010306store10406loyal10510QRTest01540609customer10804JOQR80310004JOQR01192021-04-05T10:44:596304B56C";
Map<String, dynamic> newMap = {};

void qrReader(String qrCode, String id2, Map map) {
  try {
    while (qrCode.isNotEmpty) {
      String id = qrCode.substring(0, 2);
      String length = qrCode.substring(2, 4);
      String value = qrCode.substring(4, 4 + int.parse(length));
      if (id2.isNotEmpty) {
        if (newMap[id2] is! Map) {
          newMap[id2] = {};
        }
        newMap[id2][id] = value;
        qrCode = qrCode.substring(4 + value.length, qrCode.length);
        continue;
      }

      if (map[id] is Map) {
        qrReader(value, id, map);
      } else {
        newMap[id] = value;
      }
      qrCode = qrCode.substring(4 + value.length, qrCode.length);
    }
  } catch (e) {
    throw FormatException(
        '\n------------------------------\nERROR: Invalid QR-Code data\n------------------------------');
  }
}