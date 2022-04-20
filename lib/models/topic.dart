class Topic {
  String? id;
  String? courseId;
  int? orderCourse;
  String? name;
  String? nameFile;
  String? description;

  Topic(this.id, this.courseId, this.orderCourse, this.name, this.nameFile, this.description);

  Topic.fromJson(Map map)
      : id = map['id'],
        courseId = map['courseId'],
        orderCourse = map['orderCourse'],
        name = map['name'],
        nameFile = map['nameFile'],
        description = map['description'];

  Map fromJson() {
    return {'id': id, 'courseId': courseId, 'orderCourse': orderCourse, 'name': name, 'nameFile': nameFile, 'description': description};
  }

  @override
  String toString() {
    return 'Topic{id: $id, courseId: $courseId, orderCourse: $orderCourse, name: $name, nameFile: $nameFile, description: $description}';
  }
}
