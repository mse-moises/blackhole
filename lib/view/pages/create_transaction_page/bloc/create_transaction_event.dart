part of 'create_transaction_bloc.dart';

@immutable
abstract class CreateTransactionEvent {}

class CreateTransactionRequestLoadTags implements CreateTransactionEvent {}

class CreateTransactionRequestAddTag implements CreateTransactionEvent {
  final TagModel tagModelToAdd;

  CreateTransactionRequestAddTag(this.tagModelToAdd);
}

class CreateTransactionRequestRemoveTag implements CreateTransactionEvent {
  final TagModel tagModelToRemove;

  CreateTransactionRequestRemoveTag(this.tagModelToRemove);
}

class CreateTransactionRequestChangeState implements CreateTransactionEvent {}

class CreateTransactionRequestUpdateValue implements CreateTransactionEvent {
  final double value;

  CreateTransactionRequestUpdateValue({required this.value});
}

class CreateTransactionRequestUpdateObservation
    implements CreateTransactionEvent {
  final String observation;

  CreateTransactionRequestUpdateObservation({required this.observation});
}

class CreateTransactionRequestUpdateTransactionType implements CreateTransactionEvent{
  final TransactionTypes transactionType;

  CreateTransactionRequestUpdateTransactionType({required this.transactionType});
}

class CreateTransactionRequestSaveTransaction
    implements CreateTransactionEvent {}
