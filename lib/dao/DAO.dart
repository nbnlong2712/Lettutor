import 'package:flutter_lettutor/models/tutor.dart';
import 'package:flutter_lettutor/models/user.dart';
import 'package:flutter_lettutor/objectbox.g.dart';

class DAO {
  late Store store;

  void openDB() async {
    store = await openStore();
  }

  // ---USER---
  void addUser(User user) {
    if (isEmailDuplicateUser(user.email)) {
      store.box<User>().put(user);
    }
  }

  void updateUser(User user) {
    store.box<User>().put(user);
  }

  bool isEmailDuplicateUser(String email) {
    List<User> users = (store.box<User>().query(User_.email.equals(email))).build().find();
    return users.isNotEmpty;
  }

  User getUserByEmail(String email) {
    List<User> users = (store.box<User>().query(User_.email.equals(email))).build().find();
    return users[0];
  }

  bool checkLoginSuccess(String email, String password) {
    List<User> users = (store.box<User>().query(User_.email.equals(email).and(User_.password.equals(password)))).build().find();
    return users.isNotEmpty;
  }

  void deleteUserById(int id) {
    store.box<User>().remove(id);
  }

  void deleteAllUser() {
    store.box<User>().removeAll();
  }

  void deleteUserByEmail(String email) {
    store.box<User>().remove((store.box<User>().query(User_.email.equals(email))).build().find()[0].id);
  }

  List<User> getAllUserFromDb() {
    final query = store.box<User>().query(User_.id.notNull()).build();
    return query.find();
  }

  // ---TUTOR---
  void addTutor(Tutor tutor) {
    if (!isEmailDuplicateTutor(tutor.email)) {
      store.box<Tutor>().put(tutor);
    }
  }

  void updateTutor(Tutor tutor) {
    store.box<Tutor>().put(tutor);
  }

  bool isEmailDuplicateTutor(String email) {
    List<Tutor> tutors = (store.box<Tutor>().query(Tutor_.email.equals(email))).build().find();
    return tutors.isNotEmpty;
  }

  Tutor getTutorByEmail(String email) {
    List<Tutor> tutors = (store.box<Tutor>().query(Tutor_.email.equals(email))).build().find();
    return tutors[0];
  }

  void deleteTutorById(int id) {
    store.box<Tutor>().remove(id);
  }

  void deleteAllTutor() {
    store.box<Tutor>().removeAll();
  }

  void deleteTutorByEmail(String email) {
    store.box<Tutor>().remove((store.box<Tutor>().query(Tutor_.email.equals(email))).build().find()[0].id);
  }

  List<Tutor> getAllTutorFromDb() {
    final query = store.box<Tutor>().query(Tutor_.id.notNull()).build();
    return query.find();
  }
}
