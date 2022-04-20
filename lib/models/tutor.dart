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
  DateTime? birthday;
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
  bool? isActivated;
  int? price;
  double? avgRating;
  bool? isOnline;

  Tutor(
      this.id,
      this.userId,
      this.email,
      this.name,
      this.avatar,
      this.country,
      this.phone,
      this.birthday,
      this.level,
      this.video,
      this.bio,
      this.education,
      this.experience,
      this.profession,
      this.targetStudent,
      this.interests,
      this.languages,
      this.specialties,
      this.isActivated,
      this.price,
      this.avgRating,
      this.isOnline);

  Tutor.fromJson(Map json) {
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
    level = json['level'];
    email = json['email'];
    avatar = json['avatar'];
    name = json['name'];
    country = json['country'];
    phone = json['phone'];
    languages = json['languages'].split(',');
    specialties = ReCase(json['specialties'].replaceAll("-", "+").replaceAll(",", " ")).titleCase.replaceAll(" ", ",").replaceAll("+", " ").split(',');
    birthday = DateFormat("yyyy-MM-dd").parse(json['birthday']);
    isActivated = json['isActivated'];
    avgRating = json['avgRating'];
    isOnline = json['isOnline'];
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
      'birthday': birthday,
      'isActivated': isActivated,
      'avgRating': avgRating,
      'isOnline': isOnline
    };
  }

  @override
  String toString() {
    return 'Tutor{id: $id, userId: $userId, email: $email, name: $name, avatar: $avatar, country: $country, phone: $phone, birthday: $birthday, level: $level, video: $video, bio: $bio, education: $education, experience: $experience, profession: $profession, targetStudent: $targetStudent, interests: $interests, languages: $languages, specialties: $specialties, isActivated: $isActivated, price: $price, avrRating: $avgRating, isOnline: $isOnline}';
  }
}
