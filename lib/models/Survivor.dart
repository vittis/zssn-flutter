class Survivor {
  final String name;
  final int age;
  final String gender;
  final bool infected;

  Survivor({this.name, this.age, this.gender, this.infected});

  factory Survivor.fromJson(Map<String, dynamic> json) {
    return Survivor(
      name: json['name'],
      age: json['age'],
      gender: json['gender'],
      infected: json['infected'],
    );
  }
}
