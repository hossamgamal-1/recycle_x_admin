class AppConstants {
  static const String baseUrl = 'https://firestore.googleapis.com/v1/';
  static const String projectId = 'recycle-x-f5ab2';
  static const String collection = 'users';
  //id is between curly bracets to match retrofit api package
  static const String getEndPoint =
      'projects/$projectId/databases/(default)/documents/$collection/{id}';
  static const String id = 'wyOb1sDoWffJLPYHTRVy';
  static const String webAPIKey = 'AIzaSyBA6jmXMx8s_ObkkT-oMb1hdV5AYHaUbXI';
  static const String updateEndPoint =
      'projects/$projectId/databases/(default)/documents/$collection/{id}?key=$webAPIKey';
}
