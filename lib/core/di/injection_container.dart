import 'package:calculator/core/services/shared_service/shared_service.dart';
import 'package:calculator/features/history/data/repository/history_repository_impl.dart';
import 'package:calculator/features/history/domain/repository/history_repository.dart';
import 'package:calculator/features/history/domain/usecase/get_calculations_usecase.dart';
import 'package:calculator/features/history/presentation/bloc/history_cubit.dart';
import 'package:calculator/features/home/data/repository/home_repository_impl.dart';
import 'package:calculator/features/home/domain/repository/home_repository.dart';
import 'package:calculator/features/home/domain/usecase/get_data_from_shared_usecase.dart';
import 'package:calculator/features/home/domain/usecase/set_data_to_shared_usecase.dart';
import 'package:calculator/features/home/presentation/bloc/home_cubit.dart';
import 'package:get_it/get_it.dart';

final di = GetIt.instance;

Future<void> initialize() async {
  di.registerSingleton<SharedService>(SharedService());

  //home screen
  di.registerSingleton<HomeRepository>(
    HomeRepositoryImpl(
      di(),
    ),
  );
  di.registerSingleton<SetDataToSharedUseCase>(
    SetDataToSharedUseCase(
      di(),
    ),
  );

  di.registerSingleton<GetDataFromSharedUseCase>(
    GetDataFromSharedUseCase(
      di(),
    ),
  );
  di.registerFactory(
    () => HomeCubit(
      setDataToSharedUseCase: di(),
      getDataFromSharedUseCase: di(),
    ),
  );

  //historyScreen
  di.registerSingleton<HistoryRepository>(
    HistoryRepositoryImpl(
      di(),
    ),
  );
  di.registerSingleton<GetCalculationsUseCase>(
    GetCalculationsUseCase(
      di(),
    ),
  );
  di.registerFactory(
    () => HistoryCubit(
      di(),
    ),
  );
}
