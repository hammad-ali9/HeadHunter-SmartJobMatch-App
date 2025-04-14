import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as path;
import 'package:head_hunter/utils/extensions/sizebox.dart';
import 'package:head_hunter/utils/constants/app-assets.dart';
import 'package:head_hunter/utils/constants/colors.dart';
import 'package:head_hunter/utils/customWidgets/my-text.dart';
import 'package:head_hunter/view/splash/splash-services.dart';
// Add these imports at the top of the file
import 'dart:convert'; // For jsonDecode

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  File? _resumeFile;
  String _jobDescription = 'Looking for a Data Scientist with Python and TensorFlow experience'; // Default job description
  double _similarityScore = 0.0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    SplashServices().isLoggedIn(context);
    _fetchSimilarityScore(); // Call API and print similarity score in terminal
  }

  Future<void> _pickResume() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null && result.files.single.path != null) {
      setState(() {
        _resumeFile = File(result.files.single.path!);
      });
    }
  }

  Future<void> _fetchSimilarityScore() async {
    if (_resumeFile == null || _jobDescription.isEmpty) {
      print('Error: Resume PDF or job description is missing');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      var request = http.MultipartRequest('POST', Uri.parse('http://localhost:8000/api/similarity'));
      
      // Add the PDF file from assets
      request.files.add(await http.MultipartFile.fromFile(
        'resume',
        _resumeFile!.path,
      ));

      // Add the job description as form data
      request.fields['job'] = _jobDescription;

      // Send the request
      var response = await request.send();
      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        var data = jsonDecode(responseBody);
        setState(() {
          _similarityScore = data['similarity_score'];
          _isLoading = false;
        });
        print('Similarity Score: ${_similarityScore.toStringAsFixed(2)}%'); // Print to terminal
      } else {
        throw Exception('Failed to get similarity score: ${response.statusCode}');
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print('Error fetching similarity score: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [gradientColorOne, gradientColorTwo],
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            const Spacer(),
            Image.asset(AppAssets.appIcon, scale: 3),
            const Spacer(),
            SpinKitCircle(
              color: whiteColor,
              size: 50.sp,
            ),
            10.height,
          ],
        ),
      ),
    );
  }
}
