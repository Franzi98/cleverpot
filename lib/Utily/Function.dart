class FunctionHelper {
  static String selectFolder(String title) {
    if (title == 'Umidità') {
      return 'Humidity';
    } else if (title == 'Luminosità') {
      return 'Brightness';
    } else if (title == 'Serbatoio') {
      return 'Water';
    } else {
      return 'error';
    }
  }
}
