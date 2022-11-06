import 'qr_code_dart.dart';

class Qr {
  int payloadFormatIndicator = int.parse(buildMandatory(newMap, "00")); //M
  int pointOfInitiationMethod = int.parse(buildOptional(newMap, "01")); //O
  int merchantAccountIdentifier = int.parse(MerchantAccountInformation().merchantAccountIdentifier); //M
  int merchantCategoryCode = int.parse(buildMandatory(newMap, "52")); //M
  int transactionCurrency = int.parse(buildMandatory(newMap, "53")); //M
  int tipConvenienceIndicator = int.parse(buildOptional(newMap, "55")); //O
  String merchantSwitchGUID = MerchantAccountInformation().merchantSwitchGUID; //M
  String merchantAcquirerIdentifier = MerchantAccountInformation().merchantAcquirerIdentifier; //M
  String transactionAmount = buildMandatory(newMap, "54"); //M
  String valueConvenienceFixed = buildOptional(newMap, "56"); //O
  String valuePercentageConvenience = buildOptional(newMap, "57"); //O
  String countryCode = buildMandatory(newMap, "58"); //M
  String merchantName = buildMandatory(newMap, "59"); //M
  String merchantCity = buildMandatory(newMap, "60"); //M                                                    //O
  String postalCode = buildOptional(newMap, "61"); //O                                                   //O
  String billNumber = AdditionalDataFieldTemplate().billNumber;                                          //O
  String mobileNumber = AdditionalDataFieldTemplate().mobileNumber;                                      //O
  String storeLabel = AdditionalDataFieldTemplate().storeLabel;                                          //O
  String loyaltyNumber = AdditionalDataFieldTemplate().loyaltyNumber;                                    //O
  String referenceLabel = AdditionalDataFieldTemplate().referenceLabel;                                  //O
  String customerLabel = AdditionalDataFieldTemplate().customerLabel;                                    //O
  String terminalLabel = AdditionalDataFieldTemplate().terminalLabel;                                    //O
  String purposeOfTransaction = AdditionalDataFieldTemplate().purposeOfTransaction;                      //O
  String additionalConsumerRequest = AdditionalDataFieldTemplate().additionalConsumerRequest;            //O
  String merchantTaxInformation = AdditionalDataFieldTemplate().merchantTaxInformation;                  //O
  String merchantChannel = AdditionalDataFieldTemplate().merchantChannel;                                //O
  String crc = buildMandatory(newMap, "63"); //M
  String merchantInformationLanguageTemplate = buildOptional(newMap, "64"); //O
  String rfu = buildOptional(newMap, keyRFU.toString()); //O
  
  @override
  toString(){
    return "Payload Format Indicator : $payloadFormatIndicator\n"
        "${pointOfInitiationMethod == null?"":"Point Of InitiationMethod : $pointOfInitiationMethod\n"}"
        "${"Merchant Switch GUID : $merchantSwitchGUID\n"}"
        "${"Merchant Acquirer Identifier : $merchantAcquirerIdentifier\n"}"
        "${"Merchant Account Identifier: $merchantAccountIdentifier\n"}"
        "${"Merchant Category Code : $merchantCategoryCode\n"}"
        "${"Transaction Currency : $transactionCurrency\n"}"
        "${"Transaction Amount : $transactionAmount\n"}"
        "${tipConvenienceIndicator == null?"":"Tip Convenience Indicator : $tipConvenienceIndicator\n"}"
        "${valueConvenienceFixed.isEmpty?"":"Value Convenience Fixed : $valueConvenienceFixed\n"}"
        "${valuePercentageConvenience.isEmpty?"":"Value Percentage Convenience : $valuePercentageConvenience\n"}"
        "${countryCode.isEmpty?"":"Country Code : $countryCode\n"}"
        "${merchantName.isEmpty?"":"Merchant Name : $merchantName\n"}"
        "${merchantCity.isEmpty?"":"Merchant City : $merchantCity\n"}"
        "${postalCode.isEmpty?"":"Postal Code : $postalCode\n"}"
        "${billNumber.isEmpty?"":"Bill Number : $billNumber\n"}"
        "${mobileNumber.isEmpty?"":"Mobile Number : $mobileNumber\n"}"
        "${storeLabel.isEmpty?"":"Store Label : $storeLabel\n"}"
        "${loyaltyNumber.isEmpty?"":"Loyalty Number : $loyaltyNumber\n"}"
        "${referenceLabel.isEmpty?"":"Reference Label : $referenceLabel\n"}"
        "${customerLabel.isEmpty?"":"Customer Label : $customerLabel\n"}"
        "${terminalLabel.isEmpty?"":"Terminal Label : $terminalLabel\n"}"
        "${purposeOfTransaction.isEmpty?"":"Purpose Of Transaction : $purposeOfTransaction\n"}"
        "${additionalConsumerRequest.isEmpty?"":"Additional Consumer Request : $additionalConsumerRequest\n"}"
        "${merchantTaxInformation.isEmpty?"":"Merchant Tax Information : $merchantTaxInformation\n"}"
        "${merchantChannel.isEmpty?"":"Merchant Channel : $merchantChannel\n"}"
        "${crc.isEmpty?"":"CRC : $crc\n"}"
        "${merchantInformationLanguageTemplate.isEmpty?"":"Merchant Information Language Template : $merchantInformationLanguageTemplate\n"}"
        "${rfu.isEmpty?"":"RFU : $rfu\n"}";
  }
}

String keyNumberToNumber(Map<String, dynamic> map, int num1, int num2) {
  for (int i = num1;i<=num2;i++){
    String id = i.toString();
    if(i <10){
      id = "0$i";
    }
    if(map.containsKey(id)){
      return id;
    }
  }
  return"hhi";
}

var key = keyNumberToNumber(newMap, 2, 51);
var keyRFU = keyNumberToNumber(newMap, 65, 79);


class MerchantAccountInformation {
  String merchantSwitchGUID = buildMandatory(newMap[key], "00");
  String merchantAcquirerIdentifier = buildMandatory(newMap["28"], "01");
  String merchantAccountIdentifier = buildMandatory(newMap["28"], "02");
}

class AdditionalDataFieldTemplate {
  String billNumber = buildOptional(newMap["62"], "01");
  String mobileNumber = buildOptional(newMap["62"], "02");
  String storeLabel = buildOptional(newMap["62"], "03");
  String loyaltyNumber = buildOptional(newMap["62"], "04");
  String referenceLabel = buildOptional(newMap["62"], "05");
  String customerLabel = buildOptional(newMap["62"], "06");
  String terminalLabel = buildOptional(newMap["62"], "07");
  String purposeOfTransaction = buildOptional(newMap["62"], "08");
  String additionalConsumerRequest = buildOptional(newMap["62"], "09");
  String merchantTaxInformation = buildOptional(newMap["62"], "10");
  String merchantChannel = buildOptional(newMap["62"], "11");
}

class DateAndTime {
  String qrDateGUID = buildOptional(newMap["80"], "00");
  String dateAndTime = buildOptional(newMap["80"], "01");
}

class Verification {
  String verificationCodeGuid = buildOptional(newMap["81"], "00");
  String pinOtp = buildOptional(newMap["81"], "01");
}

dynamic buildOptional(Map<dynamic,dynamic> map, String id){
  if(map.containsKey(id)){
    return buildMandatory(map, id);
  } else {
    return "";
  }
}

dynamic buildMandatory(Map<dynamic,dynamic> newMap, String number){
  var value = newMap[number];
  return value;
}