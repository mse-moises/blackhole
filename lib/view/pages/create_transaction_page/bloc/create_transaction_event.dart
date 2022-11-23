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