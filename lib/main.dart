import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news/cashe_helper/cashe_helper.dart';
import 'package:news/dio_helper/dio_helper.dart';
import 'package:news/news_cubit/news_cubit.dart';
import 'package:news/news_layout/news_layout.dart';
import 'app_cubit/app_cubit.dart';
import 'app_cubit/app_states.dart';


void main ()async {
  WidgetsFlutterBinding.ensureInitialized();
  await CasheHelper.Init();
  DioHelper.Init();
  runApp(MyApp());
}
class MyApp extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
   return MultiBlocProvider(
     providers: [
       BlocProvider(create: (context) => NewsCubit()..GetBusinessData()..GetSportData()..GetScienceData()),
       BlocProvider(create: (context)=> AppCubit()),
     ],
     child: BlocConsumer<AppCubit,AppStates>(
       listener: (context,state){},
       builder: (context,state){
         return MaterialApp(
           debugShowCheckedModeBanner: false,
           home: NewsLayout(),
           theme: ThemeData(
             textTheme: TextTheme(
               bodyText1: TextStyle(
                 color: Colors.black,
                 fontSize: 20.0,
                 fontWeight: FontWeight.bold,
                 overflow: TextOverflow.ellipsis,
               ),
             ),
             appBarTheme: AppBarTheme(
               color: Colors.white,
               iconTheme: IconThemeData(
                 color: Colors.black,
               ),
               elevation: 0.0,
               titleTextStyle: TextStyle(
                 color: Colors.black,
                 fontSize: 25.0,
               ),
             ),
             scaffoldBackgroundColor: Colors.white,
             bottomNavigationBarTheme: BottomNavigationBarThemeData(
               backgroundColor: Colors.white,
               elevation: 50.0,
             ),
           ),

           darkTheme: ThemeData(
             scaffoldBackgroundColor: HexColor('333739'),
             appBarTheme: AppBarTheme(
               color: HexColor('333739'),
               elevation: 0.0,
             ),
             bottomNavigationBarTheme: BottomNavigationBarThemeData(
               backgroundColor: HexColor('333739'),
               unselectedItemColor: Colors.grey,
             ),
             textTheme: TextTheme(
               bodyText1: TextStyle(
                 color: Colors.white,
                 fontSize: 20.0,
                 fontWeight: FontWeight.bold,
                 overflow: TextOverflow.ellipsis,
               ),
             ),
           ),

           themeMode: CasheHelper.GetData(key: 'isDark') == true   ? ThemeMode.dark : ThemeMode.light,
         ) ;
       },
     ),
   );
  }

}