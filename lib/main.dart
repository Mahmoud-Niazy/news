import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cashe_helper/cashe_helper.dart';
import 'package:news/dio_helper/dio_helper.dart';
import 'package:news/news_cubit/news_cubit.dart';
import 'package:news/news_cubit/news_states.dart';
import 'package:news/news_layout/news_layout.dart';
import 'package:news/themes.dart';



void main ()async {
  WidgetsFlutterBinding.ensureInitialized();
  await CasheHelper.Init();
  DioHelper.Init();
  runApp(MyApp());
}
class MyApp extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
   return BlocProvider(
     create: (context) => NewsCubit()..GetBusinessData()..GetSportData()..GetScienceData(),
     child: BlocConsumer<NewsCubit,NewsStates>(
       listener: (context,state){},
       builder: (context,state){
         return MaterialApp(
           debugShowCheckedModeBanner: false,
           home: NewsLayout(),
           theme: lightTheme,
           darkTheme: darkTheme,
           themeMode: CasheHelper.GetData(key: 'isDark') ? ThemeMode.dark : ThemeMode.light,
         );
       },
     ),
   );
  }

}