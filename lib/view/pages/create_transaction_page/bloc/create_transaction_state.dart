part of 'create_transaction_bloc.dart';

@immutable
abstract class CreateTransactionState {
  String? typeValidation;
  String? tagValidation;
}

class CreateTransactionInitialWithoutTags extends CreateTransactionState {}

class CreateTransactionWithTags extends CreateTransactionState {
  final List<TagModel> selectedTags;
  final List<TagModel> allTags;

  final String? typeValidation;
  final String? tagValidation;

  CreateTransactionWithTags({
    required this.allTags,
    required this.selectedTags,
    this.typeValidation,
    this.tagValidation,
  });
}

class CreateTransactionSuccess extends CreateTransactionState {}
