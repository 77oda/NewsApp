import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/Bloc_Observer.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';
import 'package:news_app/shared/styles/themes.dart';

import 'layout/news_app/cubit/cubit.dart';
import 'layout/news_app/cubit/states.dart';
import 'layout/news_app/news_layout.dart';





void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark=CacheHelper.getData(key: 'isDark');


  runApp(MyApp(isDark: isDark,));
}

class MyApp extends StatelessWidget {

  final bool? isDark;

  MyApp({
      this.isDark,
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..getBusiness()..getScience()..getSports()..changeMode(fromCache: isDark)  ,
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context,state){},
        builder: (context,state){
          return MaterialApp(
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode:NewsCubit.get(context).appMode,
            home:NewsLayout() ,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}



