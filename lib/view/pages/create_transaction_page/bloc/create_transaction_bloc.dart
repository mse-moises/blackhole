import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'create_transaction_event.dart';
part 'create_transaction_state.dart';

class CreateTransactionBloc extends Bloc<CreateTransactionEvent, CreateTransactionState> {
  CreateTransactionBloc() : super(CreateTransactionInitial()) {
    on<CreateTransactionEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
