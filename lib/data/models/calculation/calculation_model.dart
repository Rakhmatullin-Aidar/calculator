import 'package:calculator/ui/home_screen/bloc/home_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'calculation_model.freezed.dart';
part 'calculation_model.g.dart';

@freezed
class Calculation with _$Calculation {

  const factory Calculation({
    required double amount,
    required double percent,
    required int term,
    required PaymentType paymentType,
    required double monthlyPayment,
    required double totalAmount,
    required double overpayment,
}) = _Calculation;

  factory Calculation.fromJson(Map<String, dynamic> json) =>
      _$CalculationFromJson(json);
}