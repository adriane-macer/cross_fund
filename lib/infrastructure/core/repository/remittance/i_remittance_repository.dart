abstract class IRemittanceRepository {
  Future<void> remit({required String currency,
    required String origin,
    required String target,
    required String amount});
}
