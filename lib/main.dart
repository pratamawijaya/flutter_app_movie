import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app_playground/di/injection_container.dart' as di;
import 'package:flutter_news_app_playground/di/injection_container.dart';
import 'package:flutter_news_app_playground/domain/entities/movie.dart';
import 'package:flutter_news_app_playground/presentation/home/cubit/nowplaying_cubit.dart';
import 'package:flutter_news_app_playground/presentation/home/cubit/genre_cubit.dart';
import 'package:flutter_news_app_playground/presentation/home/home_screen.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

void main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => sl.get<MainCubit>()),
          BlocProvider(create: (context) => sl.get<GenreCubit>())
        ],
        child: const HomeScreen(),
      ),
    );
  }
}
