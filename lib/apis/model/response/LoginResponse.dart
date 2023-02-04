/// status : "error"
/// message : "Incorrect email or password"
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Il9pZCI6IjYzZGViNmY0NGZjNTkxOTdlZDBhYzU2YSIsIm5hbWUiOiJIdXNzZWluIE1vaGFtZWQiLCJlbWFpbCI6Imh1c3NlaW5AZ21haWwuY29tIiwicGhvbmUiOiIwMTAyMjczMTUyMCIsInJvbGUiOiJ1c2VyIiwiY3JlYXRlZEF0IjoiMjAyMy0wMi0wNFQxOTo1MDoxMi41NDNaIiwidXBkYXRlZEF0IjoiMjAyMy0wMi0wNFQxOTo1MDoxMi41NDNaIiwiX192IjowfSwiaWF0IjoxNjc1NTQwNTk4LCJleHAiOjE2ODMzMTY1OTh9.ij5gP2G8qEU673_6q5BdV2v8mO5OvSmH7Zp7fvwKtt0"

class LoginResponse {
  LoginResponse({
    this.status,
    this.message,
    this.token,
  });

  LoginResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    token = json['token'];
  }

  String? status;
  String? message;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['token'] = token;
    return map;
  }
}
