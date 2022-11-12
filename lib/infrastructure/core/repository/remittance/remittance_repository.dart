import 'package:cross_fund/infrastructure/core/provider/remittance/i_remittance_provider.dart';
import 'package:cross_fund/infrastructure/core/repository/remittance/i_remittance_repository.dart';
import 'package:flutter/foundation.dart';

class RemittanceRepository extends IRemittanceRepository {
  final IRemittanceProvider provider;

  RemittanceRepository(this.provider);

  @override
  Future<void> remit({required String amount}) async {
    try {
      await provider.remit(amount: amount);
    } catch (e) {
      debugPrint("RemittanceRepository.remit: $e");
      rethrow;
    }
  }
}
