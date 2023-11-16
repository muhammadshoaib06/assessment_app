import 'package:assessment_app/controller/cubits/movies_category_cubit/movies_category_cubit.dart';
import 'package:assessment_app/controller/data_controller/movies_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MoviesCategoriesWidget extends StatelessWidget {
  const MoviesCategoriesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 7,
      child: BlocConsumer<MoviesCategoryCubit, MoviesCategoryState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is MoviesCategoryLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is MoviesCategoryFailure) {
            return Center(
              child: Text(state.error),
            );
          }
          return GridView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20.sp),
            itemCount: MoviesController.movieCategoryModel!.genres.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 1.30),
            itemBuilder: (context, index) {
              return Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
                decoration: ShapeDecoration(
                  color: Colors.black.withOpacity(0.3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    MoviesController.movieCategoryModel!.genres[index].name,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
