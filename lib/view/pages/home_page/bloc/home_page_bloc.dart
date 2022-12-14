import 'package:blackhole/errors/failure.dart';
import 'package:blackhole/mock/mock_list.dart';
import 'package:blackhole/models/transaction_model.dart';
import 'package:blackhole/repository/transaction_repository_interface.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final TransactionRepositoryInterface repository;
  HomePageBloc({required this.repository}) : super(HomePageLoading()) {
    on<HomePageEvent>(
      (event, emit) async {
        if (event is HomePageRequestLoad) {
          emit(await emitLoadHomePage());
        }
      },
    );

    add(HomePageRequestLoad());
  }

  Future<HomePageState> emitLoadHomePage() async {
    emit(HomePageLoading());

    final response = await repository.requestAllTransactions();

    return response.fold(
      (failure) => HomePageError(),
      (transactionList) => HomePageLoaded(transactionList: transactionList),
    );
  }
}
