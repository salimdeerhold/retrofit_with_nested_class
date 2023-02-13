import 'package:dio/dio.dart';

class HttpService {
  late Dio _dio;

  final BASE_URL = "https://reqres.in";

  HttpService() {
    _dio = Dio(BaseOptions(baseUrl: BASE_URL));
    initializeInterceptors();
  }

   getResponse(String endPoint) async {
    print("get Response funct");

      print("get Response funct try");

      final response = await _dio.get(endPoint);

      print("after response");
      print(response.data);
}

  initializeInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
      onError: (error, handler) => {print(error)},
      onRequest: (request, haldler) => {
        print(request.method +" "+request.baseUrl + request.path)
      },
      onResponse: (response, handler) => {
        print(response.data.toString())
      },
    ));
  }
}
