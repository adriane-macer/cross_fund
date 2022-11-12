import 'package:cross_fund/domain/models/attribute_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  final String name;
  final String address;
  final String image;
  final String id;
  final String description;
  final List<AttributeModel> attributes;

  ProductModel(this.name, this.address, this.image, this.id, this.attributes,
      this.description);

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
