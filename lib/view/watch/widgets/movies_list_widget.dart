import 'package:assessment_app/controller/cubits/movies_list_cubit/movies_list_cubit.dart';
import 'package:assessment_app/controller/data_controller/movies_controller.dart';
import 'package:assessment_app/view/watch/movie_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MoviesListWidget extends StatefulWidget {
  const MoviesListWidget({
    super.key,
  });

  @override
  State<MoviesListWidget> createState() => _MoviesListWidgetState();
}

class _MoviesListWidgetState extends State<MoviesListWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MoviesListCubit, MoviesListState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is MoviesListLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is MoviesListFailure) {
          return Center(
            child: Text(state.error),
          );
        }

        return ListView.builder(
          itemCount: MoviesController.moviesModel!.results.length,
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(vertical: 30.sp, horizontal: 20.sp),
          physics: const ClampingScrollPhysics(),
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieDetail(
                    movieId: MoviesController.moviesModel!.results[index].id
                        .toString(),
                  ),
                ),
              );
            },
            child: Container(
              height: 180.sp,
              margin: EdgeInsets.only(bottom: 20.sp),
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://image.tmdb.org/t/p/w400/${MoviesController.moviesModel!.results[index].posterPath}',
                  ),
                  fit: BoxFit.cover,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 70.sp,
                  width: 1.sw,
                  decoration: ShapeDecoration(
                    gradient: LinearGradient(
                      begin: const Alignment(0.00, -0.88),
                      end: const Alignment(0, 1),
                      colors: [Colors.black.withOpacity(0), Colors.black],
                    ),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.sp),
                      child: Text(
                        MoviesController.moviesModel!.results[index].title,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          height: 0.07,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
