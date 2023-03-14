import 'package:flutter/material.dart';

class BookView extends StatefulWidget {
  const BookView({Key? key}) : super(key: key);

  @override
  State<BookView> createState() => _BookViewState();
}

class _BookViewState extends State<BookView> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children:const  [
          Center(
            child: Text(''
                'Book'),
          ),
        ]
    );
  }
}
