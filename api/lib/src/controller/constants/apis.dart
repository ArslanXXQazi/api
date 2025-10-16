
class AppApis {

  //base url
  static final String baseUrl = "https://dummyjson.com/";


  //all users
  static final String getAllUser='users/';

  //end points

  static String getUserEndPoint (int userId)
  {
    return "users/$userId";
  }


}