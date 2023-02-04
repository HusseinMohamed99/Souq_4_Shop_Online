/// name : "Ahmed Abd Al-Muti"
/// email : "ahmedmutti12@gmail.com"
/// phone : "01010700700"
/// password : "$2a$12$8rntSbpMW4TQLPTxdG2OB.Xm3P8Nui2e07SLY9zMhvsNxDOWhV61O"
/// role : "user"
/// _id : "63dd696c111c02a678175228"
/// createdAt : "2023-02-03T20:07:08.086Z"
/// updatedAt : "2023-02-03T20:07:08.086Z"
/// __v : 0

class User {
  User({
    this.name,
    this.email,
    this.phone,
    this.password,
    this.id,
  });

  User.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    id = json['_id'];
  }

  String? name;
  String? email;
  String? phone;
  String? password;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['password'] = password;
    map['_id'] = id;
    return map;
  }
}
