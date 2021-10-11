import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app_playground/core/usecase/usecase.dart';
import 'package:flutter_news_app_playground/di/injection_container.dart' as di;
import 'package:flutter_news_app_playground/di/injection_container.dart';
import 'package:flutter_news_app_playground/domain/entities/movie.dart';
import 'package:flutter_news_app_playground/domain/usecases/get_now_playing.dart';
import 'package:flutter_news_app_playground/main_cubit.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Testing"),
      ),
      body: Center(
        child: BlocBuilder<MainCubit, MainState>(
          builder: (context, state) {
            if (state is Loading) {
              return const CircularProgressIndicator();
            } else if (state is Loaded) {
              final movie = state.movie;
              return Column(
                children: [
                  Text("Title : ${movie.elementAt(0).title}"),
                  Text("backdrop : ${movie.elementAt(0).poster}")
                ],
              );
            } else {
              return const Text("");
            }
          },
        ),
      ),
    );
  }
}
