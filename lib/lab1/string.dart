import 'dart:io';

void combineStrings() {
  stdout.write("Введите первую строку:\n");
  String firstLine = stdin.readLineSync()!;
  
  stdout.write("Введите вторую строку:\n");
  String secondLine = stdin.readLineSync()!;
  
  String combinedString = firstLine.trim() + secondLine.trim();
  print("Результат объединения: $combinedString");
}

void reverseString() {
  stdout.write("Введите строку переворота:\n");
  String inputString = stdin.readLineSync()!;
  
  String reversedString = inputString.split('').reversed.join();
  print("Результат переворота: $reversedString");
}

void countCharacters() {
  stdout.write("Введите строку для подсчета символов:\n");
  String inputString = stdin.readLineSync()!;
  
  int characterCount = inputString.replaceAll(' ', '').length;
  print("Количество символов (без пробелов): $characterCount");
}

void searchSubstring() {
  stdout.write("Введите строку:\n");
  String inputString = stdin.readLineSync()!;
  
  stdout.write("Введите подстроку поиска:\n");
  String substring = stdin.readLineSync()!;
  
  int index = inputString.indexOf(substring);
  if (index != -1) {
    print("Первое вхождение подстроки \"$substring\" на позиции: $index");
  } else {
    print("Подстрока не найдена");
  }
}

void chooseTask() {
  print("Выберите задачу:");
  print("1. Объединение строк");
  print("2. Переворот строки");
  print("3. Подсчет символов");
  print("4. Поиск подстроки");
  
  String? choice = stdin.readLineSync();
  if (choice == null) {
    print("Ошибка: введено некорректное значение");
    return;
  }
  
  switch (choice) {
    case '1':
      combineStrings();
      break;
    case '2':
      reverseString();
      break;
    case '3':
      countCharacters();
      break;
    case '4':
      searchSubstring();
      break;
    default:
      print("Ошибка: некорректный выбор");
  }
}

// Запуск программы
void main() {
  chooseTask();
}
