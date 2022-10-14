import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/core/utils/enums.dart';
import 'package:moviesapp/movies/domain/entities/movies_details.dart';
import 'package:moviesapp/movies/domain/entities/recommendation.dart';
import 'package:moviesapp/movies/domain/usecases/get_movies_details_useCases.dart';
import 'package:moviesapp/movies/domain/usecases/get_recommendation_use_case.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMoviesDetailsUseCases, this.getRecommendationUseCases) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getRecommendation);
  }
final GetMoviesDetailsUseCases getMoviesDetailsUseCases;
  final GetRecommendationUseCase getRecommendationUseCases;


  FutureOr<void> _getMovieDetails(GetMovieDetailsEvent event,
      Emitter<MovieDetailsState>emit)async {
  final result= await  getMoviesDetailsUseCases(MovieDetailsParameters(movieId: event.id));
  result.fold((l) => emit(state.copyWith(movieDetailsState:RequestStates.error,
  movieDetailsMessage: l.message
  )),
              (r) => emit(state.copyWith(movieDetail: r,
                  movieDetailsState: RequestStates.isLoaded

              ),
              ));

  }




  FutureOr<void> _getRecommendation(GetMovieRecommendationEvent event,
      Emitter<MovieDetailsState> emit)async {
    final result= await  getRecommendationUseCases(RecommendationParameters(event.id));
    result.fold((l) => emit(state.copyWith(recommendationState:RequestStates.error,
        recommendationMessage: l.message
    )),
            (r) => emit(state.copyWith(recommendation: r,
            recommendationState: RequestStates.isLoaded

        ),
        ));

  }
}
