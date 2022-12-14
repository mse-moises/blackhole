import 'package:blackhole/datasource/local_datasource.dart';
import 'package:blackhole/datasource/mock_datasource.dart';
import 'package:blackhole/repository/transaction_repository_implementation.dart';
import 'package:blackhole/repository/transaction_repository_interface.dart';
import 'package:blackhole/view/pages/create_transaction_page/bloc/create_transaction_bloc.dart';
import 'package:blackhole/view/pages/home_page/bloc/home_page_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  initBloc();
  initRepository();
  initDataSource();
}

void initBloc() {
  //! Bloc
  getIt.registerFactory<HomePageBloc>(
    () => HomePageBloc(
      repository: getIt(),
    ),
  );

  getIt.registerFactory<CreateTransactionBloc>(
    () => CreateTransactionBloc(
      repository: getIt(),
    ),
  );
}

void initRepository() {
  getIt.registerLazySingleton<TransactionRepositoryInterface>(
    () => TransactionRepositoryImplementation(
      dataSource: getIt(),
    ),
  );
}

void initDataSource() {
  getIt.registerLazySingleton<LocalDataSource>(
    () => MockDataSource(),
  );
}
