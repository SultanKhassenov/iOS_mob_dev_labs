import 'dart:io';

class BankAccount {
  static List<String> allAccountNumbers = [];

  String accountNumber;
  String accountOwner;
  double balance;

  BankAccount(this.accountNumber, this.accountOwner, this.balance) {
    if (allAccountNumbers.contains(accountNumber)) {
      print('Ошибка: Номер счета должен быть уникальным.');
      return;
    }
    allAccountNumbers.add(accountNumber);
  }

  void deposit(double amount) {
    if (amount <= 0) {
      print('Ошибка: Введите положительное число.');
      return;
    }
    balance += amount;
    print('Депозит на сумму $amount успешно проведен.');
  }

  void withdraw(double amount) {
    if (amount <= 0) {
      print('Ошибка: Введите положительное число.');
      return;
    }
    if (balance < amount) {
      print('Ошибка: Недостаточно средств на счете.');
      return;
    }
    balance -= amount;
    print('Снятие на сумму $amount успешно проведено.');
  }

  double getBalance() {
    return balance;
  }

  void displayAccountInfo() {
    print('Информация о счете:');
    print('Номер счета: $accountNumber');
    print('Владелец счета: $accountOwner');
    print('Текущий баланс: $balance');
  }
}


void main() {
  while (true) {
    stdout.write('Введите номер счета: ');
    String accountNumber = stdin.readLineSync() ?? '';
    
    if (BankAccount.allAccountNumbers.contains(accountNumber)) {
      print('Ошибка: Данный номер счета уже существует.');
      continue;
    }

    stdout.write('Введите владельца счета: ');
    String accountOwner = stdin.readLineSync() ?? '';

    stdout.write('Введите начальный баланс: ');
    double initialBalance = double.tryParse(stdin.readLineSync() ?? '') ?? 0.0;

    BankAccount myAccount = BankAccount(accountNumber, accountOwner, initialBalance);

    while (true) {
      print('\nВыберите следующее действие:');
      print('1. Депозит');
      print('2. Снять сумму с счета');
      print('3. Посмотреть информацию о счете');
      print('4. Создать новый счет');
      print('5. Выйти');

      stdout.write('Ваш выбор: ');
      String choice = stdin.readLineSync()?.trim() ?? '';
      
      switch (choice) {
        case '1':
          stdout.write('Введите сумму для депозита: ');
          double depositAmount = double.tryParse(stdin.readLineSync() ?? '') ?? 0.0;
          myAccount.deposit(depositAmount);
          break;
        case '2':
          stdout.write('Введите сумму для снятия: ');
          double withdrawAmount = double.tryParse(stdin.readLineSync() ?? '') ?? 0.0;
          myAccount.withdraw(withdrawAmount);
          break;
        case '3':
          myAccount.displayAccountInfo();
          break;
        case '4':
          break;
        case '5':
          print('Программа завершена.');
          return;
        default:
          print('Ошибка: Некорректный выбор. Пожалуйста, выберите один из предложенных пунктов.');
      }
      
      if (choice == '4' || choice == '5') {
        break;
      }
    }
  }
}