import 'map.dart';
import 'qr_code_dart.dart';
import 'qr.dart';

void main() {
  qrReader(qrCode, '', thirdMap);
  try {
    print(Qr().toString());
  }
  catch(e){
    throw FormatException("Error: Check all integer values in the QR-code are of the right format. \n$e");
  }
}