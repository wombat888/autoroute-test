import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:example/mobile/router/router.gr.dart';
import 'package:flutter/material.dart';

import '../../../data/db.dart';

class BookDetailsPage extends StatefulWidget {
  final int bookId;

  const BookDetailsPage({
    @PathParam('bookId') this.bookId = -1,
  });

  @override
  _BookDetailsPageState createState() => _BookDetailsPageState();
}

class _BookDetailsPageState extends State<BookDetailsPage> {
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    final booksDb = BooksDBProvider.of(context);
    final book = booksDb?.findBookById(widget.bookId);
    final bookPublishersDb = BookPublishersDB();

    return book == null
        ? Container(child: Text('Book null'))
        : Scaffold(
            body: Container(
              width: double.infinity,
              child: Hero(
                tag: 'Hero${book.id}',
                child: Card(
                  margin: const EdgeInsets.all(48),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Book Details/${book.id}'),
                      Flexible(
                          child: ListView.builder(
                              itemCount: book.publisherIds.length,
                              itemBuilder:
                                  (BuildContext context, int bookPublisherId) {
                                final bookPublisher = bookPublishersDb
                                    .findBookPublisherById(bookPublisherId);
                                return ListTile(
                                    title: Text(bookPublisher.name),
                                    subtitle: Text(bookPublisher.description),
                                    onTap: () {
                                      BookPublisherDetailsRoute(
                                              bookPublisherId: bookPublisherId)
                                          .show(context);
                                    });
                              })),
                      Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: Text(
                          'Reads  $counter',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      const SizedBox(height: 32),
                      FloatingActionButton(
                        heroTag: null,
                        onPressed: () {
                          setState(() {
                            counter++;
                          });
                        },
                        child: Icon(Icons.add),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
