import 'package:calculator/core/services/shared_service/shared_service.dart';
import 'package:calculator/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final SharedService sharedService;

  const HomeRepositoryImpl(this.sharedService);

  @override
  Future<void> setDataToShared(
    List<String>? data,
  ) async {
    await sharedService.setData(data);
  }

  @override
  Future<List<String>> getDataFromShared() async {
    return await sharedService.getData();
  }
}
