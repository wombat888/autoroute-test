import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../data/db.dart';

class BookPublisherDetailsPage extends StatefulWidget {
  final int bookPublisherId;

  const BookPublisherDetailsPage({
    @PathParam('bookPublisherId') this.bookPublisherId = -1,
  });

  @override
  _BookPublisherDetailsPageState createState() =>
      _BookPublisherDetailsPageState();
}

class _BookPublisherDetailsPageState extends State<BookPublisherDetailsPage> {
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    final bookPublishersDb = BookPublishersDBProvider.of(context);
    final bookPublisher =
        bookPublishersDb?.findBookPublisherById(widget.bookPublisherId);

    return bookPublisher == null
        ? Container(child: Text('Book publisher is null'))
        : Scaffold(
            body: Container(
              width: double.infinity,
              child: Card(
                margin: const EdgeInsets.all(48),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Book Publisher Details/${bookPublisher.id}'),
                    Text('Name: ${bookPublisher.name}'),
                    Text('Description: ${bookPublisher.description}'),
                  ],
                ),
              ),
            ),
          );
  }
}
