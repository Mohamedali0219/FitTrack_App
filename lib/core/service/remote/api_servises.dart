import 'package:dio/dio.dart';
import 'package:fit_track_app/core/constants.dart';
import 'package:fit_track_app/core/service/remote/api_consumer.dart';

class ApiServises implements ApiConsumer {
  final Dio dio;

  ApiServises(
    this.dio,
  ) {
    dio.options.baseUrl = Constants.baseUrl;
  }

  @override
  Future get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) {
    final response = dio.get(path, queryParameters: queryParameters);
    return response;
  }

  @override
  Future delete(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) {
    final response = dio.delete(path, queryParameters: queryParameters);
    return response;
  }

  @override
  Future post(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
  }) {
    final response =
        dio.post(path, queryParameters: queryParameters, data: data);
    return response;
  }

  @override
  Future put(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
  }) {
    final response =
        dio.put(path, queryParameters: queryParameters, data: data);
    return response;
  }
}
