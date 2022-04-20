import 'package:flutter_lettutor/models/subject.dart';

class Constant {
  static const List<String> Countries = [
    "Vietnam",
    "Laos",
    "Cambodia",
    "America",
    "China",
    "Russia",
    "Argentina",
    "England",
    "Philippines",
    "Malaysia",
    "Indonesia",
    "Australia",
    "Italy",
    "Hungary",
    "Slovakia",
    "Slovenia",
    "Armenia",
    "India",
    "Singapore",
    "Myanmar",
    "France",
    "Germany",
    "Mongol",
    "Canada",
    "Japan",
    "Korean",
    "Nepal",
    "Bhutan",
    "Brazil",
    "Venezuela",
    "Mexico",
    "Uruguay",
    "Paraguay",
    "Denmark",
    "Sweden",
    "Switzerland",
    "Iceland",
    "Ireland",
    "Scotland",
    "Wales",
    "Spain",
    "Portugal",
    "Greece",
    "Turkey",
    "Arab Saudi",
    "UAE",
    "Qatar",
    "Syria",
    "Afghanistan",
    "Israel",
    "Pakistan",
    "Palestine",
    "Iran",
    "Iraq",
    "Libya",
    "South Africa",
    "Congo",
    "Nigeria",
    "Cameroon",
    "Ethiopia",
    "Egypt",
  ];

  static const Map<String, String> Levels = {
    "0": "ANY LEVEL",
    "1": "BEGINNER",
    "2": "HIGHER_BEGINNER",
    "3": "PRE_INTERMEDIATE",
    "4": "INTERMEDIATE",
    "5": "UPPER_INTERMEDIATE",
    "6": "ADVANCED",
    "7": "PROFICIENCY"
  };

  static const List<String> Categories = [
    "For studying abroad",
    "English for Traveling",
    "Conversational English",
    "English for Beginners"
    "Business English",
    "STARTERS",
    "English for Kid",
    "PET",
    "KET",
    "MOVERS",
    "FLYERS",
    "TOEFL",
    "TOEIC"
    "IETLS",
  ];

  static const List<String> Skills = [
    "Business English",
    "English for kids",
    "Conversation English",
    "STARTERS",
    "MOVERS",
    "FLYERS",
    "KET",
    "PET",
    "IETLS",
    "TOEFL",
    "TOEIC"
  ];

  static List<Subject> LearnTopics = [
    Subject(3, "english-for-kids", "English for Kids"),
    Subject(4, "business-english", "Business English"),
    Subject(5, "conversational-english", "Conversational English"),
  ];

  static List<Subject> TestPreparations = [
    Subject(1, "starters", "STARTERS"),
    Subject(2, "movers", "MOVERS"),
    Subject(3, "flyers", "FLYERS"),
    Subject(4, "ket", "KET"),
    Subject(5, "pet", "PET"),
    Subject(6, "ielts", "IELTS"),
    Subject(7, "toefl", "TOEFL"),
    Subject(8, "toeic", "TOEIC"),
  ];

  static const List<String> Interests = ["Sport", "Music", "Technology", "Art", "Movie", "Book", "Travel", "Martial Art", "Coffee"];

  static const List<String> Educations = ["MBA", "MBS", "Prof", "Dr"];
}
