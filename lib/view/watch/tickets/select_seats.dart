import 'package:assessment_app/utils/app_colors.dart';
import 'package:assessment_app/view/watch/tickets/payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectSeats extends StatefulWidget {
  const SelectSeats(
      {super.key, required this.movieName, required this.releaseDate});

  final String movieName;
  final String releaseDate;

  @override
  State<SelectSeats> createState() => _SelectSeatsState();
}

class _SelectSeatsState extends State<SelectSeats> {
  List<String> dates = ['5 Mar', '6 Mar', '7 Mar', '8 Mar', '9 Mar'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBarBgColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.white,
        toolbarHeight: 80.sp,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          color: AppColors.primary,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text.rich(
          textAlign: TextAlign.center,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          TextSpan(
            children: [
              TextSpan(
                text: widget.movieName,
                style: GoogleFonts.poppins(
                  color: const Color(0xFF202C43),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),
              ),
              const TextSpan(text: '\n'),
              TextSpan(
                text: 'In theaters december 22, 2021',
                style: GoogleFonts.poppins(
                    color: const Color(0xFF61C3F2),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    height: 2),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        physics: const ClampingScrollPhysics(),
        children: [
          SizedBox(height: 100.sp),
          Text(
            'Date',
            style: GoogleFonts.poppins(
              color: const Color(0xFF202C43),
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              height: 0.08,
            ),
          ),
          SizedBox(height: 16.sp),

          /// List of Dates
          SizedBox(
            height: 35.sp,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemCount: dates.length,
              itemBuilder: (context, index) => Container(
                width: 67.sp,
                height: 32.sp,
                margin: EdgeInsets.only(right: 12.sp),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: ShapeDecoration(
                  color: index == 0
                      ? const Color(0xFF61C3F2)
                      : const Color(0x19A5A5A5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Center(
                  child: Text(
                    dates[index],
                    style: GoogleFonts.poppins(
                      color: index == 0 ? AppColors.white : AppColors.primary,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      height: 0.14,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Payment(
                movieName: widget.movieName,
                releaseDate: widget.releaseDate,
              ),
            ),
          );
        },
        child: Container(
          height: 50.sp,
          margin: EdgeInsets.all(26.sp),
          decoration: ShapeDecoration(
            color: const Color(0xFF61C3F2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Center(
            child: Text(
              'Select Seats',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                height: 0.10,
                letterSpacing: 0.20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
