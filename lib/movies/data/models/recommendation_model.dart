import 'package:moviesapp/movies/domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation{
  RecommendationModel({ super.backdropPath, required super.id});
  factory RecommendationModel.fromJson(Map<String,dynamic>json) =>RecommendationModel(
      backdropPath: json['backdrop_path']??"dfghjklkjhg",
      id:json['id'],
  );
}

