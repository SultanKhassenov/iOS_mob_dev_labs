import 'dart:io';

class Student {
  static List<int> allIds = [];

  int id;
  String firstName;
  String lastName;
  double averageGrade;

  Student(this.id, this.firstName, this.lastName, this.averageGrade) {
    allIds.add(id);
  }

  void displayInfo() {
    print('ID: $id');
    print('Имя: $firstName');
    print('Фамилия: $lastName');
    print('Средний балл: $averageGrade');
  }
}

class StudentJournal {
  List<Student> students = [];

  void addStudent(int id, String firstName, String lastName, double averageGrade) {
    students.add(Student(id, firstName, lastName, averageGrade));
  }

  bool removeStudent(int idToRemove) {
  for (int i = 0; i < students.length; i++) {
    if (students[i].id == idToRemove) {
      students.removeAt(i);
      return true;
    }
  }
  return false;
}


  void displayAllStudents() {
    print('----------------------');
    for (var student in students) {
      student.displayInfo();
      print('----------------------');
    }
  }

  double calculateAverageGrade() {
    if (students.isEmpty) {
      return 0.0;
    }
    var totalGrade = students.fold(0.0, (sum, student) => sum + student.averageGrade);
    return totalGrade / students.length;
  }

  Student? findStudentWithHighestGrade() {
  if (students.isEmpty) {
    print('Журнал студентов пуст.');
    return null;
  }

  Student? highestGradeStudent;
  double highestGrade = 0.0;

  for (var student in students) {
    if (student.averageGrade > highestGrade) {
      highestGrade = student.averageGrade;
      highestGradeStudent = student;
    }
  }

  if (highestGradeStudent == null) {
    print('Студент с наивысшим баллом не найден.');
  }
  
  return highestGradeStudent;
}

}

void main() {
  var journal = StudentJournal();

  while (true) {
    print('\nВыберите следующее действие:');
    print('1. Добавить студента');
    print('2. Удалить студента');
    print('3. Показать информацию о всех студентах');
    print('4. Показать средний балл');
    print('5. Показать студента с самым высоким баллом');
    print('6. Выйти');

    stdout.write('Ваш выбор: ');
    var choice = stdin.readLineSync()?.trim() ?? '';

    switch (choice) {
      case '1':
        stdout.write('Введите ID студента: ');
        var id = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

        if (Student.allIds.contains(id)) {
          print('Ошибка: Данный ID уже используется.');
          continue;
        }

        stdout.write('Введите имя студента: ');
        var firstName = stdin.readLineSync() ?? '';

        stdout.write('Введите фамилию студента: ');
        var lastName = stdin.readLineSync() ?? '';

        stdout.write('Введите средний балл студента: ');
        var averageGrade = double.tryParse(stdin.readLineSync() ?? '') ?? 0.0;

        journal.addStudent(id, firstName, lastName, averageGrade);
        break;

      case '2':
        case '2':
          if (journal.students.isEmpty) {
            print('Журнал студентов пуст.');
            break;
          }
          stdout.write('Введите ID студента для удаления: ');
          var idToRemove = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

          var studentRemoved = journal.removeStudent(idToRemove);
          if (studentRemoved) {
            print('Студент успешно удален из журнала.');
          } else {
            print('Студент с указанным ID не найден в журнале.');
          }
          break;


      case '3':
        if (journal.students.isEmpty) {
          print('Журнал студентов пуст.');
          break;
        }
        journal.displayAllStudents();
        break;

      case '4':
        if (journal.students.isEmpty) {
          print('Журнал студентов пуст.');
          break;
        }
        var averageGrade = journal.calculateAverageGrade();
        print('Средний балл всех студентов: $averageGrade');
        break;

      case '5':
        if (journal.students.isEmpty) {
          print('Журнал студентов пуст.');
          break;
        }
        var studentWithHighestGrade = journal.findStudentWithHighestGrade();
        if (studentWithHighestGrade != null) {
          print('Студент с самым высоким баллом:');
          studentWithHighestGrade.displayInfo();
        } else {
          print('Нет студентов в журнале.');
        }
        break;

      case '6':
        print('Программа завершена.');
        return;

      default:
        print('Ошибка: Некорректный выбор. Пожалуйста, выберите один из предложенных пунктов.');
    }
  }
}

