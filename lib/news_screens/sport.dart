import 'package:flutter/material.dart';
import 'package:news/components/components.dart';
import 'package:news/news_cubit/news_cubit.dart';

class SportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return News(
        list: NewsCubit.get(context).sport
    );
  }

}