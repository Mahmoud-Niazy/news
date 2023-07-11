import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cashe_helper/cashe_helper.dart';
import 'package:news/components/components.dart';
import 'package:news/news_cubit/news_cubit.dart';
import 'package:news/news_cubit/news_states.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: (Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    label: Text(
                      'search',
                      style: TextStyle(
                        color: CasheHelper.GetData(key: 'isDark')? Colors.white :Colors.black
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: CasheHelper.GetData(key: 'isDark')
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    print(value);
                    NewsCubit.get(context).GetSearchData(value.toString());
                  },
                ),
                Expanded(child: newsList(list: NewsCubit.get(context).search)),
              ],
            )),
          ),
        );
      },
    );
  }
}
