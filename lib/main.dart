import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geodetect/config/constants/app_assets.dart';
import 'package:geodetect/config/constants/app_constants.dart';
import 'package:geodetect/config/constants/app_locale.dart';
import 'package:geodetect/screen/dashboard/dashboard_screen.dart';
import 'package:geodetect/shared/bloc/image_location/image_location_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  runApp(
    EasyLocalization(
        supportedLocales: AppLocale.supportedLocales,
        path: AppAssets.translations,
        fallbackLocale: AppLocale.fallbackLocale,
        child: BlocProvider(
          create: (context) => ImageLocationBloc(),
          child: const GeodetectApp(),
        )),
  );
}

class GeodetectApp extends StatelessWidget {
  const GeodetectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      // showPerformanceOverlay: true,
      // debugShowMaterialGrid: true,
      // showSemanticsDebugger: true,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ),
      themeMode: ThemeMode.light,
      home: const DashboardScreen(),
    );
  }
}
