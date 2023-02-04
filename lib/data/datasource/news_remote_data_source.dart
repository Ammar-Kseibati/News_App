import 'package:dio/dio.dart';
import 'package:news_app/core/error/exceptios.dart';
import 'package:news_app/core/network/error_message_model.dart';
import 'package:news_app/core/utils/api_constance.dart';
import 'package:news_app/data/models/new_model.dart';

abstract class BaseNewsRemoteDataSource {
  Future<List<NewsModel>> getAppleArticles();
  Future<List<NewsModel>> getBuisnessArticles();
  Future<List<NewsModel>> getTeslaArticles();
  Future<List<NewsModel>> getWallStreetArticles();
}

class NewsRemoteDataSource extends BaseNewsRemoteDataSource {
  @override
  Future<List<NewsModel>> getAppleArticles() async {
    final response = await Dio().get(ApiConstance.appleArticlesPath,
        options: Options(
          validateStatus: (_) => true,
        ));
    if (response.statusCode == 200) {
      return List<NewsModel>.from((response.data["articles"] as List)
          .map((e) => NewsModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.formJson(response.data));
    }
  }

  @override
  Future<List<NewsModel>> getBuisnessArticles() async {
    final response = await Dio().get(ApiConstance.buisnessArticlesPath,
        options: Options(
          validateStatus: (_) => true,
        ));

    if (response.statusCode == 200) {
      return List<NewsModel>.from((response.data["articles"] as List)
          .map((e) => NewsModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.formJson(response.data));
    }
  }

  @override
  Future<List<NewsModel>> getTeslaArticles() async {
    final response = await Dio().get(ApiConstance.teslaArticlesPath(),
        options: Options(
          validateStatus: (_) => true,
        ));
    if (response.statusCode == 200) {
      return List<NewsModel>.from((response.data["articles"] as List)
          .map((e) => NewsModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.formJson(response.data));
    }
  }

  @override
  Future<List<NewsModel>> getWallStreetArticles() async {
    final response = await Dio().get(ApiConstance.wallStreetArticlesPath,
        options: Options(
          validateStatus: (_) => true,
        ));

    if (response.statusCode == 200) {
      return List<NewsModel>.from((response.data["articles"] as List)
          .map((e) => NewsModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.formJson(response.data));
    }
  }
}
