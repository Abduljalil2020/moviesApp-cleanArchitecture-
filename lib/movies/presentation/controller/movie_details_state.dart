part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {

  const MovieDetailsState({
    this.recommendation = const [],
    this.recommendationState = RequestStates.isLoading,
    this.recommendationMessage = "",
    this.movieDetail,
    this.movieDetailsState = RequestStates.isLoading,
    this.movieDetailsMessage = "",
  });

  final MovieDetail? movieDetail;
  final RequestStates movieDetailsState;
  final String movieDetailsMessage;

  final List<Recommendation>? recommendation;
  final RequestStates recommendationState;
  final String recommendationMessage;

  MovieDetailsState copyWith({
    MovieDetail? movieDetail,
    RequestStates? movieDetailsState,
    String? movieDetailsMessage,

    ///Recommendation
    List<Recommendation>? recommendation,
    RequestStates? recommendationState,
    String? recommendationMessage,

  }) {
    return MovieDetailsState(
        movieDetail: movieDetail ?? this.movieDetail,
        movieDetailsState: movieDetailsState ?? this.movieDetailsState,
        movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,

        ///
        recommendation: recommendation ?? this.recommendation,
        recommendationState: recommendationState ?? this.recommendationState,
        recommendationMessage: recommendationMessage ?? this.movieDetailsMessage

    );
  }

  @override
  List<Object?> get props =>
      [
        movieDetail,
        movieDetailsState,
        movieDetailsMessage,
        recommendation,
        recommendationState,
        recommendationMessage,
      ];


}

