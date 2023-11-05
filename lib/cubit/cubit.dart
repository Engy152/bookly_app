


import 'dart:convert';

import 'package:bookly/cubit/states.dart';
import 'package:bookly/models/BookModel.dart';
import 'package:bookly/network/http.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookCubit extends Cubit<BookStates>
{
  BookCubit():super(AppInitialStates());
  static BookCubit get(context) => BlocProvider.of(context);
  BookModel? book_model;
 void getAllBookInfo() async
  {
    print('99999999999999');
    emit(AppLoadingStates());
     await Api().get(
         url: 'https://www.googleapis.com/books/v1/volumes?'
         'q=programming').then( (value)
      {
        final data = json.decode(value.body);
        print(data);
        print('444444444444');

        if(value.statusCode==200){
          book_model = BookModel.fromJson(data);
          print('3333333333');
          print(book_model);
        emit(AppScseesStates());
        }else
        {
          print('error');
        }
      }).catchError((error) {
        print('error.toString()$error');
        emit(AppErrorStates());
      });
    }
  }