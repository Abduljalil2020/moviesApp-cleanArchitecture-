import 'package:dartz/dartz.dart';
import 'package:moviesapp/movies/domain/entities/movie.dart';
import 'package:moviesapp/movies/domain/entities/movies_details.dart';
import 'package:moviesapp/movies/domain/entities/recommendation.dart';
import 'package:moviesapp/movies/domain/usecases/get_movies_details_useCases.dart';
import 'package:moviesapp/movies/domain/usecases/get_recommendation_use_case.dart';
import '../../../core/error/failure.dart';

  abstract class BaseMoviesRepository{
  Future<Either<Failure,List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure,List<Movie>>> getPopularMovies();
  Future<Either<Failure,List<Movie>>> getTopRatedMovies();
  Future<Either<Failure,MovieDetail>> getMoviesDetails(MovieDetailsParameters parameters);
  Future<Either<Failure,List<Recommendation>>>
  getRecommendation(RecommendationParameters parameters);



}