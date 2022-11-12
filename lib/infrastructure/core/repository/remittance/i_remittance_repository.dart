abstract class IRemittanceRepository {
  Future<void> remit({required String amount});
}
