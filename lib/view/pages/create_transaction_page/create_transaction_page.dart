import 'package:blackhole/const/const_theme.dart';
import 'package:blackhole/injection_container.dart';
import 'package:blackhole/models/tag_model.dart';
import 'package:blackhole/view/components/button_tag_component.dart';
import 'package:blackhole/view/components/tag_component.dart';
import 'package:blackhole/view/components/text_field_money.dart';
import 'package:blackhole/view/pages/create_transaction_page/bloc/create_transaction_bloc.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateTransactionPage extends StatelessWidget {
  static const String route = "/new-transaction";
  CreateTransactionPage({Key? key}) : super(key: key);

  final CreateTransactionBloc bloc = getIt.get<CreateTransactionBloc>();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("New transaction"),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Container(
                margin: const EdgeInsets.all(MEDIUM_SPACE),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _FieldTitle(
                      title: "value",
                    ),
                    _FieldWithPadding(
                      child: TextFieldMoney(),
                    ),
                    _FieldTitle(
                      title: "observation",
                    ),
                    _FieldWithPadding(
                      child: TextFormField(),
                    ),
                    _FieldTitle(
                      title: "tags",
                    ),
                    _FieldWithPadding(
                      child: _TagsField(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FieldTitle extends StatelessWidget {
  const _FieldTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: MEDIUM_SPACE),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}

class _FieldWithPadding extends StatelessWidget {
  const _FieldWithPadding({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: LARGE_SPACE,
        top: MEDIUM_SPACE,
        bottom: LARGE_SPACE,
      ),
      child: child,
    );
  }
}

class _TagsField extends StatelessWidget {
  const _TagsField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: LARGE_SPACE),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: const BorderRadius.all(
          Radius.circular(LARGE_SPACE),
        ),
      ),
      child: Center(
        child: BlocBuilder<CreateTransactionBloc, CreateTransactionState>(
          builder: (_, state) {
            if (state is CreateTransactionWithTags) {
              return Column(
                children: [
                  _TagsSelector(
                    selectedTags: state.selectedTags,
                    allTags: state.allTags,
                  ),
                ],
              );
            }
            return Container(
              height: CONST_TAG_SELECTOR_BOX_WEIGHT,
              child: const CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

class _TagsSelector extends StatelessWidget {
  _TagsSelector({
    Key? key,
    required this.selectedTags,
    required this.allTags,
  }) : super(key: key);

  final List<TagModel> selectedTags;
  final List<TagModel> allTags;

  final bloc = getIt.get<CreateTransactionBloc>();

  void removeTag(TagModel tagModel) {
    bloc.add(CreateTransactionRequestRemoveTag(tagModel));
  }

  void addTag(TagModel tagModel) {
    bloc.add(CreateTransactionRequestAddTag(tagModel));
  }

  @override
  Widget build(BuildContext context) {
    final headline6 = Theme.of(context).textTheme.headline6;
    return Container(
      padding: const EdgeInsets.all(SMALL_SPACE),
      margin: const EdgeInsets.all(SMALL_SPACE),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Selected",
            style: headline6,
          ),
          SizedBox(
            height: MEDIUM_SPACE,
          ),
          Wrap(
            alignment: WrapAlignment.start,
            runSpacing: MEDIUM_SPACE,
            spacing: MEDIUM_SPACE,
            children: selectedTags
                .map(
                  (tagModel) => ButtonTagComponent(
                    onTap: () => removeTag(tagModel),
                    label: tagModel.label,
                  ),
                )
                .toList(),
          ),
          Divider(),
          Text(
            "All tags",
            style: headline6,
          ),
          SizedBox(
            height: MEDIUM_SPACE,
          ),
          Wrap(
            alignment: WrapAlignment.start,
            runSpacing: MEDIUM_SPACE,
            spacing: MEDIUM_SPACE,
            children: allTags
                .map(
                  (tagModel) => ButtonTagComponent(
                    label: tagModel.label,
                    onTap: () => addTag(tagModel),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
