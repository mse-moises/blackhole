import 'package:blackhole/view/pages/create_transaction_page/bloc/create_transaction_bloc.dart';
import 'package:blackhole/view/pages/home_page/bloc/home_page_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  initBloc();
}

void initBloc() {
  //! Bloc
  getIt.registerFactory<HomePageBloc>(
    () => HomePageBloc(),
  );

  getIt.registerFactory<CreateTransactionBloc>(
    () => CreateTransactionBloc(),
  );
}
