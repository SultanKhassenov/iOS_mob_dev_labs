import 'dart:math';
import 'dart:io';


double? divide(double a, double b) {
  if (b == 0) {
    print('Ошибка: деление на ноль');
    return null;
  }
  return a / b;
}

double power(double base, double exponent) {
  return pow(base, exponent).toDouble();
}

void calculate() {
  stdout.write('Введите число: ');
  var num1 = double.tryParse(stdin.readLineSync() ?? '');
  if (num1 == null) {
    print('Ошибка: введено некорректное число');
    return;
  }
  
  stdout.write('Введите оператор (+, -, *, /, ^): ');
  var op = stdin.readLineSync();
  if (op == null) {
    print('Ошибка: введен некорректный оператор');
    return;
  }

  stdout.write('Введите число второе: ');
  var num2 = double.tryParse(stdin.readLineSync() ?? '');
  if (num2 == null) {
    print('Ошибка: введено некорректное число');
    return;
  }

  double? result;
  switch (op) {
    case '+':
      result = num1 + num2;
      break;
    case '-':
      result = num1 - num2;
      break;
    case '*':
      result = num1 * num2;
      break;
    case '/':
      result = divide(num1, num2);
      break;
    case '^':
      result = power(num1, num2);
      break;
    default:
      print('Ошибка: некорректный оператор');
  }

  if (result != null) {
    print('Результат: $result');
  }
}

void main() {
  calculate();
}
