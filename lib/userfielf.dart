import 'dart:convert';

import 'package:checkboxlist/userfielf.dart';

// class UserFields{
//
//    static final String  id ='id';
//    static final String contact ='contact';
//    static final String name ='name';
//
//    // static final String name ='name';
//
//    static List<String> getFields()=>[id,contact,name];
//
// }
//
//   class User {
//     final String id;
//     final String contact;
//     final String name;
//
//     User(this.id, this.contact, this.name);
//
//
//     Map<String, dynamic> toJson() =>
//         {
//           UserFields.id: id,
//           UserFields.contact: contact,
//           UserFields.name: name,
//         };
//
//     // factory User.fromJson(Map<String, dynamic> json) {
//     //   return User(
//     //       id: json[UserFields.id],
//     //
//     //      // : jsonDecode(json[UserFields.id]),
//     //     jsonDecode(json[UserFields.contact]),
//     //     jsonDecode(json[UserFields.name]),
//     //
//     //   );
//     // }
//
//
//     factory User.fromJson(Map<String, dynamic> json) {
//       return  User(
//         id: jsonDecode(json[UserFields.id]),
//         name: jsonDecode(json[UserFields.name]),
//         contact: jsonDecode(json[UserFields.contact]),
//       );
//     }
//
//
//   }

class UserFields {
  static final String id = "id";
  static final String contact = "Contact";
  static final String name = "Name";



  static List<String> getFields() => [
    id, contact,name,
  ];
}

class User {
  final String id;
  final String contact;
  final String name;


  const User({
    this.id,
    this.contact,
    this.name,

  });

  static User fromJson(Map<String, dynamic> json) => User(
      id: json[UserFields.id],
      contact: json[UserFields.contact],
      name: json[UserFields.name],

  );

  Map<String, dynamic> toJson() => {
    UserFields.id : id,
    UserFields.contact : contact,
    UserFields.name : name,

  };

}
