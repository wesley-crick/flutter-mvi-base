import 'package:objectbox/objectbox.dart';

@Entity()
class UserDao {
  @Id()
  int id = 0;
  String name;

  UserDao({this.id = 0, this.name = ""});
}