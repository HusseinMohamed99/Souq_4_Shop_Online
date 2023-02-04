import 'package:souq_4_shop_online/apis/model/response/ServerErrors.dart';

import 'User.dart';

/// data : {"name":"Ahmed Abd Al-Muti","email":"ahmedmutti12@gmail.com","phone":"01010700700","password":"$2a$12$8rntSbpMW4TQLPTxdG2OB.Xm3P8Nui2e07SLY9zMhvsNxDOWhV61O","role":"user","_id":"63dd696c111c02a678175228","createdAt":"2023-02-03T20:07:08.086Z","updatedAt":"2023-02-03T20:07:08.086Z","__v":0}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzZGQ2OTZjMTExYzAyYTY3ODE3NTIyOCIsImlhdCI6MTY3NTQ1NDgyOCwiZXhwIjoxNjgzMjMwODI4fQ.1FdgjLgFTBpniqQJiN--3u94UrFv63krxOom0y2pKnY"

class RegisterResponse {
  RegisterResponse({this.user, this.token, this.errors});

  RegisterResponse.fromJson(dynamic json) {
    user = json['data'] != null ? User.fromJson(json['data']) : null;
    token = json['token'];
    if (json['errors'] != null) {
      errors = [];
      json['errors'].forEach((v) {
        errors?.add(ServerErrors.fromJson(v));
      });
    }
  }

  User? user;
  String? token;
  List<ServerErrors>? errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['data'] = user?.toJson();
    }
    if (errors != null) {
      map['errors'] = errors?.map((v) => v.toJson()).toList();
    }
    map['token'] = token;
    return map;
  }

  String joinErrors() {
    String messages = '';
    errors?.forEach((error) {
      messages += '${error.msg ?? ''} \n';
    });
    return messages;
  }
}
