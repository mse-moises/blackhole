class Converters{
  static double moneyStringToDouble(String string){
    if(string.isEmpty) return 0.0;
    return double.parse(string.replaceAll(',', ''));
  }
}