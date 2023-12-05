// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calculation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Calculation _$CalculationFromJson(Map<String, dynamic> json) {
  return _Calculation.fromJson(json);
}

/// @nodoc
mixin _$Calculation {
  double get amount => throw _privateConstructorUsedError;
  double get percent => throw _privateConstructorUsedError;
  int get term => throw _privateConstructorUsedError;
  PaymentType get paymentType => throw _privateConstructorUsedError;
  double get monthlyPayment => throw _privateConstructorUsedError;
  double get totalAmount => throw _privateConstructorUsedError;
  double get overpayment => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CalculationCopyWith<Calculation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalculationCopyWith<$Res> {
  factory $CalculationCopyWith(
          Calculation value, $Res Function(Calculation) then) =
      _$CalculationCopyWithImpl<$Res, Calculation>;
  @useResult
  $Res call(
      {double amount,
      double percent,
      int term,
      PaymentType paymentType,
      double monthlyPayment,
      double totalAmount,
      double overpayment});
}

/// @nodoc
class _$CalculationCopyWithImpl<$Res, $Val extends Calculation>
    implements $CalculationCopyWith<$Res> {
  _$CalculationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? percent = null,
    Object? term = null,
    Object? paymentType = null,
    Object? monthlyPayment = null,
    Object? totalAmount = null,
    Object? overpayment = null,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      percent: null == percent
          ? _value.percent
          : percent // ignore: cast_nullable_to_non_nullable
              as double,
      term: null == term
          ? _value.term
          : term // ignore: cast_nullable_to_non_nullable
              as int,
      paymentType: null == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as PaymentType,
      monthlyPayment: null == monthlyPayment
          ? _value.monthlyPayment
          : monthlyPayment // ignore: cast_nullable_to_non_nullable
              as double,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      overpayment: null == overpayment
          ? _value.overpayment
          : overpayment // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CalculationImplCopyWith<$Res>
    implements $CalculationCopyWith<$Res> {
  factory _$$CalculationImplCopyWith(
          _$CalculationImpl value, $Res Function(_$CalculationImpl) then) =
      __$$CalculationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double amount,
      double percent,
      int term,
      PaymentType paymentType,
      double monthlyPayment,
      double totalAmount,
      double overpayment});
}

/// @nodoc
class __$$CalculationImplCopyWithImpl<$Res>
    extends _$CalculationCopyWithImpl<$Res, _$CalculationImpl>
    implements _$$CalculationImplCopyWith<$Res> {
  __$$CalculationImplCopyWithImpl(
      _$CalculationImpl _value, $Res Function(_$CalculationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? percent = null,
    Object? term = null,
    Object? paymentType = null,
    Object? monthlyPayment = null,
    Object? totalAmount = null,
    Object? overpayment = null,
  }) {
    return _then(_$CalculationImpl(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      percent: null == percent
          ? _value.percent
          : percent // ignore: cast_nullable_to_non_nullable
              as double,
      term: null == term
          ? _value.term
          : term // ignore: cast_nullable_to_non_nullable
              as int,
      paymentType: null == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as PaymentType,
      monthlyPayment: null == monthlyPayment
          ? _value.monthlyPayment
          : monthlyPayment // ignore: cast_nullable_to_non_nullable
              as double,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      overpayment: null == overpayment
          ? _value.overpayment
          : overpayment // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CalculationImpl implements _Calculation {
  const _$CalculationImpl(
      {required this.amount,
      required this.percent,
      required this.term,
      required this.paymentType,
      required this.monthlyPayment,
      required this.totalAmount,
      required this.overpayment});

  factory _$CalculationImpl.fromJson(Map<String, dynamic> json) =>
      _$$CalculationImplFromJson(json);

  @override
  final double amount;
  @override
  final double percent;
  @override
  final int term;
  @override
  final PaymentType paymentType;
  @override
  final double monthlyPayment;
  @override
  final double totalAmount;
  @override
  final double overpayment;

  @override
  String toString() {
    return 'Calculation(amount: $amount, percent: $percent, term: $term, paymentType: $paymentType, monthlyPayment: $monthlyPayment, totalAmount: $totalAmount, overpayment: $overpayment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalculationImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.percent, percent) || other.percent == percent) &&
            (identical(other.term, term) || other.term == term) &&
            (identical(other.paymentType, paymentType) ||
                other.paymentType == paymentType) &&
            (identical(other.monthlyPayment, monthlyPayment) ||
                other.monthlyPayment == monthlyPayment) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.overpayment, overpayment) ||
                other.overpayment == overpayment));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, amount, percent, term,
      paymentType, monthlyPayment, totalAmount, overpayment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CalculationImplCopyWith<_$CalculationImpl> get copyWith =>
      __$$CalculationImplCopyWithImpl<_$CalculationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CalculationImplToJson(
      this,
    );
  }
}

abstract class _Calculation implements Calculation {
  const factory _Calculation(
      {required final double amount,
      required final double percent,
      required final int term,
      required final PaymentType paymentType,
      required final double monthlyPayment,
      required final double totalAmount,
      required final double overpayment}) = _$CalculationImpl;

  factory _Calculation.fromJson(Map<String, dynamic> json) =
      _$CalculationImpl.fromJson;

  @override
  double get amount;
  @override
  double get percent;
  @override
  int get term;
  @override
  PaymentType get paymentType;
  @override
  double get monthlyPayment;
  @override
  double get totalAmount;
  @override
  double get overpayment;
  @override
  @JsonKey(ignore: true)
  _$$CalculationImplCopyWith<_$CalculationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
