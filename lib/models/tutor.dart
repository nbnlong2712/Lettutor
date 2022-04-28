import 'package:country_picker/country_picker.dart';
import 'package:intl/intl.dart';
import 'package:recase/recase.dart';

class Tutor {
  late String id;
  late String userId;

  late String email;
  late String name;
  late String avatar;
  String? country;
  String? phone;
  String? level;
  String? video;
  String? bio;
  String? education;
  String? experience;
  String? profession;
  String? targetStudent;
  String? interests;
  List<String>? languages;
  List<String>? specialties;
  int? price;
  double? avgRating;
  bool? isFavorite;

  Tutor(this.id, this.userId, this.email, this.name, this.avatar, this.country, this.phone, this.level, this.video, this.bio, this.education,
      this.experience, this.profession, this.targetStudent, this.interests, this.languages, this.specialties, this.price, this.avgRating, this.isFavorite);

  Tutor.fromJson(Map json) {
    id = json['id'];
    userId = json['userId'];
    bio = json['bio'];
    education = json['education'];
    experience = json['experience'];
    profession = json['profession'];
    targetStudent = json['targetStudent'];
    interests = json['interests'];
    level = json['level'];
    email = json['email'];
    avatar = json['avatar'];
    name = json['name'];
    specialties =
        ReCase(json['specialties'].replaceAll("-", "+").replaceAll(",", " ")).titleCase.replaceAll(" ", ",").replaceAll("+", " ").split(',');
  }

  Tutor.fromJsonForDetail(Map json) {
    id = json['id'];
    userId = json['userId'];
    video = json['video'];
    bio = json['bio'];
    education = json['education'];
    experience = json['experience'];
    profession = json['profession'];
    targetStudent = json['targetStudent'];
    interests = json['interests'];
    price = json['price'];
    level = json['User']['level'];
    email = json['User']['email'];
    avatar = json['User']['avatar'];
    name = json['User']['name'];
    country = json['User']['country'];
    phone = json['User']['phone'];
    languages = json['languages'].split(',');
    specialties =
        ReCase(json['specialties'].replaceAll("-", "+").replaceAll(",", " ")).titleCase.replaceAll(" ", ",").replaceAll("+", " ").split(',');
    avgRating = json['avgRating'];
    isFavorite = json['isFavorite'];
  }

  Tutor.fromJsonForRating(Map json)
  {
    avgRating = json['avgRating'].toDouble();
  }

  Tutor.fromJsonForFavourite(Map json)
  {
    isFavorite = json['isFavorite'];
  }

  Map toJson() {
    return {
      'id': id,
      'userId': userId,
      'video': video,
      'bio': bio,
      'education': education,
      'experience': experience,
      'profession': profession,
      'targetStudent': targetStudent,
      'interests': interests,
      'price': price,
      'level': level,
      'email': email,
      'avatar': avatar,
      'name': name,
      'country': country,
      'phone': phone,
      'languages': languages,
      'specialties': specialties,
      'avgRating': avgRating
    };
  }

  @override
  String toString() {
    return 'Tutor{id: $id, userId: $userId, email: $email, name: $name, avatar: $avatar, country: $country, phone: $phone, level: $level, video: $video, bio: $bio, education: $education, experience: $experience, profession: $profession, targetStudent: $targetStudent, interests: $interests, languages: $languages, specialties: $specialties, price: $price, avrRating: $avgRating}';
  }
}
