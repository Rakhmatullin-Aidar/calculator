import 'package:calculator/core/domain/usecase.dart';
import 'package:calculator/features/history/domain/repository/history_repository.dart';

class GetCalculationsUseCase implements UseCase{
  final HistoryRepository historyRepository;

  const GetCalculationsUseCase(this.historyRepository);

  @override
  Future call({params}) {
    return historyRepository.getCalculations();
  }

}