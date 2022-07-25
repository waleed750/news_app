

import 'package:flutter/material.dart';
import 'package:news_flutter/layout/state_managment/cubit.dart';
import 'package:news_flutter/modules/webview_screen.dart';

Widget defaultButton({
  double width = double.infinity ,
  Color color = Colors.blue ,
  VoidCallback? function ,
  required String text ,
  bool isUpperCase = true ,
}) =>Container(
  width : width,
  child: MaterialButton(
    onPressed: function ,
    child: Text( isUpperCase ? text.toUpperCase() : text ,
      style: TextStyle(
          color: Colors.white
      ),),

  ) ,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10.0) ,
    color: Colors.blue ,
  ),
);

Widget defaultTextFeild(
{
  required TextEditingController controller ,
  bool enable = true ,
  required TextInputType type ,
  Function? onSubmit  ,
  Function(String? s)? onChange ,
  IconData? prIcon,
  IconData? sfIcon ,
  Function? onTap ,
  bool isPassword = false ,
  VoidCallback? suffixpressed ,
  required String? Function(String? value)? validate ,
  String? label ,
  FocusNode? focusNode,
}
    ) =>  TextFormField(
  controller: controller,

  focusNode:  focusNode,
  enabled: enable,
  onTap: ()
  {
    onTap != null? onTap() : null ;
  },
  keyboardType: type ,
  onFieldSubmitted: (value){
    onSubmit!(value);
  } ,

  onChanged:(value){
    if(onChange != null)
      {
       onChange(value);
      }
  },
  obscureText: isPassword,
  decoration: InputDecoration(

    labelText: label ,
    prefixIcon:Icon( prIcon),
    suffixIcon:  sfIcon != null ? IconButton(
            onPressed: suffixpressed,
            icon: Icon (sfIcon )) : null,
    border: OutlineInputBorder(
        borderSide: BorderSide(
            style: BorderStyle.solid
        )
    )  ,
  ),
  validator: validate ,
) ;


BottomNavigationBarItem defaultNavigationBar (
{
  required String label ,
  required IconData icon ,
  Function? onPressed ,
}
    )=>  BottomNavigationBarItem(
  label: label,

  icon: Icon(
      icon
  ),
) ;


var noImageFound = 'https://imgs.search.brave.com/XbaLNffXL3D8s_IOdhPMZGMzGsr8RPooQ4_AdB81lv0/rs:fit:400:250:1/g:ce/aHR0cHM6Ly93d3cu/Z210LXNhbGVzLmNv/bS93cC1jb250ZW50/L3VwbG9hZHMvMjAx/NS8xMC9uby1pbWFn/ZS1mb3VuZC5qcGc';

Widget buildArticleItem({
  required Map model ,
  context
}) =>InkWell(
  onTap: (){
    Navigator.push(context,
        MaterialPageRoute(builder: (context){
          return WebViewScreen(model['url']);
        }));
  },
  child:   Container(

    width: double.infinity,

    height: 120.0,

    padding: const EdgeInsets.all(8.0),

    child: Row(

      children: [

        Container(

          height: 120.0,

          width: 120.0,

          decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(20.0),

              image: DecorationImage(

                fit: BoxFit.fill,

                image:NetworkImage(

                    '${model['urlToImage'] != null ? model['urlToImage']: noImageFound}'

                ),

              )

          ),

        ) ,

        const SizedBox(

          width: 5.0,

        ),

        Expanded(

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Expanded(

                child: Text(

                  '${model['title']}'

                  ,

                  maxLines: 3,

                  overflow: TextOverflow.ellipsis,

                  style: Theme.of(context).textTheme.bodyText1,

                ),

              ) ,

              const SizedBox(

                height: 5.0,

              ),

              Text(

                '${model['publishedAt'] }'

                ,

                maxLines: 3,

                overflow: TextOverflow.ellipsis,

                style: Theme.of(context).textTheme.headline1,

              ) ,



            ],

          ),

        ),

      ],

    ),

  ),
) ;



Widget buildListArticles ({
  required List list ,
  context ,

}) => ListView.separated(itemBuilder: (context , index) => buildArticleItem(model: list[index] , context: context),
  separatorBuilder:(context , index) => Container(
    height: 1.0,
    color : Colors.grey ,
    width: double.infinity,
  ),
  itemCount: list.length ,
  physics: BouncingScrollPhysics(),

);



