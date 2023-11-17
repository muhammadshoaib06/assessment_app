import 'dart:math';

import 'package:assessment_app/controller/cubits/movie_detail_cubit/movie_detail_cubit.dart';
import 'package:assessment_app/controller/data_controller/movies_controller.dart';
import 'package:assessment_app/utils/app_colors.dart';
import 'package:assessment_app/view/watch/tickets/select_seats.dart';
import 'package:assessment_app/view/watch/widgets/watch_movie_trailer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class MovieDetail extends StatefulWidget {
  const MovieDetail({
    super.key,
    required this.movieId,
  });

  final String movieId;

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  void initState() {
    hitMovieDetailAPI();
    super.initState();
  }

  void hitMovieDetailAPI() {
    context.read<MovieDetailCubit>().movieDetails(movieId: widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocConsumer<MovieDetailCubit, MovieDetailState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is MovieDetailLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is MovieDetailFailure) {
            return Center(
              child: Text(state.error),
            );
          }
          return ListView(
            physics: const ClampingScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            children: [
              /// Movie Title
              Container(
                height: 450.sp,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://image.tmdb.org/t/p/w500/${MoviesController.movieDetailModel!.posterPath}',
                    ),
                    fit: BoxFit.cover,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                /// Second Container for Shade on the Movie Poster
                child: Container(
                  height: 360.sp,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: const Alignment(0.00, 1.00),
                      end: const Alignment(0, -1),
                      colors: [Colors.black, Colors.black.withOpacity(0)],
                    ),
                  ),
                  child: SafeArea(
                    child: ListView(
                      shrinkWrap: true,
                      padding: EdgeInsets.all(13.sp),
                      physics: const ClampingScrollPhysics(),
                      children: [
                        /// Appbar
                        Row(
                          children: [
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: IconButton(
                                  onPressed: () => Navigator.pop(context),
                                  icon: const Icon(
                                      Icons.arrow_back_ios_new_rounded),
                                  iconSize: 25.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Watch',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    height: 0.08,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 160.sp),

                        /// Movie Title
                        Center(
                          child: Text(
                            MoviesController.movieDetailModel!.title,
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),

                        /// Movie Release Date
                        Center(
                          child: Text(
                            'In theaters ${DateFormat.yMMMMd().format(MoviesController.movieDetailModel!.releaseDate)}',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(height: 16.sp),

                        /// Get Tickets Button
                        GetTicketButtonWidget(
                          movieName: MoviesController.movieDetailModel!.title,
                          releaseDate: DateFormat.yMMMMd().format(
                              MoviesController.movieDetailModel!.releaseDate),
                        ),

                        /// Watch Trailer
                        const WatchTrailerButtonWidget(),
                      ],
                    ),
                  ),
                ),
              ),

              /// Movie Details
              ListView(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                padding: EdgeInsets.only(left: 40.sp, right: 40.sp, top: 25.sp),
                children: [
                  Text(
                    'Genres',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF202C43),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10.sp),

                  /// Movie Genres List
                  const MovieGenresListWidget(),

                  Divider(
                    height: 40.sp,
                    color: Colors.grey.withOpacity(0.3),
                  ),

                  Text(
                    'Overview',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF202C43),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  /// Movie Overview Text
                  Text(
                    MoviesController.movieDetailModel!.overview,
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF8F8F8F),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

/// Get Ticket Button Widget
class GetTicketButtonWidget extends StatelessWidget {
  const GetTicketButtonWidget({
    super.key,
    required this.movieName,
    required this.releaseDate,
  });

  final String movieName;
  final String releaseDate;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SelectSeats(
              movieName: movieName,
              releaseDate: releaseDate,
            ),
          ),
        ),
        child: Container(
          width: 243.sp,
          height: 50.sp,
          decoration: ShapeDecoration(
            color: const Color(0xFF61C3F2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Center(
            child: Text(
              'Get Tickets',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Movie Genres List Widget
class MovieGenresListWidget extends StatelessWidget {
  const MovieGenresListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24.sp,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: MoviesController.movieDetailModel!.genres.length,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (BuildContext context, int genresIndex) {
          final Random random = Random();

          Color randomColor() {
            return Color.fromRGBO(
              random.nextInt(256),
              random.nextInt(256),
              random.nextInt(256),
              1.0,
            );
          }

          return Container(
            margin: EdgeInsets.only(right: 5.sp),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: ShapeDecoration(
              color: randomColor(),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Center(
              child: Text(
                MoviesController.movieDetailModel!.genres[genresIndex].name,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  height: 0.14,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
