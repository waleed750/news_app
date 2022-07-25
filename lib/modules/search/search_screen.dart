import 'package:flutter/material.dart';
import 'package:news_flutter/layout/state_managment/cubit.dart';
import 'package:news_flutter/modules/search/state_managment/cubit.dart';
import 'package:news_flutter/modules/search/state_managment/states.dart';
import 'package:news_flutter/shared/common/components.dart';
import 'package:news_flutter/shared/imports/exports.dart';
import 'package:news_flutter/shared/themes/colors/colors.dart';

class SearchScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    var searchController = TextEditingController();
    return BlocConsumer<SearchCubit , SearchStates>(
    listener: (context , state) {} ,
    builder: (context , state) {
      return Scaffold(
        appBar: AppBar(
          title: TextFormField(

            controller: searchController,
            onChanged: (value){
              if(value.isNotEmpty) {
                SearchCubit.get(context).search(value);
              } else {
                SearchCubit.get(context).searchList = [];
              }
            } ,
            decoration: InputDecoration(
              enabledBorder:UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: NewsCubit.isDark ? Colors.white : Colors.black,
                  )
              ) ,
              hintText: 'Search',
              hintStyle: TextStyle(
                color: NewsCubit.isDark ? Colors.white : Colors.black ,
                fontSize: 16.0
              )
            ),
          ),
        ),
         body: ConditionalBuilder(
           condition: state is! SearchLoadingState ,
           builder: (context) =>SearchCubit.get(context).searchList.isNotEmpty ? buildListArticles(list: SearchCubit.get(context).searchList , context: context) : Container(),
           fallback: (context) => const Center(
             child: CircularProgressIndicator(),
           ),
         ),
      );
    },
    );
  }
}

/*defaultTextFeild(controller: searchController,
                type: TextInputType.text,
                validate: (value){} ,
                onChange: (value){
                  if(value!.isNotEmpty) {
                    SearchCubit.get(context).search(value);
                  } else {
                    SearchCubit.get(context).searchList = [];
                  }
                }
            ),
          titleTextStyle: const TextStyle(
            color: Colors.white
          )*/
