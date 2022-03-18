class BaseAPI {
  //base
  static const String baseUrl = "http://test20.internative.net/";

  //auth
  static const String signUp = baseUrl + 'Login/SignUp';
  static const String signin = baseUrl + 'Login/SignIn';

  //get
  static const String getUserAccount = baseUrl + 'Account/Get';
  static const String getBlogs = baseUrl + 'Blog/GetBlogs';
  static const String getCategories = baseUrl + 'Blog/GetCategories';

  //post
  static const String updateUserData = baseUrl + 'Account/Update';
  static const String favoriteBlog = baseUrl + 'Blog/ToggleFavorite';
  static const String uploadImage = baseUrl + 'General/UploadImage';
}
