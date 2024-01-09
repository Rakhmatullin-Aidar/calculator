import 'package:calculator/core/services/shared_service/shared_service.dart';
import 'package:calculator/features/history/domain/repository/history_repository.dart';

class HistoryRepositoryImpl implements HistoryRepository{

  final SharedService sharedService;

  const HistoryRepositoryImpl(this.sharedService);

  @override
  Future<List<String>> getCalculations() async{
    return sharedService.getData();
  }

}