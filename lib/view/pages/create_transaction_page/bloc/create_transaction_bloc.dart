import 'package:blackhole/mock/mock_list.dart';
import 'package:blackhole/models/tag_model.dart';
import 'package:blackhole/models/transaction_model.dart';
import 'package:blackhole/tools/validate.dart';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'create_transaction_event.dart';
part 'create_transaction_state.dart';

class CreateTransactionBloc
    extends Bloc<CreateTransactionEvent, CreateTransactionState> {

  final List<TagModel> selectedTags = [];
  double value = 0.0;
  late String observation;


  CreateTransactionBloc() : super(CreateTransactionInitialWithoutTags()) {
    on<CreateTransactionEvent>((event, emit) async {
      if (event is CreateTransactionRequestLoadTags) {
        emit(await getAllTags());
      }

      if (event is CreateTransactionRequestAddTag) {
        emit(addTag(event.tagModelToAdd));
      }

      if (event is CreateTransactionRequestRemoveTag) {
        emit(removeTag(event.tagModelToRemove));
      }

      if (event is CreateTransactionRequestChangeState) {
        emit(CreateTransactionInitialWithoutTags());
      }

      if (event is CreateTransactionRequestUpdateValue) {
        emit(updateValue(event.value));
      }

      if (event is CreateTransactionRequestUpdateObservation) {
        emit(updateObservation(event.observation));
      }

      if (event is CreateTransactionRequestSaveTransaction) {
        emit(saveTransaction());
      }
    });

    add(CreateTransactionRequestLoadTags());
  }

  bool get isTransacionValid {
    return value > 0.0;
  }

  Future<CreateTransactionState> getAllTags() async {
    //mock
    await Future.delayed(Duration(seconds: 1));
    return CreateTransactionWithTags(
      isTransacionValid: isTransacionValid,
      selectedTags: selectedTags,
      allTags: MockList.tagList,
    );
  }

  CreateTransactionState removeTag(TagModel tagModel) {
    selectedTags.remove(tagModel);

    return CreateTransactionWithTags(
      isTransacionValid: isTransacionValid,
      selectedTags: selectedTags,
      allTags: MockList.tagList,
    );
  }

  CreateTransactionState addTag(TagModel tagModel) {
    if (!selectedTags.contains(tagModel)) {
      selectedTags.add(tagModel);
    }

    return CreateTransactionWithTags(
      isTransacionValid: isTransacionValid,
      selectedTags: selectedTags,
      allTags: MockList.tagList,
    );
  }

  CreateTransactionState updateValue(double _value) {
    value = _value;

    return CreateTransactionWithTags(
      isTransacionValid: isTransacionValid,
      selectedTags: selectedTags,
      allTags: MockList.tagList,
    );
  }

  CreateTransactionState updateObservation(String _observation) {
    observation = _observation;
    return CreateTransactionWithTags(
      isTransacionValid: isTransacionValid,
      selectedTags: selectedTags,
      allTags: MockList.tagList,
    );
  }

  CreateTransactionState saveTransaction() {
    final transaction = TransactionModel(
      observation: observation,
      primaryTag: selectedTags.first,
      tags: selectedTags,
      value: value,
    );

    print(transaction);
    
    return CreateTransactionSuccess();
  }
}
