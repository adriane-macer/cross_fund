import 'package:cross_fund/application/constants/dialog_handler_state.dart';
import 'package:cross_fund/application/controllers/widget_controller/i_confirm_dialog_handler_controller.dart';
import 'package:cross_fund/application/controllers/widget_controller/i_remittance_handler_controller.dart';
import 'package:cross_fund/infrastructure/core/repository/remittance/i_remittance_repository.dart';
import 'package:get/get.dart';

class RemittanceHandlerController extends IRemittanceHandlerController {
  final IRemittanceRepository repository;

  RemittanceHandlerController(this.repository);

  @override
  Future<void> onInit() async {
    super.onInit();
    successMessage = "Successfully remit";
    errorTitle = "Remitting failed.";
    loadingMessage = "Remitting...";
  }

  @override
  Future<void> confirm(
      {required String currency,
      required String origin,
      required String target,
      required String amount}) async {
    dialogHandlerState(DialogHandlerState.Loading);
    update();
    try {
      await repository.remit(
          currency: currency, origin: origin, target: target, amount: amount);
      dialogHandlerState(DialogHandlerState.Success);
    } catch (e) {
      errorMessage = e.toString();
      dialogHandlerState(DialogHandlerState.Error);
    }
    update();
  }
}
