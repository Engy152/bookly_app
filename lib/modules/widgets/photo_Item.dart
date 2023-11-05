import 'package:bookly/models/BookModel.dart';
import 'package:flutter/material.dart';

class photoItem extends StatelessWidget {
  const photoItem({Key? key, required this.book, required this.index}) : super(key: key);
  final BookModel book;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 17.0,),
      child: Container(
        width: 150,height: 200,

        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0)
        ),
        child: Image.network(

          '${book.items![index].volumeInfo!.imageLinks!.smallThumbnail}',
        ),
      ),
    );
  }
}
