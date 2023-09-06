import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/path.dart';
import 'package:flutter_application_1/features/clean%20arch/presentation/screens/pages/home_model.dart';

class DioHelper {
  static Dio? dio;
  static var result;
  static var re;
  static Map<String, dynamic>? details;
  static List<dynamic>? model1;
  static List<dynamic>? model2;
  static List<dynamic>? model3;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://alaahassaneen75.mocklab.io',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future postData({
    required String? url,
    required Map<String, String> data,
  }) async {
    dio!.options.headers = {
      "Accept": "json",
      "Content-Type": "application/json",
    };
    return await dio!
        .post(
      url!,
      data: data,
    )
        .then((value) {
      result = value;
    }).catchError((Error) {
      print('${Error} kkkkkkkkkkk');
    });
  }

  static Future postForgetPassword() async {
    dio!.options.headers = {
      "Accept": "json",
      "Content-Type": "application/json",
    };
    return await dio!.post(
      AppConstant.reset,
      data: {"email": "abc@gmail.com"},
    ).then((value) {
      re = value;
      print('${result}fffffffffffffffff');
    }).catchError((Error) {
      print('${Error} kkkkkkkkkkk');
    });
  }

  static Future Gethome() async {
    dio!.options.headers = {
      "Accept": "json",
      "Content-Type": "application/json",
    };
    return await dio!
        .get("https://alaahassaneen75.wiremockapi.cloud/home")
        .then((value) {
      model1 = value.data['data']['banners'];
      model2 = value.data['data']['services'];
      model3 = value.data['data']['stores'];
    }).catchError((Error) {
      print('${Error} fe homee');
    });
  }

  static Future Getdetails() async {
    dio!.options.headers = {
      "Accept": "json",
      "Content-Type": "application/json",
    };
    return await dio!
        .get("https://alaahassaneen75.wiremockapi.cloud/storeDetails/1")
        .then((value) {
      details = value.data;
    }).catchError((Error) {
      print('${Error} fe homee');
    });
  }
}
