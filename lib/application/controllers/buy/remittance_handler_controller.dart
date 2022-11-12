import 'package:cross_fund/application/constants/dialog_handler_state.dart';
import 'package:cross_fund/application/controllers/widget_controller/i_confirm_dialog_handler_controller.dart';
import 'package:cross_fund/infrastructure/core/repository/remittance/i_remittance_repository.dart';

class RemittanceHandlerController extends IConfirmDialogHandlerController {
  final IRemittanceRepository repository;
  final String amount;

  RemittanceHandlerController(this.amount, this.repository);

  @override
  Future<void> onInit() async {
    super.onInit();
    successMessage = "Successfully remit";
    errorTitle = "Remitting failed.";
    loadingMessage = "Remitting...";
  }

  @override
  Future<void> confirm() async {
    dialogHandlerState(DialogHandlerState.Loading);
    update();
    try {
      await repository.remit(amount: amount);
      dialogHandlerState(DialogHandlerState.Success);
    } catch (e) {
      errorMessage = e.toString();
      dialogHandlerState(DialogHandlerState.Error);
    }
    update();
  }
}
