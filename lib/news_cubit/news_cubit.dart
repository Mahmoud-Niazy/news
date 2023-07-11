import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/dio_helper/dio_helper.dart';
import 'package:news/news_cubit/news_states.dart';
import 'package:news/news_screens/business.dart';
import 'package:news/news_screens/science.dart';
import 'package:news/news_screens/sport.dart';

import '../cashe_helper/cashe_helper.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);

  int current_index = 0 ;
  List<Widget> screens = [
    BusinessScreen(),
    SportScreen(),
    ScienceScreen(),
  ] ;
  BottomNav(index){

    current_index = index ;
    emit(BottomNavState());
  }

  List<dynamic> business = [] ;
  GetBusinessData(){
    DioHelper.GetData(
        url: 'v2/top-headlines',
        query: {
          'country' : 'eg' ,
          'category' : 'business',
          'apiKey' : 'ed421428da1b4451b290e68db18195d0',
        },
    )
        .then((value){
          business = value.data['articles'];
          emit(GetBusinessDataSuccessfullyState());
    })
        .catchError((error){
          print(error);
          emit(GetBusinessDataErrorState());
    });


  }


  List<dynamic> sport = [] ;
  GetSportData(){
    DioHelper.GetData(
      url: 'v2/top-headlines',
      query: {
        'country' : 'eg' ,
        'category' : 'sport',
        'apiKey' : 'ed421428da1b4451b290e68db18195d0',
      },
    )
        .then((value){
      sport = value.data['articles'];
      emit(GetSportDataSuccessfullyState());
    })
        .catchError((error){
      print(error);
      emit(GetSportDataErrorState());
    });
  }

  List<dynamic> science = [] ;
  GetScienceData(){
    DioHelper.GetData(
      url: 'v2/top-headlines',
      query: {
        'country' : 'eg' ,
        'category' : 'science',
        'apiKey' : 'ed421428da1b4451b290e68db18195d0',
      },
    )
        .then((value){
      science = value.data['articles'];
      emit(GetScienceDataSuccessfullyState());
    })
        .catchError((error){
      print(error);
      emit(GetScienceDataErrorState());
    });
  }

  List<dynamic> search = [] ;
  GetSearchData(String value){
    DioHelper.GetData(
      url: 'v2/everything',
      query: {
        'q' : '$value',
        'apiKey' : 'ed421428da1b4451b290e68db18195d0',
      },
    )
        .then((value){
      search = value.data['articles'];
      emit(GetSearchDataSuccessfullyState());
    })
        .catchError((error){
      print(error);
      emit(GetSearchDataErrorState());
    });
  }

  bool is_dark = CasheHelper.GetData(key: 'isDark') ?? false  ;
  changeMode(){
    is_dark = !is_dark ;
    CasheHelper.SvaeData(key: 'isDark', value: is_dark).then((value){
      emit(ChangeModeState());
      print(CasheHelper.GetData(key: 'isDark'));
    });
  }
}