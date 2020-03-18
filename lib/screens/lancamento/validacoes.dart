class ValidaLancamento{
  static String categoria(String value){
    if (value.length < 3) {
      return 'A categoria deve ter mais de dois caracteres';
    }
    else{
      return null;
      }
    }
  static String valor(String value){
    if (double.tryParse(value) == null || double.tryParse(value) == 0) {
      return 'Informe um valor válido!';
    }
    else {
      return null;
    }
  }
}