import 'package:flutter_lettutor/models/user.dart';

class Tutor extends User {
  late double stars;
  late bool isFavorite;
  late String description;

  Tutor(avatar, name, email, country, phone, languages, birthDay, this.stars, this.isFavorite, this.description)
      : super(avatar, name, email, country, phone, languages, birthDay);
}
