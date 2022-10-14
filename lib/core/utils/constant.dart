

class ApiConstance {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = 'a3ff55a41ead083d4b60a06994694a1f';

 static const String nowPlayingMoviesPath="$baseUrl/movie/now_playing?api_key=$apiKey";

  static const String topRatedMoviesPath="$baseUrl/movie/top_rated?api_key=$apiKey";

  static const String popularMoviesPath="$baseUrl/movie/popular?api_key=$apiKey";

  static String movieDetailsPath(int movieId)=> "$baseUrl/movie/$movieId?api_key=$apiKey";

  static String recommendationsPath(int movieId)=> "$baseUrl/movie/$movieId/recommendations?api_key=$apiKey";


  // https://api.themoviedb.org/3/movie/{movie_id}/recommendations?api_key=<<api_key>>&language=en-US&page=1
  //
  static const String baseImageUrl='https://image.tmdb.org/t/p/w500';

  static String imageUrl ( String path ) =>'$baseImageUrl$path';


}


//https://api.themoviedb.org/3/
// movie/now_playing?
// api_key=a3ff55a41ead083d4b60a06994694a1f&language=en-US&page=1