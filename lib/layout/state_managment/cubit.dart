import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_flutter/layout/state_managment/state.dart';
import 'package:news_flutter/modules/business_screen.dart';
import 'package:news_flutter/modules/science_screen.dart';
import 'package:news_flutter/modules/sports_screen.dart';
import 'package:news_flutter/shared/common/constants.dart';
import 'package:news_flutter/shared/imports/exports.dart';
import 'package:news_flutter/shared/local/cache_helper.dart';
import 'package:news_flutter/shared/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>{

  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  static bool isDark = false;

  int currentIndex = 0 ;
  List<Widget> screens = [
    BusinessScreen() ,
    SportsScreen() ,
    ScienceScreen() ,
  ];

  void changeNavBar(int index)
  {
    currentIndex = index ;
    if(index == 1 && sports.isEmpty) {
      getSports();
    } else if (index ==2 && science.isEmpty) {
      getScience();
    }
    emit(NewsNavBarChangeState());
  }

  List<dynamic> business = [];
  Future<void> getBusiness() async
  {

      emit(NewsBusinessLoadingState());
      var articles = await DioHelper.getData(url:
          'v2/top-headlines' ,
          queryParameters: {
              'country':'eg' ,
              'category' :'business',
              'apiKey' :'4f2185f3d27e42749600b84d556061d5',
          }
      ).catchError((error) {
        emit(NewsBusinessErrorState());
        print('Error from API : ${error.toString()}');


      });

      business = articles.data['articles'];
      print('Business data ${business}');
      emit(NewsBusinessSuccessfulState());
  }

  List<dynamic> sports = [] ;
  Future<void> getSports() async
  {
    emit(NewsSportsLoadingState());
    var articles = await DioHelper.getData(url:
    'v2/top-headlines' ,
        queryParameters: {
          'country':'eg' ,
          'category' :'sports',
          'apiKey' :'4f2185f3d27e42749600b84d556061d5',
        }
    ).catchError((error) {
      emit(NewsSportsErrorState());
      print('Error from API : ${error.toString()}');


    });

    sports = articles.data['articles'];
    print('Business data ${sports}');
    emit(NewsSportsSuccessfulState());

  }
  List<dynamic> science = [] ;
  Future<void> getScience() async
  {
    emit(NewsScienceLoadingState());
    var articles = await DioHelper.getData(url:
    'v2/top-headlines' ,
        queryParameters: {
          'country':'eg' ,
          'category' :'science',
          'apiKey' :'4f2185f3d27e42749600b84d556061d5',
        }
    ).catchError((error) {
      emit(NewsScienceErrorState());
      print('Error from API : ${error.toString()}');


    });


    science = articles.data['articles'];
    print('Business data ${science}');
    emit(NewsScienceSuccessfulState());

  }
  void changeTheme()
  {
    isDark = !isDark;
    CacheHelper.setCache(key: 'isDark',
        value: isDark).then((value) {
      emit(NewsModeChangedState());
    });
  }
  void refresh()
  {
    currentIndex = 0 ;
    sports = [] ;
    science =[];
    getBusiness();
  }
}