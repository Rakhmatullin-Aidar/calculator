
import 'package:calculator/core/data/models/calculation/payment_type_enums.dart';
import 'package:calculator/core/di/injection_container.dart';
import 'package:calculator/features/history/presentation/pages/history_screen.dart';
import 'package:calculator/features/home/presentation/bloc/home_cubit.dart';
import 'package:calculator/features/home/presentation/bloc/home_state.dart';
import 'package:calculator/features/widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: globalKey,
        child: BlocProvider<HomeCubit>(
          create: (context) => di(),
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Column(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                const _Hat(),
                                const SizedBox(height: 14),
                                const _AmountField(),
                                const SizedBox(height: 24),
                                const _PercentField(),
                                const SizedBox(height: 24),
                                const _TermField(),
                                const SizedBox(height: 24),
                                const _PaymentTypes(),
                                const SizedBox(height: 24),
                                state.monthlyPayment.isNotEmpty
                                    ? const _Result()
                                    : const SizedBox.shrink()
                              ],
                            ),
                          ),
                          _CalculateButton(
                            globalKey: globalKey,
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _Hat extends StatelessWidget {
  const _Hat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Align(
        alignment: Alignment.centerRight,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HistoryScreen(),
              ),
            );
          },
          child: const Text('История расчётов'),
        ),
      ),
    );
  }
}

class _AmountField extends StatelessWidget {
  const _AmountField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      labelText: 'Сумма кредита',
      onChanged: context.read<HomeCubit>().amountField,
      inputFormatters: [
        FilteringTextInputFormatter.allow(
          RegExp('[0-9 ]+[.,]?'),
        ),
      ],
      validator: (value) {
        final formattedValue = value!.replaceAll(',', '.').trim();
        if (formattedValue.isEmpty) return 'Обязательное поле';
        if (double.parse(formattedValue) == 0) {
          return 'Значение должно быть больше 0';
        }
        return null;
      },
    );
  }
}

class _PercentField extends StatelessWidget {
  const _PercentField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      labelText: 'Процентная ставка',
      suffixIcon: const Text('%'),
      onChanged: context.read<HomeCubit>().percentField,
      inputFormatters: [
        FilteringTextInputFormatter.allow(
          RegExp('[0-9 ]+[.,]?'),
        ),
      ],
      validator: (value) {
        final formattedValue = value!.replaceAll(',', '.').trim();
        if (formattedValue.isEmpty) return 'Обязательное поле';
        if (double.parse(formattedValue) == 0) {
          return 'Значение должно быть больше 0';
        }
        return null;
      },
    );
  }
}

class _TermField extends StatelessWidget {
  const _TermField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      labelText: 'Срок кредита',
      suffixIcon: const Text('мес'),
      onChanged: context.read<HomeCubit>().termField,
      inputFormatters: [
        FilteringTextInputFormatter.allow(
          RegExp('[0-9 ]+?'),
        ),
      ],
      validator: (value) {
        final formattedValue = value!.replaceAll(',', '.').trim();
        if (formattedValue.isEmpty) return 'Обязательное поле';
        if (double.parse(formattedValue) == 0) {
          return 'Значение должно быть больше 0';
        }
        return null;
      },
    );
  }
}

class _PaymentTypes extends StatelessWidget {
  const _PaymentTypes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _paymentType(
          text: 'Аннуитетный',
          paymentType: PaymentType.annuity,
        ),
        _paymentType(
          text: 'Дифференцированный',
          paymentType: PaymentType.differentiated,
        ),
      ],
    );
  }

  Widget _paymentType({
    required String text,
    required PaymentType paymentType,
  }) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            context.read<HomeCubit>().paymentType(paymentType);
          },
          child: Row(
            children: [
              Radio(
                value: state.paymentType,
                groupValue: paymentType,
                onChanged: (value) {
                  context.read<HomeCubit>().paymentType(paymentType);
                },
              ),
              Flexible(
                child: Text(text),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _CalculateButton extends StatelessWidget {
  const _CalculateButton({Key? key, required this.globalKey}) : super(key: key);

  final GlobalKey<FormState> globalKey;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (!globalKey.currentState!.validate()) return;
          context.read<HomeCubit>().calculate();
        },
        child: const Text(
          'Рассчитать',
        ),
      ),
    );
  }
}

class _Result extends StatelessWidget {
  const _Result({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Ежемесячный платёж:',
                ),
                Text(
                  state.monthlyPayment,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Общая сумма выплат:',
                ),
                Text(
                  state.totalAmount,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Переплата:',
                ),
                Text(
                  state.overpayment,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
