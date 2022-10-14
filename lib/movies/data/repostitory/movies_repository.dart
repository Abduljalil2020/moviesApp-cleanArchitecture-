import 'package:dartz/dartz.dart';
import 'package:moviesapp/core/error/exeption.dart';
import 'package:moviesapp/core/error/failure.dart';
import 'package:moviesapp/movies/data/dataSource/movie_remote_dataSource.dart';
import 'package:moviesapp/movies/domain/entities/movie.dart';
import 'package:moviesapp/movies/domain/entities/movies_details.dart';
import 'package:moviesapp/movies/domain/entities/recommendation.dart';
import 'package:moviesapp/movies/domain/repository/base_movies_repository.dart';
import 'package:moviesapp/movies/domain/usecases/get_recommendation_use_case.dart';

import '../../domain/usecases/get_movies_details_useCases.dart';

class MoviesRepository extends BaseMoviesRepository{
   final   BaseMovieRemoteDataSource baseMovieRemoteDataSource;
  MoviesRepository(
    this.baseMovieRemoteDataSource
  );


  @override
  Future<Either<Failure,List<Movie>>> getNowPlayingMovies() async{
    final result = await baseMovieRemoteDataSource.getNowPlayingMovies();

    try{
      return Right(result);
    } on ServerException  catch (failure) {
      return Left(ServerFailurel(failure.errorMessageModel.statusMessage));
    }

  }


   @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
     final result = await baseMovieRemoteDataSource.getPopularMovies();

     try{
       return Right(result);
     } on ServerException  catch (failure) {
       return Left(ServerFailurel(failure.errorMessageModel.statusMessage));
     }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await baseMovieRemoteDataSource.getTopRatedMovies();

    try{
      return Right(result);
    } on ServerException  catch (failure) {
      return Left(ServerFailurel(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetail>>
  getMoviesDetails(MovieDetailsParameters parameters)async {
    final result = await baseMovieRemoteDataSource.getMovieDetails(parameters);

    try{
      return Right(result);
    } on ServerException  catch (failure) {
      return Left(ServerFailurel(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>>
  getRecommendation(RecommendationParameters parameters) async{
    final result = await baseMovieRemoteDataSource.getRecommendation(parameters);

    try{
      return Right(result);
    } on ServerException  catch (failure) {
      return Left(ServerFailurel(failure.errorMessageModel.statusMessage));
    }
  }

}