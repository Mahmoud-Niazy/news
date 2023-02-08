import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cashe_helper/cashe_helper.dart';
import 'package:news/news_cubit/news_cubit.dart';
import 'package:news/news_cubit/news_states.dart';
import 'package:news/search_screen/search_screen.dart';

import '../app_cubit/app_cubit.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return BlocConsumer<NewsCubit,NewsStates>(
     listener: (context,state){
       print(state);
     },
     builder: (context,state){
       return Scaffold(
         appBar: AppBar(
           title: Text(
               'News'
           ),
           actions: [
             IconButton(onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchScreen()));
             }, icon: Icon(Icons.search,),),
             IconButton(onPressed: (){
               AppCubit.get(context).ChangeMode(context);
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
           onTap: (index){

             NewsCubit.get(context).BottomNav(index);
           },
           currentIndex: NewsCubit.get(context).current_index,
         ),
         body: NewsCubit.get(context).screens[NewsCubit.get(context).current_index],

       );
     },
   );
  }

}