import 'package:assessment_app/controller/cubits/get_movie_trailer_video_key/get_movie_trailer_video_key_cubit.dart';
import 'package:assessment_app/controller/cubits/main_page_index_cubit.dart';
import 'package:assessment_app/controller/cubits/movie_detail_cubit/movie_detail_cubit.dart';
import 'package:assessment_app/controller/cubits/movie_search_cubit/movie_search_cubit.dart';
import 'package:assessment_app/controller/cubits/movies_category_cubit/movies_category_cubit.dart';
import 'package:assessment_app/controller/cubits/movies_list_cubit/movies_list_cubit.dart';
import 'package:assessment_app/controller/cubits/search_cubits/is_movie_search_cubit.dart';
import 'package:assessment_app/view/main_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) => child!,
      child: MultiBlocProvider(
        providers: [
          /// Main Page View Index Cubit
          BlocProvider(
            create: (context) => MainPageIndexCubit(),
          ),

          /// Movies List Cubit
          BlocProvider(
            create: (context) => MoviesListCubit(),
          ),

          /// Movie Detail Cubit
          BlocProvider(
            create: (context) => MovieDetailCubit(),
          ),

          /// Get Movie Video KEY Cubit
          BlocProvider(
            create: (context) => GetMovieTrailerVideoKeyCubit(),
          ),

          /// Fetching Movies Category Cubit
          BlocProvider(
            create: (context) => MoviesCategoryCubit(),
          ),

          /// Search Movies Cubit
          BlocProvider(
            create: (context) => MovieSearchCubit(),
          ),

          /// Is Search Movie Cubit
          BlocProvider(
            create: (context) => IsMovieSearchCubit(),
          ),
        ],
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: MaterialApp(
            title: 'Flutter Assessment App',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            builder: (context, widget) => MediaQuery(
              /// Setting font does not change with system font size
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: widget!,
            ),
            home: const MainPageView(),
          ),
        ),
      ),
    );
  }
}
