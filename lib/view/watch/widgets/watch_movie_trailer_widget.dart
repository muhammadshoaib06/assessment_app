import 'package:assessment_app/controller/cubits/get_movie_trailer_video_key/get_movie_trailer_video_key_cubit.dart';
import 'package:assessment_app/controller/data_controller/movies_controller.dart';
import 'package:assessment_app/utils/app_colors.dart';
import 'package:assessment_app/view/watch/movie_trailer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class WatchTrailerButtonWidget extends StatelessWidget {
  const WatchTrailerButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          context.read<GetMovieTrailerVideoKeyCubit>().getTrailerKey(
                movieId: MoviesController.movieDetailModel!.id.toString(),
              );
        },
        child: Container(
          width: 243.sp,
          height: 50.sp,
          margin: EdgeInsets.only(top: 14.sp),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0xFF61C3F2)),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Center(
            child: BlocConsumer<GetMovieTrailerVideoKeyCubit,
                GetMovieTrailerVideoKeyState>(
              listener: (context, gettingMovieTrailerState) {
                if (gettingMovieTrailerState
                    is GetMovieTrailerVideoKeySuccess) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieTrailer(
                        videoKey:
                            MoviesController.movieVideosModel!.results[0].key,
                      ),
                    ),
                  );
                } else if (gettingMovieTrailerState
                    is GetMovieTrailerVideoKeyFailure) {
                  ScaffoldMessenger.of(context)
                    ..removeCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                        content: Text(gettingMovieTrailerState.error),
                      ),
                    );
                }
              },
              builder: (context, gettingMovieTrailerState) {
                if (gettingMovieTrailerState
                    is GetMovieTrailerVideoKeyLoading) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.white,
                    ),
                  );
                } else if (gettingMovieTrailerState
                    is GetMovieTrailerVideoKeyFailure) {
                  return Center(
                    child: Text(gettingMovieTrailerState.error),
                  );
                }

                return Text.rich(
                  textAlign: TextAlign.center,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(
                          Icons.play_arrow,
                          color: AppColors.white,
                          size: 25.sp,
                        ),
                        alignment: PlaceholderAlignment.middle,
                      ),
                      const TextSpan(text: '  '),
                      TextSpan(
                        text: 'Watch Trailer',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.20,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
