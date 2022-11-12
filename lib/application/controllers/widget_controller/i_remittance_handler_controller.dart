
import 'package:cross_fund/application/constants/dialog_handler_state.dart';
import 'package:get/get.dart';

abstract class IRemittanceHandlerController extends GetxController {

  String errorMessage = "Oops. Something went wrong";

  String contendDescription = "Content description";

  String contentTitle = "Content Title";

  String successTitle = "Success";

  String successMessage = "Success";

  String errorTitle = "Error";

  String loadingMessage = "Loading";

  RxBool hasChanged = false.obs;


  Rx<DialogHandlerState> dialogHandlerState = DialogHandlerState.Initial.obs;

  Future<void> confirm(
      {required String currency,
        required String origin,
        required String target,
        required String amount});
}
