import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Network/local/cacheHelper.dart';
import 'package:newsapp/Network/remote/dio_helper.dart';
import 'package:newsapp/modules/scienceScreen/scienceScreen.dart';
import 'package:newsapp/modules/sportsScreen/sportsScreen.dart';
import 'package:newsapp/shared/cubit/newsStates.dart';

import '../../modules/businessScreen/businessScreen.dart';

class NewCubit extends Cubit<NewStates>
{
  NewCubit() :super(NewInitialStates());
  static NewCubit get(context)=>BlocProvider.of(context);
  int currentIndex = 0 ;
  List<BottomNavigationBarItem> bottomItems = const[
    BottomNavigationBarItem(icon: Icon(Icons.business) , label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports) , label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science) , label: 'Science'),

  ];
  List<Widget> screen =
  [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),];
  void changeBottomNavBar(index)
  {
    currentIndex = index!;
    if(index ==1) {
      getSportsData();
    }
    if(index ==2)
      getScienceData();
    emit(NewNavBottomStates());
  }
  List<dynamic> business = [];
  void getBusinessData()
  {
    emit(NewsLoadingBusinessStates());
    if(business.length==0)
    {
      DioHelper.getData(url: 'v2/top-headlines', query:
      {
        'country':'us',
        'category':'business',
        'apiKey':'64dc4ac09c7140bc8d73151e446b88d4',
      }).then((value)
      {
        business = value.data['articles'];
        print(business[0]['title']);
        emit(NewsGetBusinessSuccessStates());
      }).catchError((error){
        print(error.toString());
        emit(NewGetBusinessDataErrorStates(error.toString()));
      });
    }
    else
    {
      emit(NewsGetBusinessSuccessStates());
    }

  }
  List<dynamic> sports = [];
  void getSportsData()
  {
    emit(NewsLoadingSportsStates());
    if(sports.length==0){
      DioHelper.getData(url: 'v2/top-headlines', query:
      {
        'country':'us',
        'category':'sports',
        'apiKey':'64dc4ac09c7140bc8d73151e446b88d4',
      }).then((value)
      {
        sports = value.data['articles'];
        print(sports[0]['title']);
        emit(NewsGetSportsSuccessStates());
      }).catchError((error){
        print(error.toString());
        emit(NewGetSportsDataErrorStates(error.toString()));
      });
    }
    else{
      emit(NewsGetSportsSuccessStates());
    }

  }
  List<dynamic> science = [];
  void getScienceData()
  {

    emit(NewsLoadingScienceStates());
    if(science.length==0){
      DioHelper.getData(url: 'v2/top-headlines', query:
      {
        'country':'us',
        'category':'science',
        'apiKey':'64dc4ac09c7140bc8d73151e446b88d4',
      }).then((value)
      {
        science = value.data['articles'];
        print(science[0]['title']);
        emit(NewsGetScienceSuccessStates());
      }).catchError((error){
        print(error.toString());
        emit(NewGetScienceDataErrorStates(error.toString()));
      });
    }
    else
    {
      emit(NewsGetScienceSuccessStates());
    }

  }
  bool isDark = false;
  void changeAppMode({ bool? isShared})
  {

    if(isShared != null) {
      isDark = isShared;
      emit(NewsAppChangeModeState());
    }
    else{
      isDark =! isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(NewsAppChangeModeState());
      });
    }

  }
  List<dynamic> search = [];
  void getSearchData({String? value})
  {
    //emit(NewsLoadingSearchStates());
    if(value==null)
    {
      search =[];
      emit(NewsLoadingSearchStates());
    }
    else {
      DioHelper.getData(
          url: 'v2/everything',
          query:
      {

        'q':'$value',
        'apiKey':'3d5bfab911b0454981bf887b9d017583',
      }).then((value)
      {
        search = value.data['articles'];
        print(search[0]['title']);
        emit(NewsGetSearchSuccessStates());
      }).catchError((error){
        print(error.toString());
        emit(NewGetSearchDataErrorStates(error.toString()));
      });
    }


  }
}