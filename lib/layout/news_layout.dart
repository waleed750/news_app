import 'package:flutter/material.dart';
import 'package:news_flutter/layout/state_managment/cubit.dart';
import 'package:news_flutter/layout/state_managment/state.dart';
import 'package:news_flutter/modules/search/search_screen.dart';
import 'package:news_flutter/shared/common/constants.dart';
import 'package:news_flutter/shared/imports/exports.dart';

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit , NewsStates>(
        listener: (context , state){},
        builder: (context ,state ) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              titleSpacing: 20.0,
              title: const Text(
                'News App' ,
              ),
              actions: [
                IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchScreen()));
                }, icon: const Icon(
                  Icons.search ,
                  size: 25.0,
                )),
                IconButton(onPressed: (){
                    cubit.changeTheme();
                    print("Current theme : ${currentTheme.toString()}");

                }, icon: const Icon(
                  Icons.brightness_4_outlined ,
                  size: 25.0,
                )),
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index){
                cubit.changeNavBar(index);

              },

              items: const [
                BottomNavigationBarItem(icon: Icon(
                  Icons.business,
                ) , label: 'Business') ,
                BottomNavigationBarItem(icon: Icon(
                  Icons.sports,
                ) , label: 'Sports') ,
                BottomNavigationBarItem(icon: Icon(
                  Icons.science_outlined,
                ) , label: 'Science') ,
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: (){
                cubit.refresh();
              },
              child: const Icon(
                Icons.refresh
              ),
            ),
          );
        },
    );
  }
}
