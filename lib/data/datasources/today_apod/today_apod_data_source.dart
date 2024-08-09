import 'package:astronomy_picture/data/models/apod_model.dart';

abstract class TodayApodDataSource {
  ///Return a [ApodModel] data case is a success, otherwise
  ///throw a [Failure]
  Future<ApodModel> fetchTodayApod();
}
