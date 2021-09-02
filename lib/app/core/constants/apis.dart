class Apis {
  /// Base url to web service
  static String baseUrl = "https://rickandmortyapi.com/api";
  static String giphyUrl = "https://api.giphy.com/v1/gifs/search?lang=pt";

  /// API Key
  static String giphyKey = "wusbFwUExpkztfjeMr3QRimPUc4kd1J9";

  /// Cache duration
  static Duration cacheDuration = Duration(days: 7);
  
  /// Header for access
  static Map<String, dynamic> headers = {};

  /// Relative path to API's
  static String characters = "/character/";
  static String locations = "/location/";
  static String episodes = "/episode/";
}
