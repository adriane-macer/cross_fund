import 'package:cross_fund/application/constants/dialog_handler_state.dart';
import 'package:cross_fund/application/controllers/widget_controller/i_confirm_dialog_handler_controller.dart';

class InvestHandlerController extends IConfirmDialogHandlerController {
  @override
  Future<void> onInit() async {
    super.onInit();
    successMessage = "Successfully added investment";
    errorTitle = "Investing failed.";
    loadingMessage = "Investing...";
  }

  @override
  Future<void> confirm() async {
    dialogHandlerState(DialogHandlerState.Loading);
    update();
    // TODO (AE 12/11/2022) : Implement Code
    await Future.delayed(const Duration(milliseconds: 1200));
    dialogHandlerState(DialogHandlerState.Success);
    update();
  }
}
