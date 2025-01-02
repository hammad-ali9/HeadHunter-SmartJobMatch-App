import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:head_hunter/models/job_card_model.dart';
import 'package:head_hunter/utils/constants/colors.dart';
import 'package:head_hunter/utils/customWidgets/home-screen-widgets.dart';
import 'package:head_hunter/utils/customWidgets/my-text.dart';
import 'package:head_hunter/utils/customWidgets/text-field.dart';
import 'package:head_hunter/utils/extensions/sizebox.dart';
import 'package:head_hunter/utils/routes/app-routes.dart';
import 'package:head_hunter/utils/routes/routes-name.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    List<JobCardModel> dummy = [
      JobCardModel(
          imagePath: 'assets/images/lightning.png',
          jobTitle: 'Chartered Accountant',
          companyName: 'Ecobank Ghana PLC',
          level: 'Seniors Level',
          type: 'Graphic Designer',
          tags: ['100 % Match', '5 Slots Remaining']),
      JobCardModel(
          imagePath: 'assets/images/lightning.png',
          jobTitle: 'Chartered Accountant',
          companyName: 'Ecobank Ghana PLC',
          level: 'Seniors Level',
          type: 'Graphic Designer',
          tags: ['100 % Match', '5 Slots Remaining'])
    ];
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
                SizedBox(
                  height: 70.h,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 16.w,
                        childAspectRatio: 1),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return category('assets/images/lightning.png');
                    },
                  ),
                ),
                20.height,
                MyText(
                    text: "Recommended Jobs",
                    fontWeight: FontWeight.w400,
                    size: 16.sp),
                20.height,
                SizedBox(
                  height: 200.h,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 16.w,
                        childAspectRatio: 0.6),
                    itemCount: dummy.length,
                    itemBuilder: (context, index) {
                      final job = dummy[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, RoutesNames.jobDetailView);
                        },
                        child: jobCard(
                          job.imagePath,
                          job.jobTitle,
                          job.companyName,
                          job.level,
                          job.type,
                          job.tags,
                        ),
                      );
                    },
                  ),
                ),
                20.height,
                MyText(
                    text: "Recent Jobs",
                    fontWeight: FontWeight.w400,
                    size: 16.sp),
                20.height,
                for (var job in dummy) ...{
                  jobCard(job.imagePath, job.jobTitle, job.companyName,
                      job.level, job.type, job.tags),
                  10.height,
                }
              ],
            ),
          ),
        ),
      ),
    );
  }
}
