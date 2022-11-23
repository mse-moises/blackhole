import 'package:blackhole/mock/mock_list.dart';
import 'package:blackhole/models/tag_model.dart';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'create_transaction_event.dart';
part 'create_transaction_state.dart';

class CreateTransactionBloc
    extends Bloc<CreateTransactionEvent, CreateTransactionState> {
  final List<TagModel> selectedTags = [];

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

      if(event is CreateTransactionRequestChangeState){
        emit(CreateTransactionInitialWithoutTags());
      }
    });

    add(CreateTransactionRequestLoadTags());
  }

  Future<CreateTransactionState> getAllTags() async {
    //mock
    await Future.delayed(Duration(seconds: 1));
    return CreateTransactionWithTags(
      selectedTags: selectedTags,
      allTags: MockList.tagList,
    );
  }

  CreateTransactionState removeTag(TagModel tagModel) {
    selectedTags.remove(tagModel);

    return CreateTransactionWithTags(
      selectedTags: selectedTags,
      allTags: MockList.tagList,
    );
  }

  CreateTransactionState addTag(TagModel tagModel) {
    selectedTags.add(tagModel);

    return CreateTransactionWithTags(
      selectedTags: selectedTags,
      allTags: MockList.tagList,
    );
  }
}
