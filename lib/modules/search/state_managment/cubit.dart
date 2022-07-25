import 'package:news_flutter/modules/search/state_managment/states.dart';
import 'package:news_flutter/shared/imports/exports.dart';
import 'package:news_flutter/shared/remote/dio_helper.dart';

class SearchCubit extends Cubit<SearchStates>
{
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get (context) => BlocProvider.of(context);

  List<dynamic> searchList = [] ;

  Future<void> search(String text) async
  {
    emit(SearchLoadingState());
    await DioHelper.getData(url:
    'v2/top-headlines' ,
        queryParameters: {
          'q':'${text}' ,
          'apiKey' :'4f2185f3d27e42749600b84d556061d5',
        }
    ).then((value) {
/*
        print('Data from API : ${value.data.toString()}');
*/
      searchList = value.data['articles'];
      print('Business data ${searchList}');
      emit(SearchSuccessfulState());
    }).catchError((error) {
      emit(SearchErrorState());
      print('Error from API : ${error.toString()}');


    });

  }
}