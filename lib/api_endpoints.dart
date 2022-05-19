class APIEndPoints {
  static const String liveBaseURL = "https://anonymsg-v1.herokuapp.com/api";
  static const String localBaseURL = "http://192.168.161.118:5500";

  static const String baseURL = localBaseURL;
  static const String signIn = baseURL + "/users/signin";
  static const String signup = baseURL + "/signup";
  static const String profile = baseURL + "/profile";
}
