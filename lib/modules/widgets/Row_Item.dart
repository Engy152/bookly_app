import 'package:bookly/cubit/cubit.dart';
import 'package:bookly/models/BookModel.dart';
import 'package:bookly/modules/screens/details_screen.dart';
import 'package:flutter/material.dart';

class RowItenBuilder extends StatelessWidget {

  const RowItenBuilder({
    Key? key,
    required this.book,
    required this.index,
  }) : super(key: key);
  final BookModel book;
  final int index;
  @override
  Widget build(BuildContext context) {
   // print(  book.items![index].volumeInfo!.averageRating.toString(),);
    return  Row(
        children: [
          Container(
            width: 100,height: 180,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0)
            ),
            child: Image.network(
              '${book.items![index].volumeInfo!.imageLinks!.smallThumbnail}',
              //'assets/images/photo.jpg',
            ),
          ),
          SizedBox(width: 15,),
          Container(
            height: 140,
            width: 240,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${book.items![index].volumeInfo!.title}',
                //book.items![index].volumeInfo!.title.toString(),
                 //book.items![index].volumeInfo!.title.toString(),
                  //'Harry poter and the Globet of ',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.0

                  ),
                ),
                SizedBox(height: 10.0,),
                Text(
                  '${book.items![index].volumeInfo!.publisher!}',
                  //book.items![index].volumeInfo!.publisher!.toString(),
                 //'rrgdfvfv',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15.0
                  ),
                ),
                SizedBox(height: 10.0,),
                Row(
                  children: [
                    Text(
                      //'55',
                      // error
                     '${book.items![index].volumeInfo!.ratingsCount}',
                     // book.items![index].volumeInfo!.averageRating!.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,

                      ),
                    ),
                    SizedBox(width: 55.0,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 20.0,

                    ),
                    SizedBox(width: 5,),
                    Text(
                    //book.items![index].volumeInfo!.averageRating.toString(),
                      '${book.items![index].volumeInfo!.averageRating}',
                      style: TextStyle(color: Colors.white,fontSize: 13,),
                    ),
                    SizedBox(width: 5,),
                    Text(

                      '(2360)',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                      ),
                    )
                  ],
                ),
              ],
            ),
          )

        ],
      );

  }
}
