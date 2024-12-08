int calcularMCD(int numero1, int numero2) {
  if (numero1 <= 0 || numero2 <= 0) {
    throw ArgumentError('Ambos números deben ser positivos.');
  }
  while (numero1 != numero2) {
    if (numero1 > numero2) {
      numero1 -= numero2;
    } else {
      numero2 -= numero1;
    }
  }
  return numero1;
}