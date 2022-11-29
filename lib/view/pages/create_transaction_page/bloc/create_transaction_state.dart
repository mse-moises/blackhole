part of 'create_transaction_bloc.dart';

@immutable
abstract class CreateTransactionState {}

class CreateTransactionInitialWithoutTags extends CreateTransactionState {}

class CreateTransactionWithTags extends CreateTransactionState {
  bool isTransacionValid;
  final List<TagModel> selectedTags;
  final List<TagModel> allTags;

  CreateTransactionWithTags({
    required this.allTags,
    required this.selectedTags,
    required this.isTransacionValid,
  });
}

class CreateTransactionSuccess extends CreateTransactionState {}
