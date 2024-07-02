import 'package:architecture/config/init_app_config.dart';
import 'package:architecture/config/localization/locale_provider/locale_provider.dart';
import 'package:architecture/config/theme/theme_manager/theme_dark.dart';
import 'package:architecture/config/theme/theme_manager/theme_light.dart';
import 'package:architecture/config/theme/theme_provider/theme_provider.dart';
import 'package:architecture/core/networking/dio_client.dart';
import 'package:architecture/core/routes/app_router.dart';
import 'package:architecture/data/repository/repository_impl.dart';
import 'package:architecture/domain/repository/repository_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  await InitAppConfig.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(create: (_) =>  ThemeProvider(InitAppConfig.themeMode)),
        ChangeNotifierProvider<LocaleProvider>(create: (_) => LocaleProvider(InitAppConfig.locale)),
        Provider<RepositoryInterface>(
          create: (_) {
            RepositoryInterface repositoryInterface = RepositoryImpl(dioClient: DioClient());
            return repositoryInterface;
          },
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeLight.lightTheme,
      darkTheme: ThemeDark.darkTheme,
      themeMode: context.watch<ThemeProvider>().themeMode,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate,
      ],
      locale: context.watch<LocaleProvider>().locale,
      routerConfig: GoRouterConfig.routerConfig,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
