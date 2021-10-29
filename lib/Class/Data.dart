abstract class Data {
  String humidity;
  String water;
  String brightness;

  Data({required this.brightness, required this.water, required this.humidity});

  String getWater() {
    return this.water;
  }

  String getHumidity() {
    return this.humidity;
  }

  String getBrightness() {
    return this.brightness;
  }

  void setWater(String value) {
    this.water = value;
  }

  void setBrightness(String value) {
    this.brightness = value;
  }

  void setHumidity(String value) {
    this.humidity = value;
  }
}
