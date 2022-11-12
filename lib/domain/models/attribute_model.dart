import 'package:json_annotation/json_annotation.dart';

part 'attribute_model.g.dart';

@JsonSerializable()
class AttributeModel {
  @JsonKey(name: "trait_type")
  final String traitType;
  final dynamic value;

  AttributeModel(this.traitType, this.value);

  factory AttributeModel.fromJson(Map<String, dynamic> json) =>
      _$AttributeModelFromJson(json);
}
