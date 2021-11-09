class UserClass {
  final String imagePath;
  final String name;
  final String about;
  final bool isDarkMode;
  final String email;

  UserClass(
      {required this.imagePath,
      required this.about,
      required this.isDarkMode,
      required this.name,
      required this.email});

  String getName() {
    return this.name;
  }

  String getEmail() {
    return this.email;
  }

  String getAbout() {
    return this.about;
  }

  bool getIsDarkMode() {
    return this.isDarkMode;
  }

  String getImgPath() {
    return this.imagePath;
  }
}
