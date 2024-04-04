// To parse this JSON data, do
//
//     final schedulesMainResponseModel = schedulesMainResponseModelFromJson(jsonString);

import 'dart:convert';

SchedulesMainResponseModel schedulesMainResponseModelFromJson(String str) =>
    SchedulesMainResponseModel.fromJson(json.decode(str));

String schedulesMainResponseModelToJson(SchedulesMainResponseModel data) =>
    json.encode(data.toJson());

class SchedulesMainResponseModel {
  SchedulesMainResponseModel({
    required this.courses,
    required this.teachers,
    required this.faq,
    required this.articles,
    required this.gallery,
  });

  Courses courses;
  List<Teacher> teachers;
  List<Faq> faq;
  Articles articles;
  List<Gallery> gallery;

  factory SchedulesMainResponseModel.fromJson(Map<String, dynamic> json) =>
      SchedulesMainResponseModel(
        courses: Courses.fromJson(json["courses"]),
        teachers: List<Teacher>.from(
            json["teachers"].map((x) => Teacher.fromJson(x))),
        faq: List<Faq>.from(json["faq"].map((x) => Faq.fromJson(x))),
        articles: Articles.fromJson(json["articles"]),
        gallery:
            List<Gallery>.from(json["gallery"].map((x) => Gallery.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "courses": courses.toJson(),
        "teachers": List<dynamic>.from(teachers.map((x) => x.toJson())),
        "faq": List<dynamic>.from(faq.map((x) => x.toJson())),
        "articles": articles.toJson(),
        "gallery": List<dynamic>.from(gallery.map((x) => x.toJson())),
      };
}

class Articles {
  Articles({
    required this.categories,
    required this.items,
  });

  List<dynamic> categories;
  List<ArticlesItem> items;

  factory Articles.fromJson(Map<String, dynamic> json) => Articles(
        categories: List<dynamic>.from(json["categories"].map((x) => x)),
        items: List<ArticlesItem>.from(
            json["items"].map((x) => ArticlesItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class ArticlesItem {
  ArticlesItem({
    required this.date,
    required this.name,
    required this.code,
    required this.categories,
  });

  String date;
  String name;
  String code;
  List<int> categories;

  factory ArticlesItem.fromJson(Map<String, dynamic> json) => ArticlesItem(
        date: json["date"],
        name: json["name"],
        code: json["code"],
        categories: List<int>.from(json["categories"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "name": name,
        "code": code,
        "categories": List<dynamic>.from(categories.map((x) => x)),
      };
}

class Courses {
  Courses({
    required this.categories,
    required this.items,
  });

  List<CategoryClass> categories;
  List<CoursesItem> items;

  factory Courses.fromJson(Map<String, dynamic> json) => Courses(
        categories: List<CategoryClass>.from(
            json["categories"].map((x) => CategoryClass.fromJson(x))),
        items: List<CoursesItem>.from(
            json["items"].map((x) => CoursesItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class CategoryClass {
  CategoryClass({
    required this.title,
    required this.code,
    required this.id,
  });

  String title;
  String code;
  String id;

  factory CategoryClass.fromJson(Map<String, dynamic> json) => CategoryClass(
        title: json["title"],
        code: json["code"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "code": code,
        "id": id,
      };
}

class CoursesItem {
  CoursesItem({
    required this.type,
    required this.code,
    required this.status,
    required this.title,
    required this.description,
    required this.categories,
  });

  Type type;
  String code;
  Status status;
  String title;
  String description;
  List<dynamic> categories;

  factory CoursesItem.fromJson(Map<String, dynamic> json) => CoursesItem(
        type: typeValues.map[json["type"]]!,
        code: json["code"],
        status: statusValues.map[json["status"]]?? Status.empty,
        title: json["title"],
        description: json["description"],
        categories: List<dynamic>.from(json["categories"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "type": typeValues.reverse[type],
        "code": code,
        "status": statusValues.reverse[status],
        "title": title,
        "description": description,
        "categories": List<dynamic>.from(categories.map((x) => x)),
      };
}

enum Status { empty, status }

final statusValues = EnumValues(
    {"Сейчас идет": Status.empty, "Курс в проработке": Status.status});

enum Type { education, exam, practice }

final typeValues = EnumValues({
  "education": Type.education,
  "exam": Type.exam,
  "practice": Type.practice
});

class Faq {
  Faq({
    required this.question,
    required this.answer,
  });

  String question;
  String answer;

  factory Faq.fromJson(Map<String, dynamic> json) => Faq(
        question: json["question"],
        answer: json["answer"],
      );

  Map<String, dynamic> toJson() => {
        "question": question,
        "answer": answer,
      };
}

class Gallery {
  Gallery({
    required this.preview,
    required this.full,
  });

  String preview;
  String full;

  factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
        preview: json["preview"],
        full: json["full"],
      );

  Map<String, dynamic> toJson() => {
        "preview": preview,
        "full": full,
      };
}

class Teacher {
  Teacher({
    required this.name,
    required this.position,
    required this.curator,
    required this.image,
  });

  String name;
  String position;
  String curator;
  String image;

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
        name: json["name"],
        position: json["position"],
        curator: json["curator"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "position": position,
        "curator": curator,
        "image": image,
      };
}

class EnumValues<T> {
  late Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    return reverseMap;
  }
}
