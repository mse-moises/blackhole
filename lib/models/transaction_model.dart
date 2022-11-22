import 'package:blackhole/models/tag_model.dart';

class TransactionModel {
  
  final double value;
  final String observation;

  final TagModel primaryTag;
  final List<TagModel> tags;

  TransactionModel( {
    required this.value,
    required this.observation,
    required this.tags,
    required this.primaryTag,
  });
}
