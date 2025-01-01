import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:head_hunter/main.dart';
import 'package:head_hunter/utils/constants/app-assets.dart';
import 'package:head_hunter/utils/constants/colors.dart';
import 'package:head_hunter/utils/constants/fonts.dart';
import 'package:head_hunter/utils/customWidgets/symetric-padding.dart';
import 'package:head_hunter/utils/customWidgets/text-field.dart';
import 'package:head_hunter/utils/customWidgets/top-widgets.dart';
import 'package:head_hunter/utils/extensions/sizebox.dart';

import '../../utils/customWidgets/my-text.dart';

class ApplicationView extends StatelessWidget {
  const ApplicationView({super.key});
  @override
  Widget build(BuildContext context) {
    List<Map<String,String>> data=[
      {
        'name':'Chartered Accountant',
        'img':AppAssets.dummyCompanyOne,
      },
      {
        'name':'Chartered Accountant',
        'img':AppAssets.dummyCompanyOne,
      },
      {
        'name':'Loans Officer',
        'img':AppAssets.dummyCompanyTwo,
      },
      {
        'name':'Internal Auditor',
        'img':AppAssets.dummyCompanyThree,
      },
    ];
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: SymmetricPadding(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.height,
              const TopWidget(title: "Applications"),
              20.height,
              CustomTextFiled(
                hintText: "Search for a job or company",
                isShowPrefixImage: false,
                prefixIcon: Icons.search,

                isShowPrefixIcon: true,
                isFilled: true,
                isBorder: true,
                borderRadius: 10.r,
              ),
              10.height,
              Expanded(
                  child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context,index){
                var dummyData=data[index];
                return ApplicationSentWidget(
                    companyTitle: dummyData['name'].toString(),
                    imgUrl: dummyData['img'].toString());
              }))


            ],
          ),
        ),
      ),
    );
  }
}
class ApplicationSentWidget extends StatelessWidget {
  final String companyTitle;
  final String imgUrl;
  const ApplicationSentWidget({super.key, required this.companyTitle, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return  Container(
      //height: 104.h,
      margin: EdgeInsets.only(bottom: 10.h),
      width: double.infinity,
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: 1,
                  color:Color(0xffD3DFE7)
              )
          ),
          color: Color(0xffFBFCFE)
      ),
      child: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 48.h,
                  width: 48.w,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      image: DecorationImage(image: AssetImage(imgUrl)),
                      borderRadius: BorderRadius.circular(8.r)
                  ),
                ),
                15.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(text: companyTitle,fontWeight: FontWeight.w500,size: 14.sp,fontFamily: AppFonts.poppins,),
                    2.height,
                    MyText(text: "Ecobank Ghana PLC",fontWeight: FontWeight.w400,
                      size: 12.sp,
                      fontFamily: AppFonts.poppins,
                      color: const Color(0xff858BBD),
                    ),
                    15.height,
                    Container(
                      width: 115.w,
                      height: 24.h,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color:const Color(0xffD3DFE7),
                              width: 2
                          ),
                          borderRadius: BorderRadius.circular(4.r)
                      ),
                      child: Center(
                        child:  MyText(text: "Application sent",
                          fontWeight: FontWeight.w400,
                          size: 12.sp,
                          fontFamily: AppFonts.poppins,
                          color: primaryColor,
                        ),

                      ),
                    )
                  ],
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}
