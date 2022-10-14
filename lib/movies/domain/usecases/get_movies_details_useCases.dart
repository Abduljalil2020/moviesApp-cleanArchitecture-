import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:moviesapp/core/baseUseCase/base_use_case.dart';
import 'package:moviesapp/core/error/failure.dart';
import 'package:moviesapp/movies/domain/entities/movies_details.dart';
import 'package:moviesapp/movies/domain/repository/base_movies_repository.dart';

class GetMoviesDetailsUseCases extends BaseUseCase<MovieDetail, MovieDetailsParameters> {

  final BaseMoviesRepository baseMoviesRepository;


  GetMoviesDetailsUseCases(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MovieDetail>> call(
      MovieDetailsParameters parameters) async {
    return await baseMoviesRepository.getMoviesDetails( parameters);
  }

}

class MovieDetailsParameters extends Equatable {
  final int movieId;

  @override
  List<Object> get props => [movieId];

  MovieDetailsParameters({required this.movieId});
}