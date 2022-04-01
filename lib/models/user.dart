import 'package:objectbox/objectbox.dart';

@Entity()
class User {
  @Id()
  int id = 0;

  late String avatar;
  String? password;
  late String name;
  late String email;
  late String country;
  late String? phone;
  late List<String> languages;
  late DateTime birthDay;
  late String level;
  late String role;
  late List<String> wantToLearn;

  late bool isLogin;

  User(this.avatar, this.password, this.name, this.email, this.country, this.phone, this.languages, this.birthDay, this.level, this.role,
      this.wantToLearn, this.isLogin);

  @override
  String toString() {
    return 'User{id: $id, avatar: $avatar, password: $password, name: $name, email: $email, country: $country, phone: $phone, languages: $languages, birthDay: $birthDay, level: $level, role: $role, wantToLearn: $wantToLearn, isLogin: $isLogin}';
  }
}
