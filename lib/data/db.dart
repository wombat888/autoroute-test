import 'package:flutter/cupertino.dart';

class BookPublisher {
  final int id;
  final String name;
  final String description;

  const BookPublisher({
    required this.id,
    required this.name,
    required this.description,
  });
}

class BookPublishersDB {
  List<BookPublisher> bookPublishers = const [
    BookPublisher(id: 0, name: 'Stochastic House', description: ''),
    BookPublisher(id: 1, name: 'Dodo Books', description: ''),
    BookPublisher(id: 2, name: 'Apple', description: ''),
    BookPublisher(id: 3, name: 'Google', description: ''),
  ];

  BookPublisher findBookPublisherById(int id) {
    return bookPublishers.firstWhere(
      (bookPublisher) => bookPublisher.id == id,
      orElse: () => throw ('Can not find book publisher with id $id'),
    );
  }
}

class BookPublishersDBProvider extends InheritedWidget {
  final bookPublishersDb = BookPublishersDB();

  BookPublishersDBProvider({required Widget child}) : super(child: child);

  @override
  bool updateShouldNotify(_) {
    return false;
  }

  static BookPublishersDB? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<BookPublishersDBProvider>()
        ?.bookPublishersDb;
  }
}

class Book {
  final int id;
  final String name;
  final String genre;
  final List<int> publisherIds;

  const Book({
    required this.id,
    required this.name,
    required this.genre,
    required this.publisherIds,
  });
}

class BooksDB {
  List<Book> books = const [
    Book(
        id: 1,
        genre: 'Fiction',
        name: 'Anna Karenina',
        publisherIds: [0, 1, 2, 3]),
    Book(
        id: 2,
        genre: 'Fiction',
        name: 'The Great Gatsby',
        publisherIds: [0, 1, 2]),
    Book(
        id: 3,
        genre: 'Comic',
        name: 'Amazing Spider-Man',
        publisherIds: [0, 1]),
    Book(id: 4, genre: 'Comic', name: 'Batman', publisherIds: [0]),
    Book(
        id: 5,
        genre: 'Comic',
        name: 'The Incredible Hulk',
        publisherIds: [0, 1]),
    Book(
        id: 6,
        genre: 'Fiction',
        name: 'The Big Sleep',
        publisherIds: [0, 1, 2]),
    Book(
        id: 7,
        genre: 'Fiction',
        name: 'Woman in White',
        publisherIds: [0, 1, 2, 3]),
  ];

  Book findBookById(int id) {
    return books.firstWhere(
      (book) => book.id == id,
      orElse: () => throw ('Can not find book with id $id'),
    );
  }
}

class BooksDBProvider extends InheritedWidget {
  final booksDb = BooksDB();

  BooksDBProvider({required Widget child}) : super(child: child);

  @override
  bool updateShouldNotify(_) {
    return false;
  }

  static BooksDB? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<BooksDBProvider>()
        ?.booksDb;
  }
}

class User {
  final int id;
  final String name;
  final String email;
  final List<int> bookIds;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.bookIds,
  });
}

class UsersDB {
  final List<User> users = [
    User(
        id: 1,
        name: 'User one',
        email: 'userone@email.com',
        bookIds: [1, 2, 3]),
    User(
        id: 2,
        name: 'User two',
        email: 'usertwo@email.com',
        bookIds: [5, 6, 7]),
  ];

  User findUserById(int id) {
    return users.firstWhere(
      (user) => user.id == id,
      orElse: () => throw ('Can not find user with id $id'),
    );
  }
}

class UsersDBProvider extends InheritedWidget {
  final usersDB = UsersDB();

  UsersDBProvider({required Widget child}) : super(child: child);

  @override
  bool updateShouldNotify(_) {
    return false;
  }

  static UsersDB? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<UsersDBProvider>()
        ?.usersDB;
  }
}
