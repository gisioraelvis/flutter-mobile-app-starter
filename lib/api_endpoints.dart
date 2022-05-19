class APIEndPoints {
  static const String liveBaseURL = "https://remote-ur/api/v1";
  static const String localBaseURL = "http://10.0.2.2:4000/api/v1";

  static const String baseURL = liveBaseURL;
  static const String signIn = baseURL + "/signin";
  static const String signup = baseURL + "/signup";
  static const String profile = baseURL + "/profile";
}
