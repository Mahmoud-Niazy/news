import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/components/components.dart';
import 'package:news/news_cubit/news_cubit.dart';
import 'package:news/news_cubit/news_states.dart';

class SportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        return newsList(
        list: NewsCubit.get(context).sport
    );
      },
    );
  }

}