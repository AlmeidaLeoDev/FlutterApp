import 'dart:math';
import 'package:flutter_test/flutter_test.dart';

bool isPrime(int num) {
  if (num < 2) {
    return false;
  }
  if (num == 2) {
    return true;
  } // 2 é o único número par que é primo
  if (num % 2 == 0) {
    return false;
  }

  // Se um número num tem um divisor maior que sua raiz quadrada, então ele já teria sido encontrado antes como um divisor menor.
  for (int i = 3; i <= sqrt(num).toInt(); i += 2) {
    // Se num for divisível por i, retorna false, pois encontrou um divisor além de 1 e num
    if (num % i == 0) return false;
  }

  return true;
}

int sumOfDigits(int num) {
  if (num < 0) {
    throw ArgumentError('Número negativo não permitido.');
  }

  int soma = 0;
  while (num > 0) {
    // quando dividimos um número por 10, o resto sempre será o último dígito.
    soma += num % 10;
    // dividir por 10 "empurra" os dígitos para a direita, descartando o último
    num ~/= 10;
  }

  return soma;
}

void main() {
  group('Testes de Número primo', () {
    test('Número primo 7', () {
      expect(isPrime(7), isTrue);
    });
    test('Número não primo 10', () {
      expect(isPrime(10), isFalse);
    });
  });

  group('Testes de Soma dos dígitos', () {
    test('Soma dos dígitos de 123', () {
      expect(sumOfDigits(123), equals(6));
    });
    test('Soma dos dígitos de -1', () {
      expect(() => sumOfDigits(-1), throwsArgumentError);
    });
  });
}
