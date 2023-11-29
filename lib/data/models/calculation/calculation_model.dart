import 'package:freezed_annotation/freezed_annotation.dart';

part 'calculation_model.freezed.dart';
part 'calculation_model.g.dart';

@freezed
class Calculation with _$Calculation {

  const factory Calculation({
    required String amount,
    required String percent,
    required String term,
    required String paymentType,
    required String monthlyPayment,
    required String totalAmount,
    required String overpayment,
}) = _Calculation;

  factory Calculation.fromJson(Map<String, dynamic> json) =>
      _$CalculationFromJson(json);
}