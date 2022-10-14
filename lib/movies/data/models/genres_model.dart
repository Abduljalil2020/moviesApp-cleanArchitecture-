
import '../../domain/entities/genres.dart';

class GenresModel extends Genres{
  GenresModel({
    required super.name,
    required super.id
  });
  factory GenresModel.fromJson ( Map < String , dynamic > json ) => GenresModel (
  id : json ["id"] ,
  name : json ["name"] ,
  ) ;
}