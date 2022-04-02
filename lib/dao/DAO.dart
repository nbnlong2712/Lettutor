import 'package:flutter_lettutor/models/course.dart';
import 'package:flutter_lettutor/models/feedback.dart';
import 'package:flutter_lettutor/models/schedule.dart';
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
    if (!isEmailDuplicateUser(user.email)) {
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

  User getUserById(int id) {
    List<User> users = (store.box<User>().query(User_.id.equals(id))).build().find();
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
    Tutor tutor = (store.box<Tutor>().query(Tutor_.email.equals(email))).build().findFirst()!;
    return tutor;
  }

  Tutor getTutorById(int id) {
    Tutor tutor = (store.box<Tutor>().query(Tutor_.id.equals(id))).build().findFirst()!;
    return tutor;
  }

  bool isTutorExists(String email) {
    List<Tutor> tutors = (store.box<Tutor>().query(Tutor_.email.equals(email))).build().find();
    return tutors.isNotEmpty;
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

  // ---SCHEDULE---
  void loadSchedules(int tutorId) {
    List<Schedule> scs = getAllScheduleByTutorId(tutorId);
    scs.forEach((element) {
      if (element.endTime.isBefore(DateTime.now())) {
        element.isBooked = true;
        updateSchedule(element);
      }
    });
  }

  void addSchedule(Schedule schedule) {
    if (!isScheduleDuplicate(schedule)) {
      store.box<Schedule>().put(schedule);
    }
  }

  void addListSchedules(List<Schedule> schedules) {
    store.box<Schedule>().putMany(schedules);
  }

  void updateSchedule(Schedule schedule) {
    store.box<Schedule>().put(schedule);
  }

  bool isScheduleDuplicate(Schedule schedule) {
    List<Schedule> scs = getAllScheduleByTutorId(schedule.tutorId);
    return scs.contains(schedule);
  }

  Schedule getScheduleById(int id) {
    Schedule schedule = (store.box<Schedule>().query(Schedule_.id.equals(id))).build().findFirst()!;
    return schedule;
  }

  List<Schedule> getAllScheduleByTutorId(int tutorId) {
    List<Schedule> schedules = (store.box<Schedule>().query(Schedule_.tutorId.equals(tutorId))).build().find();
    return schedules;
  }

  List<Schedule> getAllScheduleByTutorEmail(String tutorEmail) {
    Tutor tutor = getTutorByEmail(tutorEmail);
    List<Schedule> schedules = getAllScheduleByTutorId(tutor.id);
    return schedules;
  }

  List<Schedule> getAllScheduleByStudentId(int studentId) {
    List<Schedule> schedules = (store.box<Schedule>().query(Schedule_.studentId.equals(studentId))).build().find();
    return schedules;
  }

  List<Schedule> getUpcomingList(int studentId) {
    List<Schedule> scs = (store.box<Schedule>().query(Schedule_.studentId.equals(studentId).and(Schedule_.isBooked.equals(true)))).build().find();
    List<Schedule> scs1 = [];
    scs1.addAll(scs);
    for (var element in scs) {
      if (element.endTime.isBefore(DateTime.now())) {
        scs1.remove(element);
      }
    }
    return scs1;
  }

  List<Schedule> getHistoryList(int studentId) {
    List<Schedule> scs = (store.box<Schedule>().query(Schedule_.studentId.equals(studentId).and(Schedule_.isBooked.equals(true)))).build().find();
    List<Schedule> scs1 = [];
    scs1.addAll(scs);
    for (var element in scs) {
      if (element.endTime.isAfter(DateTime.now())) {
        scs1.remove(element);
      }
    }
    return scs1;
  }

  // ---FEEDBACK---

  void addFeedback(Feedback feedback) {
    store.box<Feedback>().put(feedback);
  }

  List<Feedback> getAllFeedbackByTutorId(int tutorId) {
    List<Feedback> fbs = store.box<Feedback>().query(Feedback_.tutorId.equals(tutorId)).build().find();
    return fbs;
  }

  // ---COURSE---
  void addCourse(List<Course> course) {
    store.box<Course>().putMany(course);
  }

  List<Course> getAllCourse()
  {
    return store.box<Course>().getAll();
  }

  void deleteAllCourse()
  {
    store.box<Course>().removeAll();
  }
}
