class Urls {
  static const String _baseUrl = "https://ecommerce-api.codesilicon.com/api";
  static const String sliderListUrl = "$_baseUrl/ListProductSlider";
  static const String categoryListUrl = "$_baseUrl/CategoryList";
  static const String readProfileUrl = "$_baseUrl/ReadProfile";
  static const String addToCartUrl = "$_baseUrl/CreateCartList";
  static const String createProfileUrl = "$_baseUrl/CreateProfile";
  static const String updateProfileUrl = "$_baseUrl/CreateProfile";
  static const String createProductReviewUrl = "$_baseUrl/CreateProductReview";

  static String listProductByRemarkUrl(String remark) =>
      "$_baseUrl/ListProductByRemark/$remark";

  static String listProductByCategoryUrl(int id) =>
      "$_baseUrl/ListProductByCategory/$id";

  static String productDetailsByIdUrl(int id) =>
      "$_baseUrl/ProductDetailsById/$id";

  static String verifyEmailUrl(String email) =>
      "$_baseUrl/UserLogin/$email";

  static String verifyOtpUrl(String email, String otp) =>
      "$_baseUrl/VerifyLogin/$email/$otp";

  static String listReviewByProductUrl(int id) =>
      "$_baseUrl/ListReviewByProduct/$id";
}
