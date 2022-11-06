Map map = {
  "00": "Payload Format Indicator",
  "01": "Point of Initiation Method",
  "52": "Merchant Category Code (MCC)",
  "53": "Transaction Currency",
  "54": "Transaction Amount",
  "55": "Tip or convenience indicator",
  "56": "Value of Convenience Fixed",
  "57": "Value of Percentage convenience",
  "58": "Country Code",
  "59": "Merchant Name",
  "60": "Merchant City",
  "82": {"00": "GUID", "01": "Location"},
  "80": {"00": "Qr Date GUID", "01": "Date and time"},
  "61": "Postal code",
  "62": {
    "01": "Bill Number",
    "02": "Mobile Number",
    "03": "Store Label",
    "04": "Loyalty Number",
    "05": "Reference Label",
    "06": "Customer Label",
    "07": "Terminal Label",
    "08": "Purpose of transaction",
    "09": "Additional Consumer Request",
    "10": "Merchant Tax Information",
    "11": "Merchant Channel"
  },
  "63": "CRC",
  "64": "Merchant Information Language Template",
  "81": {"00": "Verification Code GUID", "01": "PIN or OTP"},
};

List<String> twoToFiftyOne = [for (var i = 2; i <= 51; i += 1) i.toString()];
Map mapTwoToFiftyOne = {
  "00": "Merchant Switch GUID",
  "01": "Merchant Acquirer Identifier",
  "02": "Merchant Account Identifier"
};

List<String> sixtyFiveToSeventyNine = [
  for (var i = 65; i <= 79; i += 1) i.toString()
];

Map<String, dynamic> makeMyMap(Map<List<String>, dynamic> map) {
  var newMap = <String, dynamic>{};
  for (var entry in map.entries) {
    var keyList = entry.key;
    for (var key in keyList) {
      newMap[key] = entry.value;
    }
  }
  return newMap;
}

Map map2 = makeMyMap({
  twoToFiftyOne: mapTwoToFiftyOne,
});
Map map3 = makeMyMap({
  sixtyFiveToSeventyNine: "RFU for EMVCo",
});
var thirdMap = {...map, ...map2, ...map3};
