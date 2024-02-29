import 'dart:io';

class Task {
  String title;
  String description;
  bool isCompleted;

  Task(this.title, this.description, this.isCompleted);

  void displayInfo() {
    print('Название: $title');
    print('Описание: $description');
    print('Статус: ${isCompleted ? 'Завершено' : 'Не завершено'}');
  }
}

class ToDoList {
  List<Task> tasks = [];

  void addTask(Task task) {
    tasks.add(task);
  }

  bool removeTask(String title) {
    for (int i = 0; i < tasks.length; i++) {
      if (tasks[i].title == title) {
        tasks.removeAt(i);
        return true;
      }
    }
    return false;
  }

  void changeTaskStatus(String title, bool isCompleted) {
    for (int i = 0; i < tasks.length; i++) {
      if (tasks[i].title == title) {
        tasks[i].isCompleted = isCompleted;
        return;
      }
    }
  }

  void displayAllTasks() {
    for (var task in tasks) {
      task.displayInfo();
      print('');
    }
  }

  void displayCompletedTasks() {
    print('Завершенные задачи:');
    for (var task in tasks) {
      if (task.isCompleted) {
        task.displayInfo();
        print('');
      }
    }
  }

  void displayOutstandingTasks() {
    print('Незавершенные задачи:');
    for (var task in tasks) {
      if (!task.isCompleted) {
        task.displayInfo();
        print('');
      }
    }
  }

  void clearCompletedTasks() {
    tasks.removeWhere((task) => task.isCompleted);
  }
}

void main() {
  var toDoList = ToDoList();

  while (true) {
    print('\nВыберите действие:');
    print('1. Добавить задачу');
    print('2. Удалить задачу');
    print('3. Изменить статус задачи');
    print('4. Вывести все задачи');
    print('5. Вывести завершенные задачи');
    print('6. Вывести незавершенные задачи');
    print('7. Очистить завершенные задачи');
    print('8. Выйти');

    stdout.write('Ваш выбор: ');
    var choice = stdin.readLineSync() ?? '';

    switch (choice) {
      case '1':
        stdout.write('Введите название задачи: ');
        var title = stdin.readLineSync() ?? '';
        stdout.write('Введите описание задачи: ');
        var description = stdin.readLineSync() ?? '';
        toDoList.addTask(Task(title, description, false));
        print('Задача добавлена.');
        break;
      case '2':
        if (toDoList.tasks.isEmpty) {
          print('Список пуст.');
          break;
        }
        stdout.write('Введите название задачи для удаления: ');
        var title = stdin.readLineSync() ?? '';
        if (toDoList.removeTask(title)) {
          print('Задача удалена.');
        } else {
          print('Задача не найдена.');
        }
        break;
      case '3':
        if (toDoList.tasks.isEmpty) {
          print('Список пуст.');
          break;
        }
        stdout.write('Введите название задачи: ');
        var title = stdin.readLineSync() ?? '';
        stdout.write('Введите новый статус: 1) завершен / 2) незавершен: ');
        var choice = stdin.readLineSync()?.trim() ?? '';

        bool isCompleted;
        if (choice == '1') {
          isCompleted = true;
        } else if (choice == '2') {
          isCompleted = false;
        } else {
          print('Некорректный выбор.');
          continue;
        }

        toDoList.changeTaskStatus(title, isCompleted);
        print('Статус задачи изменен.');

        break;
      case '4':
        if (toDoList.tasks.isEmpty) {
          print('Список пуст.');
          break;
        }
        toDoList.displayAllTasks();
        break;
      case '5':
        if (toDoList.tasks.isEmpty) {
          print('Список пуст.');
          break;
        }
        toDoList.displayCompletedTasks();
        break;
      case '6':
        if (toDoList.tasks.isEmpty) {
          print('Список пуст.');
          break;
        }
        toDoList.displayOutstandingTasks();
        break;
      case '7':
        if (toDoList.tasks.isEmpty) {
          print('Список пуст.');
          break;
        }
        toDoList.clearCompletedTasks();
        print('Завершенные задачи очищены.');
        break;
      case '8':
        print('Программа завершена.');
        return;
      default:
        print('Некорректный выбор. Пожалуйста, выберите один из предложенных вариантов.');
    }
  }
}
