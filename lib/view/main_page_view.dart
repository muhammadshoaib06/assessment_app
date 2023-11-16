import 'package:assessment_app/controller/cubits/main_page_index_cubit.dart';
import 'package:assessment_app/utils/app_colors.dart';
import 'package:assessment_app/utils/app_images.dart';
import 'package:assessment_app/view/watch/movie_search.dart';
import 'package:assessment_app/view/watch/movies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPageView extends StatefulWidget {
  const MainPageView({super.key});

  @override
  State<MainPageView> createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
  PageController? pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 1);
    context.read<MainPageIndexCubit>().pageIndex(index: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainPageIndexCubit, int?>(
      builder: (context, selectedIndex) => Scaffold(
        backgroundColor: AppColors.background,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (pageIndex) {},
            children: [
              const Placeholder(
                strokeWidth: 1,
                child: Center(child: Text('Dashboard')),
              ),
              Movies(pageController: pageController!),
              const Placeholder(
                strokeWidth: 1,
                child: Center(child: Text('Media Library')),
              ),
              const Placeholder(
                strokeWidth: 1,
                child: Center(child: Text('More')),
              ),
              MoviesSearch(controller: pageController!),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 75.sp,
          decoration: ShapeDecoration(
            color: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(27),
            ),
          ),
          child: Row(
            children: [
              /// Dashboard
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      pageController!.jumpToPage(0);
                      context.read<MainPageIndexCubit>().pageIndex(index: 0);
                    },
                    child: Text.rich(
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      TextSpan(
                        children: [
                          WidgetSpan(
                            child: SvgPicture.asset(
                              AppImages.dashboard,
                              fit: BoxFit.cover,
                              alignment: Alignment.center,
                              color: selectedIndex == 0
                                  ? AppColors.white
                                  : AppColors.secondary,
                            ),
                            alignment: PlaceholderAlignment.middle,
                          ),
                          const TextSpan(text: '\n'),
                          TextSpan(
                            text: 'Dashboard',
                            style: GoogleFonts.roboto(
                              color: selectedIndex == 0
                                  ? AppColors.white
                                  : AppColors.secondary,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              height: 2.4,
                              letterSpacing: 0.10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              /// Watch
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      pageController!.jumpToPage(1);
                      context.read<MainPageIndexCubit>().pageIndex(index: 1);
                    },
                    child: Text.rich(
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      TextSpan(
                        children: [
                          WidgetSpan(
                            child: SvgPicture.asset(
                              AppImages.watch,
                              fit: BoxFit.cover,
                              alignment: Alignment.center,
                              color: selectedIndex == 1 || selectedIndex == 4
                                  ? AppColors.white
                                  : AppColors.secondary,
                            ),
                            alignment: PlaceholderAlignment.middle,
                          ),
                          const TextSpan(text: '\n'),
                          TextSpan(
                            text: 'Watch',
                            style: GoogleFonts.roboto(
                              color: selectedIndex == 1 || selectedIndex == 4
                                  ? AppColors.white
                                  : AppColors.secondary,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              height: 2.4,
                              letterSpacing: 0.10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              /// Media Library
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      pageController!.jumpToPage(2);
                      context.read<MainPageIndexCubit>().pageIndex(index: 2);
                    },
                    child: Text.rich(
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      TextSpan(
                        children: [
                          WidgetSpan(
                            child: SvgPicture.asset(
                              AppImages.mediaLibrary,
                              fit: BoxFit.cover,
                              alignment: Alignment.center,
                              color: selectedIndex == 2
                                  ? AppColors.white
                                  : AppColors.secondary,
                            ),
                            alignment: PlaceholderAlignment.middle,
                          ),
                          const TextSpan(text: '\n'),
                          TextSpan(
                            text: 'Media Library',
                            style: GoogleFonts.roboto(
                              color: selectedIndex == 2
                                  ? AppColors.white
                                  : AppColors.secondary,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              height: 2.4,
                              letterSpacing: 0.10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              /// More
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      pageController!.jumpToPage(3);
                      context.read<MainPageIndexCubit>().pageIndex(index: 3);
                    },
                    child: Text.rich(
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      TextSpan(
                        children: [
                          WidgetSpan(
                            child: SvgPicture.asset(
                              AppImages.more,
                              fit: BoxFit.cover,
                              alignment: Alignment.center,
                              color: selectedIndex == 3
                                  ? AppColors.white
                                  : AppColors.secondary,
                            ),
                            alignment: PlaceholderAlignment.middle,
                          ),
                          const TextSpan(text: '\n'),
                          TextSpan(
                            text: 'More',
                            style: GoogleFonts.roboto(
                              color: selectedIndex == 3
                                  ? AppColors.white
                                  : AppColors.secondary,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              height: 2.4,
                              letterSpacing: 0.10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
