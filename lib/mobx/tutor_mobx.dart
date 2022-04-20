import 'package:flutter_lettutor/api/tutor_request.dart';
import 'package:flutter_lettutor/models/tutor.dart';
import 'package:mobx/mobx.dart';
part 'tutor_mobx.g.dart';

class TutorMobx = TutorBase with _$TutorMobx;
abstract class TutorBase with Store {

  @observable
  ObservableList<Tutor> tutorList = ObservableList.of([]);

  @action
  Future<void> initTutors() async{
    await TutorRequest.fetchAllTutor().then((list) => tutorList = ObservableList.of(list));
  }
}