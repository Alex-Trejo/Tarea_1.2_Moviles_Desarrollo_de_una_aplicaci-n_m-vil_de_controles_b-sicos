double calcularFactorial(int numero) {
  if (numero < 0) {
    throw ArgumentError('No se puede calcular el factorial de un número negativo.');
  }
  double factorial = 1;
  for (int i = 1; i <= numero; i++) {
    factorial *= i;
  }
  return factorial;
}