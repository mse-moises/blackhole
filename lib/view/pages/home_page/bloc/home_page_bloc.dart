import 'package:blackhole/mock/mock_list.dart';
import 'package:blackhole/models/transaction_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageLoading()) {
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
    await Future.delayed(Duration(seconds: 1));
    return HomePageLoaded(transactionList: MockList.transactionList);
  }
}
