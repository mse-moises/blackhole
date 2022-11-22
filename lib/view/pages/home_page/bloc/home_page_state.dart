part of 'home_page_bloc.dart';

@immutable
abstract class HomePageState {}

class HomePageLoading extends HomePageState {}

class HomePageLoaded extends HomePageState {
  final List<TransactionModel> transactionList;

  HomePageLoaded({
    required this.transactionList,
  });
}

class HomePageError extends HomePageState {}
