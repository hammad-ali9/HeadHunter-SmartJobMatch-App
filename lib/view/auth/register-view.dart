import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:head_hunter/utils/extensions/sizebox.dart';

import '../../utils/constants/colors.dart';
import '../../utils/customWidgets/my-text.dart';
import '../../utils/customWidgets/round-button.dart';
import '../../utils/customWidgets/symetric-padding.dart';
import '../../utils/customWidgets/text-field.dart';
import '../../utils/routes/routes-name.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      resizeToAvoidBottomInset: false,
      body: SymmetricPadding(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              50.height,
              Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xffD8DADC)
                  )
                ),
                child: const Center(
                  child: Icon(Icons.arrow_back_rounded),
                ),
              ),
              50.height,
              MyText(text: "Register to get started",size: 28.sp,fontWeight: FontWeight.w700,),
               50.height,
               MyText(text: "Username",fontWeight: FontWeight.w400,size: 14.sp),
               5.height,
               CustomTextFiled(
                hintText: "Your username",
                isShowPrefixImage: false,
                isShowPrefixIcon: false,
                isFilled: true,
                isBorder: true,
                borderRadius: 10.r,

              ),
              15.height,
              MyText(text: "Email",fontWeight: FontWeight.w400,size: 14.sp),
              5.height,
              CustomTextFiled(
                hintText: "example@gmail",
                isShowPrefixImage: false,
                isShowPrefixIcon: false,
                isFilled: true,
                isBorder: true,
                borderRadius: 10.r,
              ),
              15.height,
              MyText(text: "Phone Number",fontWeight: FontWeight.w400,size: 14.sp),
              5.height,
              CustomTextFiled(
                hintText: "+923217895131",
                keyboardType: TextInputType.phone,
                isShowPrefixImage: false,
                isShowPrefixIcon: false,
                isFilled: true,
                isBorder: true,
                borderRadius: 10.r,
              ),
              20.height,
              RoundButton(title: "Register", onTap: (){
              }),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(text: "Already have an account? ",fontWeight: FontWeight.w400,size: 14.sp,),
                  MyText(text: "Go Home",fontWeight: FontWeight.w800,size: 14.sp,color: primaryColor,),
                ],
              ),
              20.height
            ],
          ),
        ),
      ),

    );
  }
}
