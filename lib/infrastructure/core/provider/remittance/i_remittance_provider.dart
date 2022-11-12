abstract class IRemittanceProvider {
  Future<void> remit({required String amount});
}
