import 'dart:ui';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:head_hunter/utils/constants/app-assets.dart';
import 'package:head_hunter/utils/constants/colors.dart';
import 'package:head_hunter/utils/customWidgets/my-text.dart';
import 'package:head_hunter/utils/customWidgets/round-button.dart';
import 'package:head_hunter/utils/extensions/sizebox.dart';
import 'package:head_hunter/utils/routes/routes-name.dart';


class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  Future<double> calculateSimilarity(String resumePath, String jobDescription) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://your-api-url/api/similarity'),
    );

    request.files.add(await http.MultipartFile.fromPath('resume', resumePath));
    request.fields['job_description'] = jobDescription;

    var response = await request.send();
    if (response.statusCode == 200) {
      var responseData = await response.stream.toBytes();
      var jsonResponse = json.decode(String.fromCharCodes(responseData));
      return jsonResponse['similarity_score'];
    } else {
      throw Exception('Failed to calculate similarity');
    }
  }

  @override
  Widget build(BuildContext context) {
    String resumePath = 'path/to/resume.pdf';
    String jobDescription = 'Your job description here';

    return Scaffold(
      backgroundColor: Color(0xffDAF2FF),
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Image.asset(AppAssets.mobileIcon,scale: 3,)),
          Positioned(
              left: 0,
              right: 0,
              top: 200,
              child: Image.asset(AppAssets.jobCardIcon,scale: 3,)),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 307.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                )
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    10.height,
                RichText(
                text: TextSpan(
                text: 'Your ',
                  style: TextStyle(
                    color: blackColor,
                    fontSize: 37.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Dream job ',
                      style: TextStyle(
                        color: blackColor,
                        fontSize: 37.sp,
                        fontWeight: FontWeight.w600,
                      ),                    ),
                    TextSpan(
                      text: 'is ',
                      style: TextStyle(
                        color: blackColor,
                        fontSize: 37.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),  TextSpan(
                      text: 'waiting for you!',
                      style: TextStyle(
                        color: blackColor,
                        fontSize: 37.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
                    20.height,

                    MyText(
                      overflow: TextOverflow.clip,
                      text: "Mauris urna velit, congue et aliquam non, imperdiet id massa. Etiam commodo ",
                    size: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff767E94),
                    ),
                    30.height,
                    RoundButton(
                        isShowIcon: true,
                        title: "Get Started", onTap: (){
                          Navigator.pushNamed(context, RoutesNames.signInView);
                    })
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: FutureBuilder<double>(
              future: calculateSimilarity(resumePath, jobDescription),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Text(
                    'Similarity Score: ${snapshot.data?.toStringAsFixed(2)}%',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
