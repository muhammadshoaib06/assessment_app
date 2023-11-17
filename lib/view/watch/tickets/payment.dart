import 'package:assessment_app/utils/app_colors.dart';
import 'package:assessment_app/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Payment extends StatefulWidget {
  const Payment(
      {super.key, required this.movieName, required this.releaseDate});

  final String movieName;
  final String releaseDate;

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
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
          onPressed: () => Navigator.pop(context),
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
        children: [],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 26.sp),
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const ClampingScrollPhysics(),
          children: [
            /// Seats
            Row(
              children: [
                Expanded(
                  child: Align(
                    child: SvgPicture.asset(
                      AppImages.seat,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      height: 20.sp,
                      color: const Color(0xFFCD9D0F),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Selected',
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF8F8F8F),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    child: SvgPicture.asset(
                      AppImages.seat,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      height: 20.sp,
                      color: const Color(0xFFDBDBDF),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Not Available',
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF8F8F8F),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.sp),
            Row(
              children: [
                Expanded(
                  child: Align(
                    child: SvgPicture.asset(
                      AppImages.seat,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      height: 20.sp,
                      color: const Color(0xFF564CA3),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'VIP (150\$)',
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF8F8F8F),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    child: SvgPicture.asset(
                      AppImages.seat,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      height: 20.sp,
                      color: const Color(0xFF61C3F2),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Regular (50\$)',
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF8F8F8F),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 32.sp),

            /// Seats Show
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 97.sp,
                height: 35.sp,
                decoration: ShapeDecoration(
                  color: const Color(0x19A5A5A5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text.rich(
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '4 /',
                              style: GoogleFonts.poppins(
                                color: const Color(0xFF202C43),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.20,
                              ),
                            ),
                            TextSpan(
                              text: '3 row',
                              style: GoogleFonts.poppins(
                                color: const Color(0xFF202C43),
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Expanded(child: Icon(Icons.close))
                  ],
                ),
              ),
            ),
            SizedBox(height: 32.sp),

            /// Bottom Row
            Row(
              children: [
                /// Price Widget
                Expanded(
                  child: Container(
                    height: 50.sp,
                    decoration: ShapeDecoration(
                      color: const Color(0x19A5A5A5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: Text.rich(
                        textAlign: TextAlign.left,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Total Price',
                              style: GoogleFonts.poppins(
                                color: const Color(0xFF202C43),
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.20,
                              ),
                            ),
                            const TextSpan(text: '\n'),
                            TextSpan(
                              text: '\$ 50',
                              style: GoogleFonts.poppins(
                                color: const Color(0xFF202C43),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12.sp),

                /// Payment Button Widget
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 50.sp,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF61C3F2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Proceed to pay',
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
