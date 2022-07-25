import 'package:flutter/material.dart';
import 'package:news_flutter/layout/state_managment/cubit.dart';
import 'package:news_flutter/layout/state_managment/state.dart';
import 'package:news_flutter/shared/common/components.dart';
import 'package:news_flutter/shared/imports/exports.dart';

class BusinessScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit , NewsStates>(

        listener: (context , state) {

        },
        builder: (context , state) {
          var cubit = NewsCubit.get(context);
          return ConditionalBuilder(
            condition: (cubit.business.isNotEmpty || state is! NewsBusinessLoadingState ),
            builder: (context) => ListView.separated(itemBuilder: (context , index) => buildArticleItem(model: cubit.business[index] , context: context),
                separatorBuilder:(context , index) => Container(
                  height: 1.0,
                  color : Colors.grey ,
                  width: double.infinity,
                ),
                itemCount: cubit.business.length ,
                physics: BouncingScrollPhysics(),

            ),
            fallback: (context) => const Center(child: CircularProgressIndicator()),
          );
        },
    );
  }
}
