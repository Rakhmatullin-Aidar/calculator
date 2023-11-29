import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:calculator/data/models/calculation/calculation_model.dart';
import 'package:calculator/data/shared_service/shared_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_state.dart';

part 'history_cubit.freezed.dart';

class HistoryCubit extends Cubit<HistoryState> {
  final SharedService sharedService;

  HistoryCubit({
    required this.sharedService,
  }) : super(const HistoryState.initial());

  void fetchDataFromShared() async{
    emit(const HistoryState.loading());
    try{
      List<Calculation> list = [];
      final sharedData = await sharedService.getData();

      if(sharedData != null){
        list = List<Calculation>.from(sharedData.map((e) => Calculation.fromJson(jsonDecode(e)))).toList();
      }

      emit(HistoryState.success(list));
    }catch(e){
      emit(const HistoryState.failed());
    }
  }
}
