// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      json['name'] as String,
      json['address'] as String,
      json['image'] as String,
      json['id'] as String,
      (json['attributes'] as List<dynamic>)
          .map((e) => AttributeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'image': instance.image,
      'id': instance.id,
      'attributes': instance.attributes,
    };
