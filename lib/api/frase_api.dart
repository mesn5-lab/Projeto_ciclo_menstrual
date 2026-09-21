import 'package:dio/dio.dart';

class FraseApi {
  final dio = Dio();

  buscarFrase() async {
    final response = await dio.get(
      'https://api.adviceslip.com/advice',
    );

    return response.data['slip']['advice'];
  }
}
