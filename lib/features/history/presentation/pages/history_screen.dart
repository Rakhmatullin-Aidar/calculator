
import 'package:calculator/core/data/models/calculation/calculation_model.dart';
import 'package:calculator/core/data/models/calculation/payment_type_enums.dart';
import 'package:calculator/core/di/injection_container.dart';
import 'package:calculator/features/history/presentation/bloc/history_cubit.dart';
import 'package:calculator/features/widgets/graphic.dart';
import 'package:calculator/features/widgets/hat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<HistoryCubit>(
        create: (context) => di()..fetchDataFromShared(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Column(
            children: [
              const Hat(),
              BlocBuilder<HistoryCubit, HistoryState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => const SizedBox.shrink(),
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    success: (list) => _Body(
                      list: list,
                    ),
                    failed: () => const Center(
                      child: Text('Ошибка получения данных'),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key, required this.list}) : super(key: key);

  final List<Calculation> list;

  @override
  Widget build(BuildContext context) {
    return list.isNotEmpty
        ? Expanded(
            child: ListView.builder(
              // shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return _Item(
                  calculation: list[index],
                );
              },
            ),
          )
        : const Center(
            child: Text(
              'История расчётов пуста',
            ),
          );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    Key? key,
    required this.calculation,
  }) : super(key: key);

  final Calculation calculation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BarChartGraphic(
                calculation: calculation,
              ),
            ),
          );
        },
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey.shade300,
          ),
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Text('Сумма кредита:'),
                  ),
                  Text('${calculation.amount}'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Text('Процент:'),
                  ),
                  Text('${calculation.percent}'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Text('Срок:'),
                  ),
                  Text('${calculation.term}'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Text('Тип кредита:'),
                  ),
                  Text(
                    calculation.paymentType == PaymentType.annuity
                        ? 'Аннуитетный'
                        : 'Дифференцированный',
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Text('Ежемесячный платеж:'),
                  ),
                  Text('${calculation.monthlyPayment}'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Text('Общая сумма:'),
                  ),
                  Text('${calculation.totalAmount}'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Text('Переплата:'),
                  ),
                  Text('${calculation.overpayment}'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
