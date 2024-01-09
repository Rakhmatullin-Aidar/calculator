import 'package:calculator/core/domain/usecase.dart';
import 'package:calculator/features/home/domain/repository/home_repository.dart';

class GetDataFromSharedUseCase implements UseCase{

  final HomeRepository homeRepository;

  const GetDataFromSharedUseCase(this.homeRepository);

  @override
  Future call({params}) {
    return homeRepository.getDataFromShared();
  }

}