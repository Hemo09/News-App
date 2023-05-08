import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/modules/webViewScreen/webview.dart';

Widget buildArticleItem(article , context) =>InkWell(
  onTap: ()
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>ScreenView(article['url'])));
  },
  child:   Padding(
    padding: const EdgeInsets.all(12.0),

    child: Row(

      children: [

        Container(

          height: 120.0,

          width: 120.0,

          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(10.0),

              image: article['urlToImage'] !=null

                  ?DecorationImage(

                  image:NetworkImage('${article["urlToImage"]}'),

                  fit: BoxFit.cover)

                  : const DecorationImage(image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1024px-No_image_available.svg.png'),

              ),

          ),

        ),

        const SizedBox(

          width: 10.0,

        ),

        Expanded(

          child: Container(

            height: 120,

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Expanded(

                  child: Text(

                    '${article['title']}',

                    style: Theme.of(context).textTheme.bodyText1,

                    //textAlign: TextAlign.end,

                    maxLines: 4,

                    overflow: TextOverflow.ellipsis,

                  ),

                ),

                Text(

                  '${article['publishedAt']}',

                  style: Theme.of(context).textTheme.bodyText1,

                ),

              ],
            ),
          ),
        ),

      ],

    ),

  ),
);
Widget articleItem(list)=>ConditionalBuilder(
  condition:list.length>0,
  builder: (context) =>
      ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildArticleItem(list[index],context),
        separatorBuilder: (context, index) =>
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 1,
                color: Colors.grey,
              ),
            ),
        itemCount: list.length,
      ),
  fallback: (context) => const Center(child: CircularProgressIndicator()),
);
