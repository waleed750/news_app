import 'package:flutter/material.dart';
import 'package:news_flutter/layout/state_managment/cubit.dart';
import 'package:news_flutter/layout/state_managment/state.dart';
import 'package:news_flutter/shared/common/components.dart';
import 'package:news_flutter/shared/imports/exports.dart';

class SportsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit , NewsStates>(

      listener: (context , state) {

      },
      builder: (context , state) {
        var cubit = NewsCubit.get(context);
        return ConditionalBuilder(
          condition: (cubit.sports.isNotEmpty || state is! NewsSportsLoadingState ),
          builder: (context) => buildListArticles(list: cubit.sports , context: context ) ,
          fallback: (context) => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
