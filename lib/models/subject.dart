class Subject {
  late int id;
  late String key;
  late String name;

  Subject(this.id, this.key, this.name);

  Subject.fromJson(Map map)
      : id = map['id'],
        key = map['key'],
        name = map['name'];

  Map toJson() {
    return {'id': id, 'key': key, 'name': name};
  }

  @override
  String toString() {
    return 'Subject{id: $id, key: $key, name: $name}';
  }
}
