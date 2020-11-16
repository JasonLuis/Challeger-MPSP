import 'package:dio/dio.dart';
import 'package:mpsp/models/news_model.dart';
import 'package:mpsp/service/service_config.dart';

class NewsService {
  static final String _endpoint =
      "https://5f8c4b26c7aadb001605e19c.mockapi.io/";

  static final String _resource = 'news';

  final ServiceConfig service = new ServiceConfig(_endpoint);

  Future<List<NewsModel>> findAll() async {
    await Future.delayed(Duration(seconds: 2));
    List<NewsModel> list = new List<NewsModel>();
    try {
      Response response = await service.create().get(_resource);
      if (response.statusCode == 200) {
        response.data.forEach(
          (value) {
            print(value);
            list.add(
              NewsModel.fromMap(value),
            );
          },
        );
      }
    } catch (error) {
      print("Service Error: $error ");
      throw error;
    }
    return list;
  }
}
