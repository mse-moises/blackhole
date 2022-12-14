import 'package:blackhole/const/const_business_rules.dart';
import 'package:blackhole/mock/mock_list.dart';
import 'package:blackhole/models/tag_model.dart';
import 'package:blackhole/models/transaction_model.dart';
import 'package:blackhole/repository/transaction_repository_interface.dart';
import 'package:blackhole/tools/validate.dart';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'create_transaction_event.dart';
part 'create_transaction_state.dart';

class CreateTransactionBloc
    extends Bloc<CreateTransactionEvent, CreateTransactionState> {

  final TransactionRepositoryInterface repository;

  final List<TagModel> selectedTags = [];
  double value = 0.0;
  String? observation;

  TransactionTypes? transactionType;

  bool get isTransactionValid {
    return getTypeValidation() == null && getTagsValidation() == null;
  }

  CreateTransactionBloc({required this.repository}) : super(CreateTransactionInitialWithoutTags()) {
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

      if (event is CreateTransactionRequestUpdateTransactionType){
        emit(updateTransactionType(event.transactionType));
      }

      if (event is CreateTransactionRequestSaveTransaction) {
        emit(await saveTransaction());
      }
    });

    add(CreateTransactionRequestLoadTags());
  }

  bool get isTransacionValueValid {
    return value > 0.0;
  }

  Future<CreateTransactionState> getAllTags() async {
    //mock
    await Future.delayed(Duration(seconds: 1));
    return getStateWithTags();
  }

  CreateTransactionState removeTag(TagModel tagModel) {
    selectedTags.remove(tagModel);

    return getStateWithTags();
  }

  CreateTransactionState addTag(TagModel tagModel) {
    if (!selectedTags.contains(tagModel)) {
      selectedTags.add(tagModel);
    }

    return getStateWithTags();
  }

  CreateTransactionState updateValue(double _value) {
    value = _value;

    return getStateWithTags();
  }

  CreateTransactionState updateObservation(String _observation) {
    observation = _observation;
    return getStateWithTags();
  }

  CreateTransactionState updateTransactionType(TransactionTypes _transactionType){
    transactionType = _transactionType;
    return getStateWithTags();
  }

  Future<CreateTransactionState> saveTransaction() async {
    if (!isTransactionValid) {
      return getStateWithTags(
        typeValidation: getTypeValidation(),
        tagValidation: getTagsValidation(),
      );
    }

    final transaction = TransactionModel(
      observation: observation,
      primaryTag: selectedTags.first,
      tags: selectedTags,
      value: value,
    );

    final response = await repository.addTransaction(transaction);

    return CreateTransactionSuccess();
  }

  CreateTransactionWithTags getStateWithTags({
    String? typeValidation,
    String? tagValidation,
  }) {
    return CreateTransactionWithTags(
      selectedTags: selectedTags,
      allTags: MockList.tagList,
      typeValidation: typeValidation,
      tagValidation: tagValidation,
    );
  }

  String? getTypeValidation() {
    return Validator.validateTransactionType(transactionType);
  }

  //todo talvez retirar
  String? getTagsValidation() {
    return Validator.validateTagList(selectedTags);
  }
}
