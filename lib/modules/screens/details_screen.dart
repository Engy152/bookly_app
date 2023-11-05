import 'package:bookly/cubit/cubit.dart';
import 'package:bookly/cubit/states.dart';
import 'package:bookly/models/BookModel.dart';
import 'package:bookly/modules/widgets/photo_Item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    Key? key,
    required this.book,
    required this.index,
  }) : super(key: key);
  final BookModel? book;
  final int index;



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookCubit,BookStates>(
      listener: (BuildContext context, BookStates state) {  },
      builder: (BuildContext context, BookStates state)
      {

        List<Items> listPhoto = book!.items!.where((element) => element.volumeInfo!.imageLinks!.smallThumbnail
            != book!.items![index].volumeInfo!.imageLinks!.smallThumbnail ).toList();



        return Scaffold(
          backgroundColor: Color(0xff0E1C3D),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Color(0xff0E1C3D),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Icon(Icons.shopping_cart,color: Colors.white,),
              ),],
          ),
          body: Padding(
            padding: const EdgeInsets.only(top:30.0),
            child: Column(
              children: [
                Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    //shape: BoxShape.circle,
                      borderRadius: BorderRadius.circular(400)
                  ),
                  child: Image.network(
                    '${book!.items![index].volumeInfo!.imageLinks!.smallThumbnail}',
                   // 'assets/images/photo.jpg',
                  ),
                ),
                SizedBox(height: 20,),
                Text(
                  '${book!.items![index].volumeInfo!.title}',
                  //'The Jungle Book ',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0

                  ),
                ),
                SizedBox(height: 15,),
                Text(
                  //'000',
                 '${book!.items![index].volumeInfo!.publisher!}',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20.0
                  ),
                ),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 20.0,
                    ),
                    SizedBox(width: 5,),
                    Text(
                      '${book!.items![index].volumeInfo!.averageRating}',
                     // '4.8',
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
                SizedBox(height: 25,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Center(
                        child: Text(
                          '${book!.items![index].volumeInfo!.averageRating}',
                         // '17.77',
                          style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),
                        ),
                      ),
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(17),
                            bottomLeft: Radius.circular(17)
                        ),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Text(
                          'Free Preview',
                          style: TextStyle(color: Colors.white,fontSize: 15),
                        ),
                      ),
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xffEF8262),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(17),
                            bottomRight: Radius.circular(17)
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 40,),
                Padding(
                  padding: const EdgeInsets.only(right: 210.0),
                  child: Text(
                    'You can also like',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      scrollDirection:Axis.horizontal ,
                      itemBuilder: (context,index)
                      {
                        return Image.network(listPhoto[index].volumeInfo!.imageLinks!.smallThumbnail!);
                          //photoItem(book: BookCubit.get(context).book_model!, index: index);
                      }, itemCount: listPhoto.length,
                   // BookCubit.get(context).book_model!.items!.length,
                    ),
                  ),
                ),

              ],
            ),
          ),
        );
      },
    );
  }
}
