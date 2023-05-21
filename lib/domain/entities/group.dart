import 'package:hive/hive.dart';

part 'group.g.dart';

@HiveType(typeId: 1)
class Group {

  Group({
    required this.name,
  });

  @HiveField(0)
  String name;

}
