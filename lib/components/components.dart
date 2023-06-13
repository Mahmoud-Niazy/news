import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news/web_screen/web_screen.dart';


Widget BuildNewsItem(Map news,context){
  return InkWell(
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            height: 200,
            width: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  '${news['urlToImage']}',
                ),
              ),
            ),
          ),
          SizedBox(
            width: 15.0,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${news['title']}',
                  maxLines: 3,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  '${news['publishedAt']}',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> WebScreen(news['url'])));
    },
  );
}

Widget News({
  required list,
}){
  return ConditionalBuilder(
    condition: list.length > 0,
    builder: (context) => ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context,index)=> BuildNewsItem(list[index],context),
      separatorBuilder: (context,index)=> Container(
        height: 1.0,
        color: Colors.grey,
      ),
      itemCount: list.length,
    ),
    fallback: (context) => Center(child: CircularProgressIndicator()),
  );
}