import 'package:dartz/dartz.dart';
import 'package:moviesapp/core/baseUseCase/base_use_case.dart';
import '../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../repository/base_movies_repository.dart';

 class GetNowPlayingMoviesUseCases extends BaseUseCase <List<Movie>,NoParameters> {
 final BaseMoviesRepository baseMoviesRepository ;

 GetNowPlayingMoviesUseCases(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters noParameters) async{
   return await baseMoviesRepository.getNowPlayingMovies();
  }

 }





