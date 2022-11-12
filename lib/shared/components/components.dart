import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news/modules/web_view/web_view_screen.dart';
Widget buildArticleItem(article,context)=>InkWell(
  onTap: (){
    navigateTo(context, WebViewScreen(article['url']));
  },
  child:   Padding(

    padding: const EdgeInsets.all(20.0),

    child: Row(

      children: [

        Container(

          width: 120.0,

          height: 120.0,

          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(10.0),

            image:  DecorationImage(

                image: NetworkImage(

                    '${article['urlToImage']}'),

                fit: BoxFit.cover),

          ),

        ),

        const SizedBox(

          width: 20.0,

        ),

        Expanded(

          child: SizedBox(

            width: 120.0,

            height: 120.0,

            child: Column(

              mainAxisSize: MainAxisSize.min,

              crossAxisAlignment: CrossAxisAlignment.start,

              children:  [

                Expanded(

                    child: Text(

                      '${article['title']}',

                      maxLines: 3,

                      overflow: TextOverflow.ellipsis,

                      style: Theme.of(context).textTheme.bodyText1,

                    )),

                Text(

                  '${article['publishedAt']}',

                  style: const TextStyle(color: Colors.grey),

                )

              ],

            ),

          ),

        ),

      ],

    ),

  ),
);
Widget myDivider()=>Padding(
  padding: const EdgeInsetsDirectional.only(start: 20.0),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);
Widget articleBuilder(List<dynamic>list,context,{isSearch=false})=>ConditionalBuilder(
    condition: list.isNotEmpty,
    builder: (context)=>
        ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context,index)=>buildArticleItem(list[index],context),
            separatorBuilder: (context,index)=>myDivider(),
            itemCount: list.length)
    ,
    fallback: (context) => isSearch ?Container():const Center(child: CircularProgressIndicator()));

Widget defaultFormFeild({
  required TextEditingController controller,
  required TextInputType? type,
  Function (String value)? onChange,
  Function (String value)? onSubmit,
  required String Function (String? value) validate,
  required var label,
  required IconData prefix,
  GestureTapCallback? onTap,
}) =>
    TextFormField(
      onTap: onTap,
      controller: controller,
      onFieldSubmitted: onSubmit,
      keyboardType: type,
      onChanged: onChange,
      validator: validate,
      decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(prefix),
          border: const OutlineInputBorder()),
    );
void navigateTo(context,Widget){
  Navigator.push(context, MaterialPageRoute(builder: (context) =>Widget
  ));
}


