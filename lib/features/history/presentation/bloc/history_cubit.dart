import 'dart:convert';

import 'package:calculator/core/data/models/calculation/calculation_model.dart';
import 'package:calculator/features/history/domain/usecase/get_calculations_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_state.dart';

part 'history_cubit.freezed.dart';

class HistoryCubit extends Cubit<HistoryState> {

  final GetCalculationsUseCase getCalculationsUseCase;

  HistoryCubit(this.getCalculationsUseCase) : super(const HistoryState.initial());

  void fetchDataFromShared() async{
    emit(const HistoryState.loading());
    try{
      List<Calculation> list = [];
      final sharedData = await getCalculationsUseCase.call();

      if(sharedData != null){
        list = List<Calculation>.from(sharedData.map((e) => Calculation.fromJson(jsonDecode(e)))).toList();
      }

      emit(HistoryState.success(list));
    }catch(e){
      emit(const HistoryState.failed());
    }
  }
}
