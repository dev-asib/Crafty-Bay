class Urls {
  static const String _baseUrl = "https://ecommerce-api.codesilicon.com/api";
  static const String sliderListUrl = "$_baseUrl/ListProductSlider";
  static const String categoryListUrl = "$_baseUrl/CategoryList";

  static String listProductByRemarkUrl(String remark) =>
      "$_baseUrl/ListProductByRemark/$remark";

  static String listProductByCategoryUrl(int id) =>
      "$_baseUrl/ListProductByCategory/$id";

  static String productDetailsByIdUrl(int id) =>
      "$_baseUrl/ProductDetailsById/$id";
}
