import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:learning_app_flutter/core/glitch.dart';
import 'package:learning_app_flutter/model/category_model.dart';
import 'package:learning_app_flutter/model/models.dart';
import 'package:learning_app_flutter/network/apis.dart';

class Repo {
  final api = Apis();


  Future<Either<Glitch, Category>> getRandomCatPhoto() async {
    final apiResult = await api.getCategories();
    return apiResult.fold((l) {
      // There can be many types of error, but for simplicity, we are going
      // to assume only NoInternetGlitch
      return Left(NoInternetGlitch());
    }, (r) {
      // the API returns breed, id, url, width, height, category, details, etc.,
      // but we will take only the information we need in our app and ignore
      // the rest
      // here we will decode the API result to CatPhoto
      final photo  =null;
      return Right(photo);
    });
  }
}