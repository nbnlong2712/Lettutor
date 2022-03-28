import 'package:objectbox/objectbox.dart';

@Entity()
class Topic {
  @Id() int id = 0;

  late String nameFile;
  late String name;
  late String description;

  Topic(this.description, this.nameFile, this.name);

  @override
  String toString() {
    return 'Topic{id: $id, nameFile: $nameFile, name: $name, description: $description}';
  }
}
