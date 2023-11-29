// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CalculationImpl _$$CalculationImplFromJson(Map<String, dynamic> json) =>
    _$CalculationImpl(
      amount: json['amount'] as String,
      percent: json['percent'] as String,
      term: json['term'] as String,
      paymentType: json['paymentType'] as String,
      monthlyPayment: json['monthlyPayment'] as String,
      totalAmount: json['totalAmount'] as String,
      overpayment: json['overpayment'] as String,
    );

Map<String, dynamic> _$$CalculationImplToJson(_$CalculationImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'percent': instance.percent,
      'term': instance.term,
      'paymentType': instance.paymentType,
      'monthlyPayment': instance.monthlyPayment,
      'totalAmount': instance.totalAmount,
      'overpayment': instance.overpayment,
    };
