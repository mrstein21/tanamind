// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_cart_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveCartModelAdapter extends TypeAdapter<HiveCartModel> {
  @override
  final int typeId = 0;

  @override
  HiveCartModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveCartModel(
      id: fields[0] as int,
      itemId: fields[1] as int,
      name: fields[2] as String,
      image: fields[6] as String,
      description: fields[3] as String,
      price: fields[4] as String,
      qty: fields[7] as int,
    );
  }

  @override
  void write(BinaryWriter writer, HiveCartModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.itemId)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(6)
      ..write(obj.image)
      ..writeByte(7)
      ..write(obj.qty);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveCartModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
