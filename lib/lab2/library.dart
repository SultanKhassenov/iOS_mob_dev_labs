import 'dart:io';

class Book {
  String title;
  String author;
  int year;
  int pageCount;

  Book(this.title, this.author, this.year, this.pageCount);

  void displayInfo() {
    print('Название: $title');
    print('Автор: $author');
    print('Год: $year');
    print('Количество страниц: $pageCount');
  }
}

class Library {
  List<Book> books = [];

  void addBook(Book book) {
    books.add(book);
    print('Книга добавлена в библиотеку.');
  }

  void removeBook(Book book) {
    if (books.contains(book)) {
      books.remove(book);
    } else {
      print('Книга не найдена.');
    }
  }

  void displayAllBooks() {
    if (books.isEmpty) {
      print('Библиотека пуста.');
    } else {
      print('Книги в библиотеке:');
        print('---------------');
      for (var book in books) {
        book.displayInfo();
        print('---------------');
      }
    }
  }
}

void main() {
  var library = Library();
  var choice = '';

  while (choice != '4') {
    print('\nВыберите действие:');
    print('1. Добавить книгу');
    print('2. Удалить книгу');
    print('3. Показать всю библиотеку');
    print('4. Выйти');

    choice = stdin.readLineSync() ?? '';
    switch (choice) {
      case '1':
        var title, author;
        var year, pageCount;

        stdout.write('Введите название книги: ');
        title = stdin.readLineSync() ?? '';

        stdout.write('Автор: ');
        author = stdin.readLineSync() ?? '';

        stdout.write('Год публикации: ');
        year = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

        stdout.write('Количество страниц: ');
        pageCount = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

        var newBook = Book(title, author, year, pageCount);
        library.addBook(newBook);
        break;

      case '2':
        if (library.books.isEmpty) {
          print('Библиотека пуста.');
        } else {
          stdout.write('Введите название книги: ');
          var titleToRemove = stdin.readLineSync() ?? '';
          try {
            var bookToRemove = library.books.firstWhere((book) => book.title == titleToRemove);
            library.removeBook(bookToRemove);
            print('Книга успешно удалена.');
          } catch (e) {
            print('Книга не найдена в библиотеке.');
          }
          break;
      }
      case '3':
        library.displayAllBooks();
        break;

      case '4':
        print('Завершение програмы.');
        break;

      default:
        print('Некорректный выбор. Повторите еще.');
    }
  }
}
