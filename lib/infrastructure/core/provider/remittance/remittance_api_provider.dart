import 'package:cross_fund/infrastructure/core/provider/remittance/i_remittance_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class RemittanceApiProvider extends GetConnect implements IRemittanceProvider {
  @override
  Future<void> remit({required String amount}) async {
    try {
      httpClient.baseUrl =
          "https://xd4dnan9f8.execute-api.us-east-1.amazonaws.com/dev/";

      httpClient.defaultContentType = "application/json";
      httpClient.addResponseModifier((request, response) async {
        return response;
      });
      final body = {
        "originSwapDto": {
          "quoteCurrency": "0x7b8FBF2113f23cb6c3982e6e0f8A63590ABC3d7a",
          "originToken": "0x0Ef8760Da2236f657A835d1D69AE335Ee411fa05",
          "targetToken": "0xEe13c38351d2e064C0E92daaf82baB5bCee49543",
          "originAmount": amount,
          "minTargetAmount": 0,
          "swapDeadline": 9999999999
        }
      };
      final response = await httpClient.post("remittance", body: body);
      debugPrint("response: ${response.body}");
      if (!response.isOk) {
        final message = response.body['message'] as String;
        throw Exception(message);
      }
    } catch (e) {
      debugPrint("RemittanceApiProvider.remit: $e");
      rethrow;
    }
  }
}
