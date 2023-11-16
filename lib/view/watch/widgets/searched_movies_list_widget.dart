import 'package:assessment_app/controller/cubits/movie_search_cubit/movie_search_cubit.dart';
import 'package:assessment_app/controller/data_controller/movies_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchedMoviesListWidget extends StatelessWidget {
  const SearchedMoviesListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 7,
      child: BlocBuilder<MovieSearchCubit, MovieSearchState>(
        builder: (context, state) {
          if (state is MovieSearchLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is MovieSearchFailure) {
            return Center(
              child: Text(state.error),
            );
          }
          return ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 30.sp),
            physics: const ClampingScrollPhysics(),
            children: [
              Text(
                'top results',
                style: GoogleFonts.poppins(
                  color: const Color(0xFF202C43),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Divider(
                color: Colors.grey.withOpacity(0.4),
              ),
              SizedBox(height: 20.sp),

              /// Movies List
              ListView.separated(
                physics: const ClampingScrollPhysics(),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: MoviesController.movieSearchModel!.results.length,
                itemBuilder: (context, index) => Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: 130.sp,
                          height: 100.sp,
                          decoration: ShapeDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w400/${MoviesController.movieSearchModel!.results[index].posterPath}'),
                              fit: BoxFit.fitWidth,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12.sp),
                    Expanded(
                      flex: 3,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text.rich(
                          textAlign: TextAlign.left,
                          softWrap: true,
                          overflow: TextOverflow.visible,
                          TextSpan(
                            children: [
                              TextSpan(
                                text: MoviesController
                                    .movieSearchModel!.results[index].title,
                                style: GoogleFonts.poppins(
                                  color: const Color(0xFF202C43),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const TextSpan(text: '\n'),
                              TextSpan(
                                text: MoviesController.movieSearchModel!
                                    .results[index].originalLanguage,
                                style: GoogleFonts.poppins(
                                  color: const Color(0xFFDBDBDF),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.more_horiz_outlined,
                          color: Color(0xFF61C3F2),
                        ),
                      ),
                    ),
                  ],
                ),
                separatorBuilder: (context, index) {
                  return SizedBox(height: 20.sp);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
