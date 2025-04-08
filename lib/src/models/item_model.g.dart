// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemModel _$ItemModelFromJson(Map<String, dynamic> json) => ItemModel(
      id: json['id'] as String? ?? '',
      itemName: json['itemName'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      imageUrl: json['picture'] as String,
      unidadeMedida: json['unidadeMedida'] as String,
      quantity: (json['quantity'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$ItemModelToJson(ItemModel instance) => <String, dynamic>{
      'id': instance.id,
      'itemName': instance.itemName,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'picture': instance.imageUrl,
      'unidadeMedida': instance.unidadeMedida,
      'quantity': instance.quantity,
    };
