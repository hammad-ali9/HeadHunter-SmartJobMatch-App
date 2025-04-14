import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:head_hunter/models/company-model.dart';
import 'package:head_hunter/services/auth-services.dart';
import 'package:head_hunter/utils/constants/app-assets.dart';
import 'package:head_hunter/utils/constants/fonts.dart';
import 'package:head_hunter/utils/extensions/sizebox.dart';

import '../../../models/auth-model.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/customWidgets/my-text.dart';
import '../../../utils/customWidgets/round-button.dart';
import '../../../utils/customWidgets/symetric-padding.dart';
import '../../../utils/customWidgets/text-field.dart';
import '../../../utils/extensions/global-functions.dart';
import '../../../utils/routes/routes-name.dart';


class CompanySignUpView extends StatefulWidget {
  const CompanySignUpView({super.key});

  @override
  State<CompanySignUpView> createState() => _CompanySignUpViewState();
}

class _CompanySignUpViewState extends State<CompanySignUpView> {


  final companyNameController=TextEditingController();
  final numberOfEmployeeController=TextEditingController();
  final locationController=TextEditingController();
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  bool isObscure=true;
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: whiteColor,
      body: SymmetricPadding(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                50.height,

                Center(child: MyText(text: "Sign Up",size: 32.sp,fontWeight: FontWeight.w600,color: primaryColor,)),
                5.height,
                Center(
                  child: MyText(text: "Create a new account by filling these fields",
                    fontFamily: AppFonts.poppins,
                    size: 13.sp,fontWeight: FontWeight.w400,color: blackColor.withOpacity(0.7),),
                ),
                50.height,
                MyText(text: "Company Name",fontWeight: FontWeight.w400,size: 14.sp),
                5.height,
                CustomTextFiled(
                  controller: companyNameController,
                  hintText: "Company Name",
                  isShowPrefixImage: false,
                  isShowPrefixIcon: false,
                  isFilled: true,
                  isBorder: true,
                  borderRadius: 10.r,

                ),

                15.height,
                MyText(text: "Number of Employee",fontWeight: FontWeight.w400,size: 14.sp),
                5.height,
                CustomTextFiled(
                  controller: numberOfEmployeeController,
                  hintText: "Number of Employee",
                  keyboardType: TextInputType.number,
                  isShowPrefixImage: false,
                  isShowPrefixIcon: false,
                  isFilled: true,
                  isBorder: true,
                  borderRadius: 10.r,
                ),
                15.height,
                MyText(text: "Location",fontWeight: FontWeight.w400,size: 14.sp),
                5.height,
                CustomTextFiled(
                  controller: locationController,
                  hintText: "Your Location",
                  keyboardType: TextInputType.text,
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
                  controller: emailController,
                  hintText: "example@gmail",
                  isShowPrefixImage: false,
                  isShowPrefixIcon: false,
                  isFilled: true,
                  isBorder: true,
                  borderRadius: 10.r,
                ),
                15.height,
                MyText(text: "Password",fontWeight: FontWeight.w400,size: 14.sp),
                5.height,
                CustomTextFiled(
                  controller: passwordController,
                  hintText: "Your Password",
                  isShowPrefixImage: false,
                  isShowPrefixIcon: false,
                  isFilled: true,
                  isBorder: true,
                  maxLine: 1,
                  isObscure: isObscure,
                  isPassword: true,
                  beforePasswordIcon: Icons.visibility_off,
                  afterPasswordIcon: Icons.visibility,
                  passwordFunction: (){
                    setState(() {
                      isObscure=!isObscure;
                    });
                  },
                  borderRadius: 10.r,
                ),
                20.height,
                RoundButton(
                    isLoad: true,
                    title: "Register", onTap: (){

                  if(companyNameController.text.isEmpty||
                      numberOfEmployeeController.text.isEmpty||
                      locationController.text.isEmpty||
                      emailController.text.isEmpty||
                      passwordController.text.isEmpty){
                    showSnackbar(context, "Please enter complete detail",color: redColor);
                    return;
                  }
                  var loginModel=AuthModel(email: emailController.text.trim(), password: passwordController.text.trim());
                  var model=CompanyModel(
                      companyId: '',
                      companyName: companyNameController.text.trim(),
                      numberOfEmployee: int.parse(numberOfEmployeeController.text.trim().toString()),
                      location: locationController.text.trim(),
                      email: emailController.text);
                  AuthServices.signUpCompany(loginModel, model, context);

                }),
                20.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: 120.w,
                        child: const Divider()),
                    MyText(text: "Or Continue with",size: 14.sp,color: blackColor.withOpacity(0.7),),
                    SizedBox(
                        width: 120.w,
                        child: const Divider()),
                  ],
                ),
                20.height,
                Container(
                  height: 56.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.r),
                      border: Border.all(
                          color: const Color(0xffDCDEE0)
                      )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppAssets.googleIcon,scale: 1.7,),
                      20.width,
                      MyText(text: "Continue with Google",fontFamily: AppFonts.poppins,fontWeight: FontWeight.w500,
                        size: 16.sp,
                      )
                    ],
                  ),
                ),
                20.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyText(text: "Do you have an account? ",fontWeight: FontWeight.w400,size: 14.sp,),
                    InkWell(
                        onTap: (){
                          Navigator.pushNamedAndRemoveUntil(context, RoutesNames.signInView,(route) => false,);
                        },
                        child: MyText(text: "Sign In",fontWeight: FontWeight.w800,size: 14.sp,color: primaryColor,)),
                  ],
                ),
                20.height
              ],
            ),
          ),
        ),
      ),

    );
  }
}
