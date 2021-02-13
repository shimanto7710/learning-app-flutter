import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:learning_app_flutter/model/category_model.dart';

class Apis {
  final String endPoint =
      "https://parallaxlogic.dev/ekshop-merchant/api/category?category_type=product";

  final Dio _dio = Dio();

  Future<Either<Exception, Category>> getCategories() async {
    try {
      Response response = await _dio.get(endPoint);

      return Right(Category.fromJson(response.data));
    } catch (error, stacktrace) {
      return (Left(error));
      // throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}
