import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/core/baseUseCase/base_use_case.dart';
import 'package:moviesapp/core/utils/enums.dart';
import 'package:moviesapp/movies/domain/usecases/get_now_playing_movies_useCases.dart';
import 'package:moviesapp/movies/domain/usecases/get_popular-movies_useCases.dart';
import 'package:moviesapp/movies/domain/usecases/get_topRated_movies_useCases.dart';
import 'package:moviesapp/movies/presentation/controller/movies_event.dart';
import 'package:moviesapp/movies/presentation/controller/movies_state.dart';

import '../../../core/services/services_locator.dart';

class MoviesBloc extends Bloc<MoviesEvent,MoviesStates> {
  final GetNowPlayingMoviesUseCases getNowPlayingMoviesUseCases;
  final GetPopularMoviesUseCases getPopularMoviesUseCases;
  final GetTopRatedMoviesUseCases getTopRatedMoviesUseCases;


  MoviesBloc(this.getNowPlayingMoviesUseCases,
      this.getTopRatedMoviesUseCases,
      this.getPopularMoviesUseCases) : super(const MoviesStates()) {
    ///NowPlaying
    on<GetNowPlayingEvent>(_getNowPlayingMovies);

    /// get popular
    on<GetPopularEvent>(_getPopularMovies);

    /// TOP RATED
     on<GetTopRatedEvent>(_getTopRatedMovies);
  }


  FutureOr<void> _getNowPlayingMovies(GetNowPlayingEvent event,
      Emitter<MoviesStates> emit) async
      {
    final result = await getNowPlayingMoviesUseCases.call(NoParameters());
           result.fold((l) =>
        emit(MoviesStates(nowPlayingStates: RequestStates.error,
            nowPlayingMessage: l.message))
        ,
            (r) {
          emit(MoviesStates(nowPlayingStates: RequestStates.isLoaded,
              nowPlayingMovies: r

          ));
        });
  }


  FutureOr<void> _getPopularMovies(GetPopularEvent event,
      Emitter<MoviesStates> emit) async
     {
    final result = await getPopularMoviesUseCases.call(NoParameters());
    result.fold((l) =>
        emit(
            state.copyWith(
                PopularStates: RequestStates.error,
                PopularMessage: l.message))
      ,
          (r) =>
          emit(
            state.copyWith(
                PopularStates: RequestStates.isLoaded,
                PopularMovies: r
            ),
          ),);
  }


  FutureOr<void> _getTopRatedMovies(GetTopRatedEvent event,
      Emitter<MoviesStates> emit) async
     {
    final result = await getTopRatedMoviesUseCases.call(NoParameters());
    result.fold((l) =>
        emit(
            state.copyWith(
                topRatedStates: RequestStates.error,
                topRatedMessage: l.message
            ))
      ,
          (r) =>
          emit(
            state.copyWith(
                topRatedStates: RequestStates.isLoaded,
                topRatedMovies: r
            ),
          ),);
  }


}