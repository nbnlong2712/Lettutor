import 'package:intl/intl.dart';

class Tutor {
  late String id;
  late String userId;

  late String email;
  late String name;
  late String avatar;
  late String country;
  String? phone;
  late DateTime birthday;
  late String level;
  late String video;
  late String bio;
  late String education;
  late String experience;
  late List<String> profession;
  late String targetStudent;
  late String interests;
  late List<String> languages;
  late List<String> specialties;
  late bool isActivated;
  late int price;
  late double avgRating;
  late bool isOnline;

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

  Tutor.fromJson(Map json)
      : id = json['id'],
        userId = json['userId'],
        video = json['video'],
        bio = json['bio'],
        education = json['education'],
        experience = json['experience'],
        profession = List<String>.from(json['profession']),
        targetStudent = json['targetStudent'],
        interests = json['interests'],
        price = json['price'],
        level = json['level'],
        email = json['email'],
        avatar = json['avatar'],
        name = json['name'],
        country = json['country'],
        phone = json['phone'],
        languages = List<String>.from(json['languages']),
        specialties = List<String>.from(json['specialties']),
        birthday = DateFormat("yyyy-MM-dd").parse(json['birthday']),
        isActivated = json['isActivated'],
        avgRating = json['avgRating'],
        isOnline = json['isOnline'];

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
