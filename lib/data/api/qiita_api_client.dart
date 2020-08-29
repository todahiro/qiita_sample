import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:qiita_sample/data/entities/qiita_info.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'qiita_api_client.g.dart';

@RestApi(baseUrl: "https://qiita.com/api/v2")
abstract class QiitaApiClient {
  factory QiitaApiClient(Dio dio, {String baseUrl}) = _QiitaApiClient;

  static QiitaApiClient create() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    return QiitaApiClient(dio);
  }

  @GET("/tags/flutter/items?per_page=50")
  Future<List<QiitaInfo>> getFlutterArticles();
}