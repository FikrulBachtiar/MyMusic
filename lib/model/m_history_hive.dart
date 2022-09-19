import 'package:hive/hive.dart';

part 'm_history_hive.g.dart';

@HiveType(typeId: 0)
class HistoryHive extends HiveObject {
  HistoryHive({
    required this.id,
    required this.createdAt,
  });

  @HiveField(0)
  String id;

  @HiveField(1)
  DateTime createdAt;
}
