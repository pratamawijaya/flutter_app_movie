import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app_playground/di/injection_container.dart';
import 'package:flutter_news_app_playground/domain/entities/genre.dart';
import 'package:flutter_news_app_playground/presentation/home/cubit/genre_cubit.dart';

class BuildCategoryWidget extends StatefulWidget {
  final int selectedGenre;

  const BuildCategoryWidget({Key? key, this.selectedGenre = 28})
      : super(key: key);

  @override
  _BuildCategoryWidgetState createState() => _BuildCategoryWidgetState();
}

class _BuildCategoryWidgetState extends State<BuildCategoryWidget> {
  late int selectedGenre;

  @override
  void initState() {
    super.initState();
    selectedGenre = widget.selectedGenre;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: BlocProvider.of<GenreCubit>(context)..fetchGenre(),
        builder: (context, state) {
          if (state is GenreLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GenreLoaded) {
            List<Genre> listGenre = state.genres;
            return SizedBox(
              height: 45,
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) =>
                    const VerticalDivider(
                  color: Colors.transparent,
                  width: 5,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: listGenre.length,
                itemBuilder: (context, index) {
                  Genre genre = listGenre[index];
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            Genre genre = listGenre[index];
                            selectedGenre = genre.id;
                            //
                            sl.get<GenreCubit>().selectGenre(selectedGenre);
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black45,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(25),
                            ),
                            color: (genre.id == selectedGenre)
                                ? Colors.black45
                                : Colors.white,
                          ),
                          child: Text(
                            genre.name.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          } else {
            return Container();
          }
        });
  }
}
