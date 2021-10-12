import 'package:flutter_news_app_playground/data/datasources/remote/model/genre_model_response.dart';
import 'package:flutter_news_app_playground/domain/entities/genre.dart';

class GenreMapper {
  Genre mapToDomain(GenreModelResponse model) {
    return Genre(model.id ?? 0, model.name ?? "");
  }

  List<Genre> mapToListDomain(List<GenreModelResponse> listModel) {
    return listModel.map<Genre>((e) => mapToDomain(e)).toList();
  }
}
