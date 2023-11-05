import 'package:bookly/cubit/cubit.dart';
import 'package:bookly/cubit/states.dart';
import 'package:bookly/modules/screens/details_screen.dart';
import 'package:bookly/modules/widgets/Row_Item.dart';
import 'package:bookly/modules/widgets/photo_Item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BookCubit.get(context).getAllBookInfo();
    return BlocConsumer<BookCubit,BookStates>(
      listener: (context, BookStates state) {  },
      builder: (context, BookStates state)
      {
        return Scaffold(
          backgroundColor: Color(0xff0E1C3D),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Color(0xff0E1C3D),
            title: Text
              (
              'Bookly',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              )
            ],

          ),
          body:
          state is AppLoadingStates? const Center(child: CircularProgressIndicator()):
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    scrollDirection:Axis.horizontal ,
                    itemBuilder: (context,index)
                    {
                      return photoItem(book: BookCubit.get(context).book_model!, index: index);
                    }, itemCount: BookCubit.get(context).book_model!.items!.length,
                  ),
                ),
                SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text
                    (
                    'Best Seller',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context,index)
                        {
                          return GestureDetector(
                            onTap: ()
                            {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(book: BookCubit.get(context).book_model, index: index)));
                            },
                            child: RowItenBuilder(
                             index: index,
                              book: BookCubit.get(context).book_model!,
                            ),
                          );
                        },
                        itemCount:
                        BookCubit.get(context).book_model!.items!.length,
                    )
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
