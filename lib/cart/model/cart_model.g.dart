// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartModelAdapter extends TypeAdapter<CartModel> {
  @override
  final int typeId = 3;

  @override
  CartModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartModel(
      id: fields[8] as String,
      key: fields[16] as int,
      mealName: fields[0] as String,
      quantity: (fields[1] as Map).cast<dynamic, dynamic>(),
      supplements: (fields[2] as List)
          .map((dynamic e) => (e as Map).cast<dynamic, dynamic>())
          .toList(),
      extras: (fields[3] as List)
          .map((dynamic e) => (e as Map).cast<dynamic, dynamic>())
          .toList(),
      note: fields[4] as String,
      total: fields[5] as double,
      count: fields[6] as int,
      minimumMealPrice: fields[7] as double,
      chefName: fields[9] as String,
      address: fields[10] as String,
      chefDeliveryDays: (fields[11] as List).cast<dynamic>(),
      specifiedDeliveryAndTime: fields[12] as String,
      status: fields[13] as String,
      chefId: fields[14] as String,
      chefImageUrl: fields[15] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CartModel obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.mealName)
      ..writeByte(1)
      ..write(obj.quantity)
      ..writeByte(2)
      ..write(obj.supplements)
      ..writeByte(3)
      ..write(obj.extras)
      ..writeByte(4)
      ..write(obj.note)
      ..writeByte(5)
      ..write(obj.total)
      ..writeByte(6)
      ..write(obj.count)
      ..writeByte(7)
      ..write(obj.minimumMealPrice)
      ..writeByte(8)
      ..write(obj.id)
      ..writeByte(9)
      ..write(obj.chefName)
      ..writeByte(10)
      ..write(obj.address)
      ..writeByte(11)
      ..write(obj.chefDeliveryDays)
      ..writeByte(12)
      ..write(obj.specifiedDeliveryAndTime)
      ..writeByte(13)
      ..write(obj.status)
      ..writeByte(14)
      ..write(obj.chefId)
      ..writeByte(15)
      ..write(obj.chefImageUrl)
      ..writeByte(16)
      ..write(obj.key);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
