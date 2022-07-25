import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_flutter/layout/news_layout.dart';
import 'package:news_flutter/layout/state_managment/cubit.dart';
import 'package:news_flutter/layout/state_managment/state.dart';
import 'package:news_flutter/modules/search/state_managment/cubit.dart';
import 'package:news_flutter/shared/common/bloc_observer.dart';
import 'package:news_flutter/shared/common/constants.dart';
import 'package:news_flutter/shared/imports/exports.dart';
import 'package:news_flutter/shared/local/cache_helper.dart';
import 'package:news_flutter/shared/remote/dio_helper.dart';
import 'package:news_flutter/shared/themes/colors/colors.dart';
import 'package:news_flutter/shared/themes/themes.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  BlocOverrides.runZoned(
        () {

      DioHelper.init();
      CacheHelper.init().then((value) {
        bool? isDark = CacheHelper.getBool(key : 'isDark')   ;
        NewsCubit.isDark = isDark != null ? isDark : false;

        runApp(MyApp());
      });

    },
    blocObserver: MyBlocObserver(),
  );

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => NewsCubit()..getBusiness()) ,
      BlocProvider(create: (context) => SearchCubit()),
    ],
        child: BlocConsumer<NewsCubit , NewsStates>
      (listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme:ThemeData(
            primarySwatch: Colors.deepOrange ,
            appBarTheme: AppBarTheme(

              elevation: 0.0,
              backgroundColor:  defaultDarkModeColor,
              backwardsCompatibility: false ,
              foregroundColor: Colors.white,
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: defaultDarkModeColor ,
                  statusBarIconBrightness: Brightness.light
              ) ,
            ) ,
            scaffoldBackgroundColor: defaultDarkModeColor ,
            textTheme: const TextTheme(
              bodyText1: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0 ,
                  fontWeight: FontWeight.w700
              ) ,
              headline1: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w700 ,
                fontSize: 16.0 ,
              ) ,
            ) ,
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: defaultDarkModeColor ,
                elevation: 10.0 ,
                unselectedItemColor: Colors.grey
            ) ,

          ) ,
          themeMode: NewsCubit.isDark ? ThemeMode.dark : ThemeMode.light,
          home: NewsScreen(),
        ) ;
      },

    ));
  }
}
/**/

