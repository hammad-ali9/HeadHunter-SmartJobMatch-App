import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:head_hunter/utils/constants/colors.dart';
import 'package:head_hunter/utils/customWidgets/my-text.dart';
import 'package:head_hunter/utils/customWidgets/text-field.dart';
import 'package:head_hunter/utils/extensions/sizebox.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 2.sp),
                          borderRadius: BorderRadius.circular(52.r)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 2.w, horizontal: 2.w),
                        child: CircleAvatar(
                          backgroundImage:
                              const AssetImage('assets/images/seekerIcon.png'),
                          maxRadius: 26.r,
                        ),
                      ),
                    ),
                    10.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: 'Good Morning,',
                          color: midGreyColor,
                          fontWeight: FontWeight.w400,
                          size: 14.sp,
                        ),
                        MyText(
                          text: 'Miles, Esther',
                          color: primaryColor,
                          fontWeight: FontWeight.w600,
                          size: 12.sp,
                        ),
                      ],
                    )
                  ],
                ),
                20.height,
                CustomTextFiled(
                  hintText: "Search for a job or company",
                  isShowPrefixImage: false,
                  isShowPrefixIcon: true,
                  isFilled: true,
                  isBorder: true,
                  borderRadius: 10.r,
                  fillColor: fillColor,
                  prefixIcon: Icons.search,
                ),
                20.height,
                MyText(
                    text: "Category", fontWeight: FontWeight.w400, size: 16.sp),
                20.height,
                Container(
                  width: 70.w,
                  height: 70.h,
                  padding:
                      EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                  decoration: BoxDecoration(
                      border: Border.all(color: borderColor),
                      borderRadius: BorderRadius.circular(20.r)),
                  child: Image.asset(
                    'assets/images/lightning.png',
                    fit: BoxFit.scaleDown,
                  ),
                ),
                20.height,
                MyText(
                    text: "Recommended Jobs",
                    fontWeight: FontWeight.w400,
                    size: 16.sp),
                20.height,
                Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                      border: Border.all(color: borderColor),
                      borderRadius: BorderRadius.circular(12.r)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 48.w,
                            height: 48.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r)),
                            child: Image.asset(
                              'assets/images/lightning.png',
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          10.width,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText(
                                text: 'Chartered Accountant',
                                color: primaryColor,
                                fontWeight: FontWeight.w400,
                                size: 12.sp,
                              ),
                              MyText(
                                text: 'Ecobank Ghana PLC',
                                color: purpleColor,
                                fontWeight: FontWeight.w400,
                                size: 14.sp,
                              ),
                            ],
                          ),
                        ],
                      ),
                      10.height,
                      // const Divider(
                      //   color: borderColor,
                      // ),
                      5.height,
                      Row(
                        children: [
                          SizedBox(
                            height: 48.h,
                            width: 48.w,
                          ),
                          10.width,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText(
                                text: 'Seniors Level',
                                color: purpleColor,
                                fontWeight: FontWeight.w400,
                                size: 14.sp,
                              ),
                              MyText(
                                text: 'Graphic Designer',
                                color: primaryColor,
                                fontWeight: FontWeight.w400,
                                size: 12.sp,
                              ),
                              15.height,
                              _customTag(['100 % Match', '5 Slots Remaining']),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                20.height,
                MyText(
                    text: "Recent Jobs",
                    fontWeight: FontWeight.w400,
                    size: 16.sp),
                20.height,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

_customTag(List<String> text) {
  return Row(
    children: [
      for (int i = 0; i < text.length;) ...{
        Container(
          padding: EdgeInsets.all(8.sp),
          decoration: BoxDecoration(
              color: matchTagColor,
              border: Border.all(color: borderColor),
              borderRadius: BorderRadius.circular(4.r)),
          child: MyText(
            text: text[i],
            size: 12.sp,
            color: purpleColor,
            fontWeight: FontWeight.w400,
          ),
        ),
        5.width,
      }
    ],
  );
}
