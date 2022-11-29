import 'package:blackhole/const/const_business_rules.dart';
import 'package:blackhole/const/const_theme.dart';
import 'package:blackhole/injection_container.dart';
import 'package:blackhole/models/tag_model.dart';
import 'package:blackhole/tools/converters.dart';
import 'package:blackhole/tools/validate.dart';
import 'package:blackhole/view/components/button_tag_component.dart';
import 'package:blackhole/view/components/radio_button/bloc/radio_button_group_controller_bloc.dart';
import 'package:blackhole/view/components/radio_button/radio_button.dart';
import 'package:blackhole/view/components/radio_button/radio_group_button.dart';
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
  final radioGroupController = RadioButtonGroupControllerBloc();

  void removeTag(TagModel tagModel) {
    bloc.add(CreateTransactionRequestRemoveTag(tagModel));
  }

  void addTag(TagModel tagModel) {
    bloc.add(CreateTransactionRequestAddTag(tagModel));
  }

  void updateValue(String valueString) {
    double value = Converters.moneyStringToDouble(valueString);
    bloc.add(CreateTransactionRequestUpdateValue(value: value));
  }

  void updateObservation(String observation) {
    bloc.add(
      CreateTransactionRequestUpdateObservation(
        observation: observation,
      ),
    );
  }

  void saveTransaction() {
    if (!Validator.isFormValid(_formKey)) {
      return;
    }

    bloc.add(CreateTransactionRequestSaveTransaction());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocBuilder<CreateTransactionBloc, CreateTransactionState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text("new transaction"),
            ),
            floatingActionButton: _FloatingActionButtonSend(
              onPressed: saveTransaction,
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Container(
                    margin: const EdgeInsets.all(ThemeConstant.mediumSpace),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _FieldTitle(
                          title: "type",
                        ),
                        _FieldWithPadding(
                          child: _TransactionType(controller: radioGroupController,),
                        ),
                        _FieldTitle(
                          title: "value",
                        ),
                        _FieldWithPadding(
                          child: TextFieldMoney(
                            validator: Validator.validateMoneyForm,
                            onChange: updateValue,
                          ),
                        ),
                        const _FieldTitle(
                          title: "observation",
                        ),
                        _FieldWithPadding(
                          child: TextFormField(
                            validator: Validator.validateObservationForm,
                            onChanged: updateObservation,
                          ),
                        ),
                        const _FieldTitle(
                          title: "tags",
                        ),
                        _FieldWithPadding(
                          child: _TagsField(
                            removeTag: removeTag,
                            addTag: addTag,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
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
      padding: const EdgeInsets.only(left: ThemeConstant.mediumSpace),
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
        left: ThemeConstant.largeSpace,
        top: ThemeConstant.mediumSpace,
        bottom: ThemeConstant.largeSpace,
      ),
      child: child,
    );
  }
}

class _TagsField extends StatelessWidget {
  const _TagsField({
    Key? key,
    required this.removeTag,
    required this.addTag,
  }) : super(key: key);

  final Function removeTag;
  final Function addTag;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: ThemeConstant.largeSpace,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: const BorderRadius.all(
          Radius.circular(
            ThemeConstant.largeSpace,
          ),
        ),
      ),
      child: Center(
        child: BlocBuilder<CreateTransactionBloc, CreateTransactionState>(
          builder: (_, state) {
            if (state is CreateTransactionWithTags) {
              return Column(
                children: [
                  _TagsSelector(
                    removeTag: removeTag,
                    addTag: addTag,
                    selectedTags: state.selectedTags,
                    allTags: state.allTags,
                  ),
                ],
              );
            }
            return const SizedBox(
              height: ThemeConstant.tagSelectorBoxWeight,
              width: ThemeConstant.tagSelectorBoxWeight,
              child: SizedBox(
                height: ThemeConstant.largeSpace,
                width: ThemeConstant.largeSpace,
                child: CircularProgressIndicator(),
              ),
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
    required this.removeTag,
    required this.addTag,
  }) : super(key: key);

  final Function removeTag;
  final Function addTag;

  final List<TagModel> selectedTags;
  final List<TagModel> allTags;

  final bloc = getIt.get<CreateTransactionBloc>();

  @override
  Widget build(BuildContext context) {
    final headline6 = Theme.of(context).textTheme.headline6;
    return Container(
      padding: const EdgeInsets.all(
        ThemeConstant.smallSpace,
      ),
      margin: const EdgeInsets.all(
        ThemeConstant.smallSpace,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "selected",
            style: headline6,
          ),
          const SizedBox(
            height: ThemeConstant.mediumSpace,
          ),
          Wrap(
            alignment: WrapAlignment.start,
            runSpacing: ThemeConstant.mediumSpace,
            spacing: ThemeConstant.mediumSpace,
            children: selectedTags
                .map(
                  (tagModel) => ButtonTagComponent(
                    toAdd: false,
                    onTap: () => removeTag(tagModel),
                    label: tagModel.label,
                    isFirstTag: tagModel == selectedTags.first,
                  ),
                )
                .toList(),
          ),
          const Divider(),
          Text(
            "all tags",
            style: headline6,
          ),
          const SizedBox(
            height: ThemeConstant.mediumSpace,
          ),
          Wrap(
            alignment: WrapAlignment.start,
            runSpacing: ThemeConstant.mediumSpace,
            spacing: ThemeConstant.mediumSpace,
            children: allTags
                .map(
                  (tagModel) => ButtonTagComponent(
                    toAdd: true,
                    isFirstTag: false,
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

class _FloatingActionButtonSend extends StatelessWidget {
  const _FloatingActionButtonSend({Key? key, required this.onPressed})
      : super(key: key);

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateTransactionBloc, CreateTransactionState>(
      builder: (context, state) {
        bool isValid =
            (state is CreateTransactionWithTags) && state.isTransacionValid;

        return FloatingActionButton.extended(
          heroTag: 'FloatingActionButton',
          label: Row(
            children: [
              Text('Save'),
              SizedBox(
                width: ThemeConstant.smallSpace,
              ),
              Icon(Icons.save),
            ],
          ),
          onPressed: onPressed,
        );
      },
    );
  }
}

class _TransactionType extends StatelessWidget {
  const _TransactionType({Key? key, required this.controller}) : super(key: key);

  final RadioButtonGroupControllerBloc controller;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      RadioButtonGroup(
        controller: controller,
        radioButtonList: [
          RadioButton(
            value: TransactionTypes.moneyIn,
            title: "in",
          ),
          RadioButton(
            value: TransactionTypes.moneyOut,
            title: "out",
          ),
        ],
      ),
    ]);
  }
}
