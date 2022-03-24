class User {
  int id = 0;
  late String avatar;
  late String name;
  late String email;
  late String country;
  late String? phone;
  late List<String> languages;
  late DateTime birthDay;

  User(this.avatar, this.name, this.email, this.country, this.phone, this.languages, this.birthDay);
}
