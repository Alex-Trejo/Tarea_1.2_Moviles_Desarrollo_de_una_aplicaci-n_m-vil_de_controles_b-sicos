List<int> generarNumerosPrimos() {
  List<int> primos = [];

  for (int numero = 3; numero <= 32767; numero++) {
    bool esPrimo = true;
    for (int divisor = 2; divisor < numero; divisor++) {
      if (numero % divisor == 0) {
        esPrimo = false;
        break;
      }
    }
    if (esPrimo) {
      primos.add(numero);
    }
  }

  return primos;
}