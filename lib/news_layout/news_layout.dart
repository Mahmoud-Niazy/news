import 'package:flutter/material.dart';
import 'package:news/news_cubit/news_cubit.dart';
import 'package:news/search_screen/search_screen.dart';


class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'News'
        ),
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SearchScreen()));
          }, icon: Icon(Icons.search,),),
          IconButton(onPressed: () {
            NewsCubit.get(context).changeMode();
          }, icon: Icon(Icons.brightness_2,),)
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_soccer),
            label: 'Sport',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.science_outlined),
            label: 'Science',
          ),
        ],
        onTap: (index) {
          NewsCubit.get(context).BottomNav(index);
        },
        currentIndex: NewsCubit
            .get(context)
            .current_index,
      ),
      body: NewsCubit
          .get(context)
          .screens[NewsCubit
          .get(context)
          .current_index],

    );
  }
}