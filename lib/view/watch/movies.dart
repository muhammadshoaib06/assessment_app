import 'package:assessment_app/controller/cubits/movies_list_cubit/movies_list_cubit.dart';
import 'package:assessment_app/view/watch/widgets/movies_list_appbar_widget.dart';
import 'package:assessment_app/view/watch/widgets/movies_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Movies extends StatefulWidget {
  const Movies({super.key, required this.pageController});

  final PageController pageController;

  @override
  State<Movies> createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  @override
  void initState() {
    context.read<MoviesListCubit>().fetchMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Appbar
        Expanded(
          child: MoviesAppbarWidget(
            pageController: widget.pageController,
          ),
        ),

        /// Movies List
        const Expanded(flex: 7, child: MoviesListWidget()),
      ],
    );
  }
}
