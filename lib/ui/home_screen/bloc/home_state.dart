import 'package:equatable/equatable.dart';

enum PaymentType { annuity, differentiated}

class HomeState extends Equatable {
  final String amount;
  final String percent;
  final String term;
  final PaymentType paymentType;

  final String monthlyPayment;
  final String totalAmount;
  final String overpayment;

  const HomeState({
    this.amount = '',
    this.percent = '',
    this.term = '',
    this.paymentType = PaymentType.annuity,
    this.monthlyPayment = '',
    this.totalAmount = '',
    this.overpayment = '',
  });

  HomeState copyWith({
    String? amount,
    String? percent,
    String? term,
    PaymentType? paymentType,
    String? monthlyPayment,
    String? totalAmount,
    String? overpayment,
  }) {
    return HomeState(
      amount: amount ?? this.amount,
      percent: percent ?? this.percent,
      term: term ?? this.term,
      paymentType: paymentType ?? this.paymentType,
      monthlyPayment: monthlyPayment ?? this.monthlyPayment,
      totalAmount: totalAmount ?? this.totalAmount,
      overpayment: overpayment ?? this.overpayment,
    );
  }

  @override
  List<Object?> get props => [
        amount,
        percent,
        term,
        paymentType,
        monthlyPayment,
        totalAmount,
        overpayment,
      ];
}
