import 'dart:convert';
import 'dart:math';
import 'package:calculator/core/data/models/calculation/calculation_model.dart';
import 'package:calculator/core/data/models/calculation/payment_type_enums.dart';
import 'package:calculator/features/home/domain/usecase/get_data_from_shared_usecase.dart';
import 'package:calculator/features/home/domain/usecase/set_data_to_shared_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final SetDataToSharedUseCase setDataToSharedUseCase;
  final GetDataFromSharedUseCase getDataFromSharedUseCase;

  HomeCubit({
    required this.setDataToSharedUseCase,
    required this.getDataFromSharedUseCase,
  }) : super(const HomeState());

  void amountField(String value) {
    emit(state.copyWith(amount: value.replaceAll(',', '.').trim()));
  }

  void percentField(String value) {
    emit(state.copyWith(percent: value.replaceAll(',', '.').trim()));
  }

  void termField(String value) {
    emit(state.copyWith(term: value.trim()));
  }

  void paymentType(PaymentType value) {
    emit(state.copyWith(paymentType: value));
  }

  void calculate() {
    final monthlyPayment = _monthlyPaymentCalculation(
      amount: double.parse(state.amount),
      percent: double.parse(state.percent) / 100,
      term: int.parse(state.term),
    );

    final totalAmount = _totalAmountCalculation(
      monthlyPayment: monthlyPayment,
      term: int.parse(state.term),
    );

    final overpayment = _overPaymentCalculation(
      totalAmount: totalAmount,
      amount: double.parse(state.amount),
    );

    emit(
      state.copyWith(
        monthlyPayment: monthlyPayment.toStringAsFixed(2),
        totalAmount: totalAmount.toStringAsFixed(2),
        overpayment: overpayment.toStringAsFixed(2),
      ),
    );

    Calculation calculation = Calculation(
      amount: double.parse(state.amount),
      percent: double.parse(state.percent),
      term: int.parse(state.term),
      paymentType: state.paymentType,
      monthlyPayment: double.parse(state.monthlyPayment),
      totalAmount: double.parse(state.totalAmount),
      overpayment: double.parse(state.overpayment),
    );

    updateShared(calculation);
  }

  double _monthlyPaymentCalculation({
    required double amount,
    required double percent,
    required int term,
  }) {
    if (state.paymentType == PaymentType.annuity) {
      final result = amount *
          ((percent * pow(1 + percent, term)) / (pow((1 + percent), term) - 1));
      return result;
    } else {
      return amount / term + (amount / term * percent);
    }
  }

  double _totalAmountCalculation({
    required double monthlyPayment,
    required int term,
  }) {
    return monthlyPayment * term;
  }

  double _overPaymentCalculation({
    required double totalAmount,
    required double amount,
  }) {
    return totalAmount - amount;
  }

  void updateShared(Calculation calculation) async {
    List<Calculation> list = [];

    final sharedData = await getDataFromSharedUseCase.call();

    if(sharedData != null){
      list = List<Calculation>.from(sharedData.map((e) => Calculation.fromJson(jsonDecode(e)))).toList();
    }

    list.insert(0, calculation);

    final newListForShared = list.map((e) => jsonEncode(e)).toList();
    setDataToSharedUseCase.call(params: newListForShared);
  }
}
