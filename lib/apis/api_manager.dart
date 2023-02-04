import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:souq_4_shop_online/apis/model/request/LoginRequest.dart';
import 'package:souq_4_shop_online/apis/model/request/RegisterRequest.dart';
import 'package:souq_4_shop_online/apis/model/response/LoginResponse.dart';
import 'package:souq_4_shop_online/apis/model/response/RegisterResponse.dart';

class ApisManager {
  static Future<RegisterResponse> register(String name, String phone,
      String password, String repassword, String email) async {
    var requestBody = RegisterRequest(
      name: name,
      email: email,
      password: password,
      repassword: repassword,
      phone: phone,
    );
    var url = Uri.https(ApisConstant.baseUrl, ApisConstant.register);
    var response = await http.post(url, body: requestBody.toJson());
    return RegisterResponse.fromJson(jsonDecode(response.body));
  }

  static Future<LoginResponse> login(String password, String email) async {
    var requestBody = LoginRequest(
      email: email,
      password: password,
    );
    var url = Uri.https(ApisConstant.baseUrl, ApisConstant.register);
    var response = await http.post(url, body: requestBody.toJson());
    return LoginResponse.fromJson(jsonDecode(response.body));
  }
}

class ApisConstant {
  static const baseUrl = 'route-ecommerce.vercel.app';
  static const register = 'api/v1/auth/signup';
  static const login = 'api/v1/auth/signin';
}
