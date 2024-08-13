class ImageFile {
  static ImageFile? _instance;
  static ImageFile get instance => _instance ??= ImageFile._init();
  ImageFile._init();

  String toImage(String name) => 'assets/images/$name.png';
}

class ImageConstant {
  static const String icon = "icon";
}