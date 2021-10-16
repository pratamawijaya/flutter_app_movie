import 'package:bloc/bloc.dart';
import 'package:flutter_news_app_playground/domain/entities/movie.dart';
import 'package:flutter_news_app_playground/domain/usecases/get_now_playing.dart';
import 'package:flutter_news_app_playground/presentation/home/cubit/nowplaying_state.dart';
import 'package:meta/meta.dart';

class MainCubit extends Cubit<MainState> {
  final GetNowPlayingMovie _getNowPlayingMovieUseCase;

  MainCubit(this._getNowPlayingMovieUseCase) : super(MainInitial());

  Future<void> fetchNowPlaying(int page) async {
    print("get now playing cubit $page");
    emit(Loading());
    final data = await _getNowPlayingMovieUseCase.call(NowPlayingParams(page));
    print("data is left? ${data.isLeft()}");
    data.fold((l) => emit(Error("failed to get data")), (r) => process(r));
  }

  void process(List<Movie> r) {
    print("hasil length : ${r.length}");
    emit(Loaded(r));
  }
}
