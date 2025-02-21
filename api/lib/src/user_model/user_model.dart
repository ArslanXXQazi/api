// import 'dart:ui';
//
// class UserModel {
//   int? id;
//   String? name;
//   int? year;
//   Color? color;
//   String? pantone_value;
//
//   UserModel({
//     required this.id,
//     required this.name,
//     required this.year,
//     required this.color,
//     required this.pantone_value,
//   });
//
//
//   static UserModel fromMap(Map map) {
//     return UserModel(
//       id: map['id'],
//       name: map['name'],
//       year: map['year'],
//       color: Color(map['color']),
//       pantone_value: map['pantone_value'],
//     );
//   }
// }



import 'dart:ui';

class UserModel {
  int? id;
  String? name;
  int? year;
  Color? color;
  String? pantone_value;

  UserModel({
    required this.id,
    required this.name,
    required this.year,
    required this.color,
    required this.pantone_value,
  });

  static UserModel fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      year: map['year'],
      color: Color(int.parse(map['color'].replaceFirst('#', '0xff'))), // Convert hex string to Color
      pantone_value: map['pantone_value'],
    );
  }
}
