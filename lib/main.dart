import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:head_hunter/providers/loading-provider.dart';
import 'package:head_hunter/providers/sign-up-provider.dart';
import 'package:head_hunter/utils/constants/fonts.dart';
import 'package:head_hunter/utils/constants/load-assets.dart';
import 'package:head_hunter/utils/routes/app-routes.dart';
import 'package:head_hunter/utils/routes/routes-name.dart';
import 'package:head_hunter/view/bottom/home-view.dart';
import 'package:head_hunter/view/job/job-detail-view.dart';
import 'package:provider/provider.dart';

import 'bottomNav/bottomNav.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await preloadImages();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => LoadingProvider()),
      ChangeNotifierProvider(create: (_) => SignUpProvider()),

    ],
      child: ScreenUtilInit(
        designSize:  const Size(393, 852),
        minTextAdapt: true,
        splitScreenMode: true,
        child: GestureDetector(
          onTap: (){
            FocusManager.instance.primaryFocus!.unfocus();
          },
          child: MaterialApp(
            title: 'Path Vision',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
                fontFamily: AppFonts.monserrat
            ),
            ///home: JobDetailView(),
            initialRoute: RoutesNames.splashView,
            onGenerateRoute: Routes.generateRoute,    ),
        ),
      ),

    );
  }
}
