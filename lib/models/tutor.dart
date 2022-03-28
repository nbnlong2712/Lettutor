import 'package:flutter_lettutor/models/user.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Tutor {
  @override
  @Id()
  int id = 0;


  late String avatar;
  String? password;
  late String name;
  late String email;
  late String country;
  late String? phone;
  late List<String> interests;
  late String experience;
  late String bio;
  late String targetStudent;
  late String videoUrl;
  late int price;
  late List<String> languages;
  late DateTime birthDay;
  late String level;
  late String role;
  late double stars;
  late bool isFavorite;
  late String description;
  late bool isLogin;

  Tutor(this.avatar, this.password, this.name, this.email, this.country, this.phone, this.interests, this.experience, this.bio, this.targetStudent,
      this.videoUrl, this.price, this.languages, this.birthDay, this.level, this.role, this.stars, this.isFavorite, this.description, this.isLogin);

  @override
  String toString() {
    return 'Tutor{id: $id, avatar: $avatar, password: $password, name: $name, email: $email, country: $country, phone: $phone,'
        ' interests: $interests, experience: $experience, bio: $bio, targetStudent: $targetStudent, videoUrl: $videoUrl, '
        'price: $price, languages: $languages, birthDay: $birthDay, level: $level, role: $role, stars: $stars, '
        'isFavorite: $isFavorite, description: $description, isLogin: $isLogin}';
  }
}
