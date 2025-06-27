import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:isomorph_iq_nanda/app/app.bottomsheets.dart';
import 'package:isomorph_iq_nanda/app/app.dialogs.dart';
import 'package:isomorph_iq_nanda/app/app.locator.dart';
import 'package:isomorph_iq_nanda/app/app.router.dart';
import 'package:isomorph_iq_nanda/firebase_options.dart';
import 'package:isomorph_iq_nanda/ui/common/app_themes.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:telegram_web_app/telegram_web_app.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  try {
    if (TelegramWebApp.instance.isSupported) {
      TelegramWebApp.instance.ready();
      Future.delayed(
          const Duration(seconds: 1), TelegramWebApp.instance.expand);
    }
  } catch (e) {
    debugPrint("Error happened in Flutter while loading Telegram $e");
    // add delay for 'Telegram not loading sometimes' bug
    await Future.delayed(const Duration(milliseconds: 200));
    main();
    return;
  }

  setPathUrlStrategy();
  await setupLocator(stackedRouter: stackedRouter);
  await Hive.initFlutter();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (_) => _withDesignSize(const Size(360, 700)),
      desktop: (_) => _withDesignSize(const Size(1920, 1080)),
    ).animate().fadeIn(
          delay: const Duration(milliseconds: 50),
          duration: const Duration(milliseconds: 400),
        );
  }

  Widget _withDesignSize(Size designSize) {
    return ScreenUtilInit(
      designSize: designSize,
      minTextAdapt: true,
      builder: (_, __) => MaterialApp.router(
        scrollBehavior: const MaterialScrollBehavior(),
        theme: AppThemes.getTheme(),
        routerDelegate: stackedRouter.delegate(),
        routeInformationParser: stackedRouter.defaultRouteParser(),
      ),
    );
  }
}
