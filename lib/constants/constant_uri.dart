abstract class ConstantUri{
  static String baseUri = "https://learn-api.cambofreelance.com";
  static String loginPath = "$baseUri/api/oauth/token";
  static String registerPath = "$baseUri/api/oauth/register";
  static String refreshTokenPath = "$baseUri/api/oauth/refresh";
  static String adminCategoryListPath = "$baseUri/api/app/product/category/list";
  static String adminCategoryCreatePath = "$baseUri/api/app/product/category/create";
  static String adminCategoryGetByIdPath = "$baseUri/api/app/product/category/";
  static String adminCategoryUpdatePath = "$baseUri/api/app/product/category/update";
  static String adminCategoryDeletePath = "$baseUri/api/app/product/category/delete";
}