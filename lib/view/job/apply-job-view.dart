import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:head_hunter/utils/constants/app-assets.dart';
import 'package:head_hunter/utils/constants/colors.dart';
import 'package:head_hunter/utils/constants/fonts.dart';
import 'package:head_hunter/utils/customWidgets/my-text.dart';
import 'package:head_hunter/utils/customWidgets/round-button.dart';
import 'package:head_hunter/utils/customWidgets/symetric-padding.dart';
import 'package:head_hunter/utils/customWidgets/top-widgets.dart';
import 'package:head_hunter/utils/extensions/sizebox.dart';
import 'package:head_hunter/utils/routes/routes-name.dart';

import '../../utils/customWidgets/text-field.dart';

class ApplyJobView extends StatelessWidget {
  const ApplyJobView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> tags = [
      "Financial Analysis",
      "Portfolio Management",
      "Investment Research",
      "Risk Management",
      "Data Analysis",
      "Excel Proficiency",
      "Communication Skills",
      "Analytical Thinking",
    ];

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(child: SymmetricPadding(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          20.height,
         const TopWidget(title: "Apply"),
          20.height,
          Container(
            // height: 204.h,
            width: double.infinity,
            decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(12.r)
            ),
            child: Column(
              children: [
                20.height,
                Container(
                  height: 48.h,
                  width: 48.w,
                  decoration: BoxDecoration(
                      image: const DecorationImage(image: AssetImage(AppAssets.dummyCompanyTwo)),
                      borderRadius: BorderRadius.circular(8.r)
                  ),
                ),
                10.height,
                MyText(text: "Asset Management Analyst",color: whiteColor,fontWeight: FontWeight.w600,size: 14.sp,),
                3.height,
                MyText(text: "Calbank PLC",color: whiteColor,fontWeight: FontWeight.w400,size: 14.sp,fontFamily: AppFonts.poppins,),
                10.height,
                SizedBox(
                  width: 180.w,
                  child: const Divider(
                    color: whiteColor,
                  ),
                ),
                10.height,
                Container(
                  height: 24.h,
                  width: 133.w,
                  decoration: BoxDecoration(
                      color: const Color(0xffE9F0F4),
                      borderRadius: BorderRadius.circular(4.r)
                  ),
                  child: Center(
                    child:  MyText(text: "5 Slots Remaining",
                      color: const Color(0xff5E5E5E),fontWeight: FontWeight.w400,size: 14.sp,fontFamily: AppFonts.poppins,),

                  ),
                ),
                10.height,
                MyText(text: "Posted on April 19, 2024 | Ends Sept 27, 2024",color: whiteColor,fontWeight: FontWeight.w400,size: 14.sp,fontFamily: AppFonts.poppins,),
                20.height,
              ],
            ),
          ),
          20.height,
          MyText(text: "Upload File",size: 14.sp,fontFamily: AppFonts.poppins,),
          MyText(text: "Information",size: 14.sp,fontFamily: AppFonts.poppins,),
          10.height,
          CustomTextFiled(
            hintText: "Explain why you are the right person for this job ?",
            maxLine: 10,
            isShowPrefixImage: false,
            isShowPrefixIcon: false,
            isFilled: true,
            isBorder: true,

            borderRadius: 10.r,
          ),
          20.height,

          const Spacer(),
          RoundButton(title: "Apply", onTap: (){
            showDialog(context: context, builder: (context){
              return const Dialog(

                backgroundColor: whiteColor,
                child: AppliedSuccessDialog(),
              );
            });
          }),
          20.height,


        ],
      ))),
    );
  }
}
class AppliedSuccessDialog extends StatelessWidget {
  const AppliedSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        10.height,
        Image.asset(AppAssets.tickIcon,scale: 3,),
        10.height,
        Text("Applied Successfully!",style: GoogleFonts.kronaOne(
            fontSize: 18.sp,
            color: primaryColor,
            fontWeight: FontWeight.w400
        ),),
        2.height,
        MyText(text: "You have successfully applied for the job. ",fontFamily: AppFonts.poppins,size: 12.sp,fontWeight: FontWeight.w500,color: const Color(0xff949494),),
        10.height,
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 15.w),
          child: RoundButton(
              title: "Go to Home", onTap: (){
           // Navigator.pushNamed(context, RoutesNames.bottomNav);

          }),
        ),
        10.height,

      ],
    );
  }
}

