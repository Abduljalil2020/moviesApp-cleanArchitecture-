import 'package:get_it/get_it.dart';
import 'package:moviesapp/movies/data/dataSource/movie_remote_dataSource.dart';
import 'package:moviesapp/movies/data/repostitory/movies_repository.dart';
import 'package:moviesapp/movies/domain/repository/base_movies_repository.dart';
import 'package:moviesapp/movies/domain/usecases/get_movies_details_useCases.dart';
import 'package:moviesapp/movies/domain/usecases/get_now_playing_movies_useCases.dart';
import 'package:moviesapp/movies/domain/usecases/get_popular-movies_useCases.dart';
import 'package:moviesapp/movies/domain/usecases/get_recommendation_use_case.dart';
import 'package:moviesapp/movies/domain/usecases/get_topRated_movies_useCases.dart';
import 'package:moviesapp/movies/presentation/controller/movie_details_bloc.dart';
import 'package:moviesapp/movies/presentation/controller/movies_bloc.dart';
final sl = GetIt.instance;

class ServicesLocator{

  
  void init() {
    ///bloc
    sl.registerFactory(() => MoviesBloc(sl(),sl(),sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl(),sl()));

    ///Data Source
    sl.registerLazySingleton <BaseMovieRemoteDataSource> (
            ( ) =>MovieRemoteDataSource());
    ///Repository
    sl.registerLazySingleton<BaseMoviesRepository>
      ( ()=>MoviesRepository(sl()));
    ///UseCases
    sl.registerLazySingleton(()=>GetNowPlayingMoviesUseCases(sl()));
    sl.registerLazySingleton(()=>GetPopularMoviesUseCases(sl()));
    sl.registerLazySingleton(()=>GetTopRatedMoviesUseCases(sl()));
    sl.registerLazySingleton(()=>GetMoviesDetailsUseCases(sl()));
    sl.registerLazySingleton(()=>GetRecommendationUseCase(sl()));
  }

}


