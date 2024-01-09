// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CalculationImpl _$$CalculationImplFromJson(Map<String, dynamic> json) =>
    _$CalculationImpl(
      amount: (json['amount'] as num).toDouble(),
      percent: (json['percent'] as num).toDouble(),
      term: json['term'] as int,
      paymentType: $enumDecode(_$PaymentTypeEnumMap, json['paymentType']),
      monthlyPayment: (json['monthlyPayment'] as num).toDouble(),
      totalAmount: (json['totalAmount'] as num).toDouble(),
      overpayment: (json['overpayment'] as num).toDouble(),
    );

Map<String, dynamic> _$$CalculationImplToJson(_$CalculationImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'percent': instance.percent,
      'term': instance.term,
      'paymentType': _$PaymentTypeEnumMap[instance.paymentType]!,
      'monthlyPayment': instance.monthlyPayment,
      'totalAmount': instance.totalAmount,
      'overpayment': instance.overpayment,
    };

const _$PaymentTypeEnumMap = {
  PaymentType.annuity: 'annuity',
  PaymentType.differentiated: 'differentiated',
};
