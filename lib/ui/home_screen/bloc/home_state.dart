import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final String amount;
  final String percent;
  final String term;
  final String paymentType;

  final String monthlyPayment;
  final String totalAmount;
  final String overpayment;

  const HomeState({
    this.amount = '',
    this.percent = '',
    this.term = '',
    this.paymentType = 'Аннуитетный',
    this.monthlyPayment = '',
    this.totalAmount = '',
    this.overpayment = '',
  });

  HomeState copyWith({
    String? amount,
    String? percent,
    String? term,
    String? paymentType,
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
