import 'package:objectbox/objectbox.dart';

@Entity()
class UserDao {
  @Id()
  int id = 0;
  String? name;
  String? email;
  String? gender;
  String? status;

  UserDao({this.id = 0, this.name, this.email, this.gender, this.status});
}