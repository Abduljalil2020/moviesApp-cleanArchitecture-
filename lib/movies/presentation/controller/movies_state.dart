import 'package:equatable/equatable.dart';
import 'package:moviesapp/movies/domain/entities/movie.dart';

import '../../../core/utils/enums.dart';

class MoviesStates extends Equatable{

  final List<Movie> nowPlayingMovies;
  final RequestStates nowPlayingStates;
  final String nowPlayingMessage;
//     
  final List<Movie> PopularMovies;
  final RequestStates PopularStates;
  final String PopularMessage;
//
  final List<Movie> topRatedMovies;
  final RequestStates topRatedStates;
  final String topRatedMessage;

  const  MoviesStates({
    this.nowPlayingMovies= const [],
    this.nowPlayingStates= RequestStates.isLoading ,
    this.nowPlayingMessage ='ياحلاوة',
    ///popular
  this.PopularMovies= const [],
  this.PopularStates= RequestStates.isLoading ,
  this.PopularMessage ='ياحلاوةpopular'
,
  this.topRatedMovies= const [],
  this.topRatedStates= RequestStates.isLoading ,
  this.topRatedMessage ='ياحلاوةtopRated'

});
  //named constructor
 MoviesStates copyWith
     ({
     List<Movie> ?nowPlayingMovies,
     RequestStates? NowPlayingStates,
     String? nowPlayingMessage,
    ///
     List<Movie>? PopularMovies,
     RequestStates? PopularStates,
     String? PopularMessage,
   ///
    List<Movie>? topRatedMovies,
    RequestStates? topRatedStates,
    String? topRatedMessage,

 })
{
    return MoviesStates(
           nowPlayingMovies: nowPlayingMovies?? this.nowPlayingMovies,
           nowPlayingMessage:  nowPlayingMessage?? this.nowPlayingMessage,
           nowPlayingStates: NowPlayingStates?? this.nowPlayingStates,
           ///
           PopularMessage: PopularMessage?? this.PopularMessage,
           PopularMovies:  PopularMovies?? this.PopularMovies,
           PopularStates: PopularStates?? this.PopularStates,
          ///
          topRatedMessage: topRatedMessage?? this.topRatedMessage,
          topRatedMovies:  topRatedMovies?? this.topRatedMovies,
          topRatedStates: topRatedStates?? this.topRatedStates

    );
}
  @override

  List<Object?> get props => [
    nowPlayingMovies,nowPlayingStates,nowPlayingMessage
    ,PopularMessage,PopularMovies,PopularStates,
    topRatedMessage,topRatedMovies,topRatedStates
  ];

}