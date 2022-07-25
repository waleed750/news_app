import 'package:flutter/material.dart';
import 'package:news_flutter/layout/state_managment/cubit.dart';
import 'package:news_flutter/layout/state_managment/state.dart';
import 'package:news_flutter/shared/common/components.dart';
import 'package:news_flutter/shared/imports/exports.dart';

class ScienceScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit , NewsStates>(

      listener: (context , state) {

      },
      builder: (context , state) {
        var cubit = NewsCubit.get(context);
        return ConditionalBuilder(
          condition: (cubit.science.isNotEmpty  ),
          builder: (context) => buildListArticles(list: cubit.science , context: context ),
          fallback: (context) => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
