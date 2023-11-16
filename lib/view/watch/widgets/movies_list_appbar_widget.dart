import 'package:assessment_app/controller/cubits/main_page_index_cubit.dart';
import 'package:assessment_app/controller/cubits/movie_search_cubit/movie_search_cubit.dart';
import 'package:assessment_app/controller/cubits/search_cubits/is_movie_search_cubit.dart';
import 'package:assessment_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MoviesAppbarWidget extends StatefulWidget {
  const MoviesAppbarWidget({super.key, required this.pageController});

  final PageController pageController;

  @override
  State<MoviesAppbarWidget> createState() => _MoviesAppbarWidgetState();
}

class _MoviesAppbarWidgetState extends State<MoviesAppbarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.sp,
      padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20.sp),
      decoration: ShapeDecoration(
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: AppColors.appBarBgColor),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Watch',
                style: GoogleFonts.poppins(
                  color: const Color(0xFF202C43),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  widget.pageController.jumpToPage(4);
                  context.read<MainPageIndexCubit>().pageIndex(index: 4);
                },
                icon: const Icon(Icons.search),
                iconSize: 25.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Search TextField AppBar Widget
class SearchTextFieldWidget extends StatelessWidget {
  const SearchTextFieldWidget({
    super.key,
    required this.searchController,
    required this.controller,
  });

  final TextEditingController searchController;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.sp,
      padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20.sp),
      decoration: ShapeDecoration(
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: AppColors.appBarBgColor),
        ),
      ),
      child: SizedBox(
        height: 52.sp,
        child: TextField(
          controller: searchController,
          onChanged: (query) {
            context.read<MovieSearchCubit>().searchMovie(query: query);
            if (query.isNotEmpty) {
              context.read<IsMovieSearchCubit>().isMovieSearch(value: true);
            } else {
              context.read<IsMovieSearchCubit>().isMovieSearch(value: false);
            }
          },
          decoration: InputDecoration(
            hintText: 'TV shows, movies and more',
            hintStyle: GoogleFonts.poppins(
              color: const Color(0x4C202C43),
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(
                color: Color(0xFFEFEFEF),
              ),
            ),
            prefixIcon: Icon(
              Icons.search,
              color: AppColors.primary,
            ),
            suffixIcon: IconButton(
              icon: const Icon(Icons.close),
              color: AppColors.primary,
              onPressed: () {
                controller.jumpToPage(1);
                context.read<MainPageIndexCubit>().pageIndex(index: 1);
                FocusScope.of(context).unfocus();
              },
            ),
          ),
        ),
      ),
    );
  }
}
