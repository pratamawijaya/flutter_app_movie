import 'package:bloc/bloc.dart';
import 'package:flutter_news_app_playground/core/usecase/usecase.dart';
import 'package:flutter_news_app_playground/domain/entities/movie.dart';
import 'package:flutter_news_app_playground/domain/usecases/get_now_playing.dart';
import 'package:meta/meta.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  final GetNowPlayingMovie _getNowPlayingMovieUseCase;

  MainCubit(this._getNowPlayingMovieUseCase) : super(MainInitial());

  Future<void> getNowPlaying() async {
    emit(Loading());
    final data = await _getNowPlayingMovieUseCase.call(NoParams());
    data.fold((l) => emit(Error("failed to get data")), (r) => Loaded(r));
  }
}
