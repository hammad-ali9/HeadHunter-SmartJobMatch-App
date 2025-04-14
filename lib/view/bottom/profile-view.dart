import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:head_hunter/main.dart';
import 'package:head_hunter/services/auth-services.dart';
import 'package:head_hunter/utils/constants/app-assets.dart';
import 'package:head_hunter/utils/constants/colors.dart';
import 'package:head_hunter/utils/customWidgets/symetric-padding.dart';
import 'package:head_hunter/utils/extensions/sizebox.dart';

import '../../utils/constants/fonts.dart';
import '../../utils/customWidgets/my-text.dart';
import '../../utils/customWidgets/top-widgets.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
          child: SymmetricPadding(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          20.height,
          const TopWidget(title: "Profile"),
          20.height,
          Row(
            children: [
              Container(
                height: 52.h,
                width: 52.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: const DecorationImage(image: AssetImage(AppAssets.dummyCompanyTwo)),
                  border: Border.all(
                    color: primaryColor,
                    width: 2,
                  )
                ),
              ),
             14.width,
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 MyText(text: "Black, Marvin",fontWeight: FontWeight.w600,size: 16.sp,),
                 2.height,
                 MyText(text: "Loan Officer | GTBank Ghana",fontWeight: FontWeight.w400,
                   size: 12.sp,
                   fontFamily: AppFonts.poppins,
                   color: const Color(0xff858BBD),
                 ),
               ],
             )
            ],
          ),
          30.height,
          const ProfileWidget(title: "FURC", iconUrl: AppAssets.furcIcon),
          const ProfileWidget(title: "Account", iconUrl: AppAssets.accountIcon),
          const ProfileWidget(title: "Help", iconUrl: AppAssets.helpIcon),
           ProfileWidget(title: "Log Out", iconUrl: AppAssets.logOutIcon,scale: 3,
          onPressed: (){
           AuthServices.signOutUser(context);
          },
          ),

        ],
      )))
    );
  }
}
class ProfileWidget extends StatelessWidget {
  final String title;
  final String iconUrl;
  final VoidCallback? onPressed;
  final double? scale;
  const ProfileWidget({super.key, required this.title, required this.iconUrl, this.onPressed,this.scale});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onPressed,
      child: Container(
        height: 48.h,
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 15.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
                color: const Color(0xffA7ACD7),
                width: 2
            )
        ),
        child: Row(
          children: [
            20.width,
            Image.asset(iconUrl,scale: scale??2,),
            10.width,
            MyText(text: title,fontFamily: AppFonts.poppins,size: 14.sp,fontWeight: FontWeight.w400)
          ],
        ),
      ),
    );
  }
}
