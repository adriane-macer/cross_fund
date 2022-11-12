// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attribute_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttributeModel _$AttributeModelFromJson(Map<String, dynamic> json) =>
    AttributeModel(
      json['trait_type'] as String,
      json['value'],
    );

Map<String, dynamic> _$AttributeModelToJson(AttributeModel instance) =>
    <String, dynamic>{
      'trait_type': instance.traitType,
      'value': instance.value,
    };
