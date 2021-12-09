class Name{
  String first;
  String middle;
  String last;
  Name(this.first,this.middle,this.last);
  Name.fromJson(Map json)
      : first = json['first'],
        middle = json['middle'],
        last = json['last'];

  Map toJson() {
    return {'first': first, 'middle': middle, 'last': last};
  }
}
class Education{
  String highschool;
  String college;
  Education(this.highschool,this.college);
  Education.fromJson(Map json)
      : highschool = json['highschool'],
        college = json['college'];

  Map toJson() {
    return {'highschool': highschool, 'college': college};
  }
}
class Character {
  Name name;
  int age;
  String DOB;
  List<String> hobbies = [];
  Education education;
  Character(this.name, this.age, this.DOB, this.hobbies, this.education);
  Character.fromJson(Map json)
      : name = Name.fromJson(json ['name']),
        age = json['age'],
        DOB = json['DOB'],
        hobbies = List.from(json['hobbies']),
        education = Education.fromJson(json['education']);
  Map toJson() {
    return {'name': name, 'age': age, 'DOB': DOB, 'hobbies': hobbies, 'education': education};
  }
}