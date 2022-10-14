import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:moviesapp/core/baseUseCase/base_use_case.dart';
import 'package:moviesapp/core/error/failure.dart';
import 'package:moviesapp/movies/domain/entities/recommendation.dart';
import 'package:moviesapp/movies/domain/repository/base_movies_repository.dart';

class GetRecommendationUseCase extends
BaseUseCase<List<Recommendation>,RecommendationParameters>{
  BaseMoviesRepository baseMoviesRepository;

  GetRecommendationUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Recommendation>>> call(RecommendationParameters parameters) async{
return await   baseMoviesRepository.getRecommendation(parameters);
  }
  
}
class RecommendationParameters extends Equatable{
  final int id;

  RecommendationParameters(this.id);

  @override

  List<Object?> get props => [id];


}