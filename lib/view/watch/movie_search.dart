import 'package:assessment_app/controller/cubits/movies_category_cubit/movies_category_cubit.dart';
import 'package:assessment_app/controller/cubits/search_cubits/is_movie_search_cubit.dart';
import 'package:assessment_app/view/watch/widgets/movies_categories_widget.dart';
import 'package:assessment_app/view/watch/widgets/movies_list_appbar_widget.dart';
import 'package:assessment_app/view/watch/widgets/searched_movies_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesSearch extends StatefulWidget {
  const MoviesSearch({super.key, required this.controller});

  final PageController controller;

  @override
  State<MoviesSearch> createState() => _MoviesSearchState();
}

class _MoviesSearchState extends State<MoviesSearch> {
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    context.read<MoviesCategoryCubit>().fetchMoviesCategory();
    context.read<IsMovieSearchCubit>().isMovieSearch(value: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IsMovieSearchCubit, bool?>(
      builder: (context, movieSearchState) {
        return Column(
          children: [
            /// Appbar
            Expanded(
              child: SearchTextFieldWidget(
                searchController: searchController,
                controller: widget.controller,
              ),
            ),

            /// Movies Category List
            if (movieSearchState!)

              /// Movies list when user search a query!
              const SearchedMoviesListWidget()
            else

              /// Movies Categories Showing
              const MoviesCategoriesWidget(),
          ],
        );
      },
    );
  }
}
