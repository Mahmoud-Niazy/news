import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cashe_helper/cashe_helper.dart';
import 'app_states.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);


  bool is_dark = false ;
  ChangeMode(context){
    is_dark = !is_dark ;
    CasheHelper.SvaeData(key: 'isDark', value: is_dark).then((value){
      emit(ChangeModeState());

    });
  }
}