// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_history_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HistoryHiveAdapter extends TypeAdapter<HistoryHive> {
  @override
  final int typeId = 0;

  @override
  HistoryHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HistoryHive(
      id: fields[0] as String,
      createdAt: fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, HistoryHive obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HistoryHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
