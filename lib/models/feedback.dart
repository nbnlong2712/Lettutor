class Feedback {
  int id = 0;

  late int authId;
  late int tutorId;
  late String content;
  late double stars;
  late DateTime createAt;

  Feedback(this.authId, this.tutorId, this.content, this.stars, this.createAt);
}
