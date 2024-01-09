part of 'history_cubit.dart';

@freezed
class HistoryState with _$HistoryState {
  const factory HistoryState.initial() = _Initial;

  const factory HistoryState.loading() = _Loading;

  const factory HistoryState.success(
    List<Calculation> calculations,
  ) = _Success;

  const factory HistoryState.failed() = _Failed;
}
