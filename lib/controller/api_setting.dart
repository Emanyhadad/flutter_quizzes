class ApiSetting {
  static String BASE_URL = 'https://studentucas.awamr.com/api';
  static String getAllOrders = '$BASE_URL/all/works';
  static String postRegester = '$BASE_URL/auth/register/user';
  static String postLogin = 'https://studentucas.awamr.com/api/auth/login/user';





  static String BASE_URL1 = "http://demo-api.mr-dev.tech/api/students/auth/";
  static String register = "${BASE_URL1}register";
  static String login = "${BASE_URL1}login";
  static String reset = "${BASE_URL1}reset-password";
  static String forget = "${BASE_URL1}forget-password";

  static String BASE_URL2 = "http://rrrstore103.com/api/";
  static String get_all_product = "${BASE_URL2}products/get_all_products";
  static String get_product_details = "${BASE_URL2}products/get_product/{id}";

}
