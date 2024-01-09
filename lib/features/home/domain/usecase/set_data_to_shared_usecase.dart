import 'package:calculator/core/domain/usecase.dart';
import 'package:calculator/features/home/domain/repository/home_repository.dart';

class SetDataToSharedUseCase implements UseCase<void, List<String>>{
  final HomeRepository homeRepository;

  const SetDataToSharedUseCase(this.homeRepository);

  @override
  Future<void> call({List<String>? params}) {
    return homeRepository.setDataToShared(params);
  }
}