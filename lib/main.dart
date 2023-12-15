import 'package:arab_therapy_task/core/consts/app_constants.dart';
import 'package:arab_therapy_task/routes/app_pages.dart';
import 'package:arab_therapy_task/core/utils/translations/translation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'core/consts/themes.dart';
import 'core/utils/translations/translations_assets_reader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:intl/date_symbol_data_local.dart';


Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await TranslationsAssetsReader.initialize();
  initializeDateFormatting();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
    statusBarColor: Colors.transparent,
  ));
  const int primaryGoldenValue = 0xff885EFE;

  const MaterialColor primaryGolden = MaterialColor(
    primaryGoldenValue,
    <int, Color>{
      50: Color(0xFF000000),
      100: Color(0xFF000000),
      200: Color(0xFF000000),
      300: Color(0xFF000000),
      400: Color(0xFF000000),
      500: Color(primaryGoldenValue),
      600: Color(0xFF000000),
      700: Color(0xFF000000),
      800: Color(0xFF000000),
      900: Color(0xFF000000),
    },
  );

  runApp(
    ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: "TADREAB",
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          translations: Translation(),
          locale: const Locale('ar'),
          fallbackLocale: const Locale('ar'),
          themeMode: ThemeMode.system,
          theme: ThemeData(
            primarySwatch: primaryGolden,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            fontFamily: AppConstants.fontFamily,
          ),
        );
      },
    ),
  );
}
