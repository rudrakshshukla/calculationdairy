import 'package:hive/hive.dart';


@HiveType(typeId: 0)

class UserModel {
  @HiveField(0)
  String userName;
  @HiveField(1)
  String password;

  UserModel(this.userName,this.password);

}