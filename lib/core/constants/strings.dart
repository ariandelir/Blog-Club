class AppStrings {
  // -------------------------------------------------------------------
  // 1. Article Strings
  // -------------------------------------------------------------------
  static const String articleLikesCount = '2.1k';
  static const String articleAppbarTitle = 'Article';
  static const String articleUsername = 'Melina Gervain';
  static const String articlePostingTime = '2m ago';
  static const String articleTitle = 'Four Things Every Woman Needs To Know';
  static const String articleBodyTitle =
      'A man’s sexuality is never your mind responsibility';
  static const String articleCaption =
      'This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.';

  // -------------------------------------------------------------------
  // 2. Home Page Strings
  // -------------------------------------------------------------------
  static const String homeTopAppbarTitle = 'Hi, Arian!';
  static const String homeAppbarTitle = 'Explore today’s';
  static const String homeLatestNewsTitle = 'Latest News';
  static const String homeMoreTitle = 'More';

  // -------------------------------------------------------------------
  // 3. Search Page
  // -------------------------------------------------------------------
  static const String searchAppbarTitle = 'Search';

  // -------------------------------------------------------------------
  // 4. Profile Page
  // -------------------------------------------------------------------
  static const String profileTitle = 'Profile';
  static const String profileId = '@jasminepaolini';
  static const String profileUsername = 'Jasmine Paolini';
  static const String profileCareerPath = 'UI/UX Designer';
  static const String profileAboutTitle = 'About me';
  static const String profileDescription =
      'Jasmine is a director of user experience design, with experience managing global teams.';
  static const String profilePostCount = '52';
  static const String profilePostTitle = 'Post';
  static const String profileFollowingCount = '250';
  static const String profileFollowingTitle = 'Following';
  static const String profileFollowersCount = '4.5K';
  static const String profileFollowersTitle = 'Followers';
  static const String profilePostsTitle = 'My Posts';

  // -------------------------------------------------------------------
  // 5. Authentication (Login / Signup)
  // -------------------------------------------------------------------
  // Login
  static const String authLoginTitle = 'Login';
  static const String authLoginWelcomeTitle = 'Welcome back';
  static const String authLoginHintTitle = 'Sign in with your account';
  static const String authLoginUsername = 'Username';
  static const String authLoginForgotPassword = 'Forgot your password?';
  static const String authLoginResetPassword = 'Reset here';
  static const String authLoginGoogleMethod = 'OR SIGN IN WITH';

  // Signup
  static const String authSignupTitle = 'Sign up';
  static const String authSignupWelcomeTitle = 'Welcome to blog club';
  static const String authSignupHintTitle = 'please enter your information';
  static const String authSignupFullname = 'Fullname';
  static const String authSignupUsername = 'Username';
  static const String authSignupGoogleMethod = 'OR SIGN UP WITH';
  static const String authPassword = 'Password';
  static const String authShowPassword = 'Show';
  static const String authHidePassword = 'Hide';

  // -------------------------------------------------------------------
  // 6. Bottom Navigation
  // -------------------------------------------------------------------
  static const String bottomNavigationHome = 'Home';
  static const String bottomNavigationArticle = 'Article';
  static const String bottomNavigationSearch = 'Search';
  static const String bottomNavigationMenu = 'Menu';

  // -------------------------------------------------------------------
  // 7. Icon Paths
  // -------------------------------------------------------------------
  static const String homeIconFilePath = 'home.png';
  static const String homeActiveIconFilePath = 'home_active.png';
  static const String articleIconFilePath = 'articles.png';
  static const String articleActiveIconFilePath = 'articles_active.png';
  static const String searchIconFilePath = 'search.png';
  static const String searchActiveIconFilePath = 'search_active.png';
  static const String menuIconFilePath = 'menu.png';
  static const String menuActiveIconFilePath = 'menu_active.png';

  static const String iconBasePath = 'assets/images/icons/';

  static String icon(String fileName) {
    return '$iconBasePath$fileName';
  }

  static String iconPath(String active, String normal, bool isActive) {
    return '$iconBasePath${isActive ? active : normal}';
  }

  // -------------------------------------------------------------------
  // 8. Post Image Paths
  // -------------------------------------------------------------------
  static const String _basePath = 'assets/images/posts/large/';

  static String postImage(String fileName) {
    return '$_basePath$fileName';
  }

  static const String smallPostBasePath = 'assets/images/posts/small/';

  static String smallPostImage(String fileName) {
    return '$smallPostBasePath$fileName';
  }

  // -------------------------------------------------------------------
  // 9. Story Images
  // -------------------------------------------------------------------
  static const String storyBasePath = 'assets/images/stories/';

  static String storyImage(String fileName) {
    return '$storyBasePath$fileName';
  }
}
