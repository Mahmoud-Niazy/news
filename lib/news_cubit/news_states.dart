import 'package:news/news_cubit/news_cubit.dart';

abstract class NewsStates {}
class NewsInitialState extends NewsStates {}

class BottomNavState extends NewsStates {}

class GetBusinessDataSuccessfullyState extends NewsStates {}
class GetBusinessDataErrorState extends NewsStates {}

class GetSportDataSuccessfullyState extends NewsStates {}
class GetSportDataErrorState extends NewsStates {}

class GetScienceDataSuccessfullyState extends NewsStates {}
class GetScienceDataErrorState extends NewsStates {}

class GetSearchDataSuccessfullyState extends NewsStates {}
class GetSearchDataErrorState extends NewsStates {}

