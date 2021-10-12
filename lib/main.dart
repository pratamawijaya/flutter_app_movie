import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app_playground/di/injection_container.dart' as di;
import 'package:flutter_news_app_playground/di/injection_container.dart';
import 'package:flutter_news_app_playground/domain/entities/movie.dart';
import 'package:flutter_news_app_playground/main_cubit.dart';
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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => sl.get<MainCubit>(),
        child: const HomeScreen(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PagingController<int, Movie> _pagingController =
      PagingController(firstPageKey: 1);

  final _mainCubit = sl.get<MainCubit>();
  List<Movie> listMovie = [];

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      _mainCubit.fetchNowPlaying(pageKey);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pagingController.dispose();
  }

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
              listMovie = state.movie;
              return ListView.builder(
                  itemCount: listMovie.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 120,
                            height: 180,
                            child: Image.network(
                              "https://image.tmdb.org/t/p/w500/${listMovie.elementAt(index).poster}",
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 1,
                          ),
                          Expanded(
                            child: Text(
                              listMovie.elementAt(index).title,
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            } else {
              return const Text("Error");
            }
          },
        ),
      ),
    );
  }
}
