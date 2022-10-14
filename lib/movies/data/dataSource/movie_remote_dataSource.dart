import 'package:dio/dio.dart';
import 'package:moviesapp/core/utils/constant.dart';
import 'package:moviesapp/movies/data/models/movie_details-model.dart';
import 'package:moviesapp/movies/data/models/movie_model.dart';
import 'package:moviesapp/movies/data/models/recommendation_model.dart';
import 'package:moviesapp/movies/domain/usecases/get_movies_details_useCases.dart';
import 'package:moviesapp/movies/domain/usecases/get_recommendation_use_case.dart';

import '../../../core/error/exeption.dart';
import '../../../core/network/error_messages_model.dart';
//contract
abstract class BaseMovieRemoteDataSource{
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters);
  Future<List<RecommendationModel>> getRecommendation(RecommendationParameters parameters);


}


class MovieRemoteDataSource extends BaseMovieRemoteDataSource{
  @override
 Future<List<MovieModel>> getNowPlayingMovies()async{

 final response = await
 Dio().get(ApiConstance.nowPlayingMoviesPath);
 print(response.statusCode);
// print(response.data["results"].toString());
         if(response.statusCode==200){
  return List<MovieModel>.from((response.data["results"]as List).map((e)

  => MovieModel.fromJson(e)


  ));
         }else {
           throw ServerException (
               errorMessageModel : ErrorMessageModel . fromJson ( response.data )
           ) ;
         }
      }

  @override
  Future<List<MovieModel>> getPopularMovies()async {
   final response = await
   Dio().get(ApiConstance.popularMoviesPath);
   if(response.statusCode==200){
     return List<MovieModel>.from((response.data["results"]as List).map((e)
     => MovieModel.fromJson(e)
     ));
   }else {
     throw ServerException (
         errorMessageModel : ErrorMessageModel . fromJson ( response.data )
     ) ; // ServerException
   }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async{
    final response = await
    Dio().get(ApiConstance.topRatedMoviesPath);
    if(response.statusCode==200){
      return List<MovieModel>.from((response.data["results"]as List).map((e)
      => MovieModel.fromJson(e)
      ));
    }else {
      throw ServerException (
          errorMessageModel : ErrorMessageModel . fromJson ( response.data )
      ) ; // ServerException
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters)
  async{
    final response = await Dio().get(ApiConstance.movieDetailsPath(parameters.movieId));
    if(response.statusCode==200){
      return MovieDetailsModel.fromJson(response.data);
    }else {
      throw ServerException (
          errorMessageModel : ErrorMessageModel . fromJson ( response.data )
      ) ; // ServerException
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendation(RecommendationParameters parameters)
  async{
    final response = await
    Dio().get(ApiConstance.recommendationsPath(parameters.id));
    if(response.statusCode==200){
      return List<RecommendationModel>.from((response.data["results"]as List).map((e)
      => RecommendationModel.fromJson(e)
      ));
    }else {
      throw ServerException (
          errorMessageModel : ErrorMessageModel . fromJson ( response.data )
      ) ; // ServerException
    }
  }




}