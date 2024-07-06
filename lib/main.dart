import 'package:architecture/config/init_app_config.dart';
import 'package:architecture/config/localization/locale_controller/locale_controller.dart';
import 'package:architecture/config/theme/theme_controller/theme_controller.dart';
import 'package:architecture/config/theme/theme_manager/theme_dark.dart';
import 'package:architecture/config/theme/theme_manager/theme_light.dart';
import 'package:architecture/core/routes/app_router.dart';
import 'package:architecture/utils/preferences/shared_preferences_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InitAppConfig.initialize();
  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localeProvider = ref.watch(localeControllerProvider);
    final themeMode = ref.watch(themeControllerProvider);

    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeLight.lightTheme,
      darkTheme: ThemeDark.darkTheme,
      themeMode: themeMode,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate,
      ],
      locale: localeProvider,
      routerConfig: GoRouterConfig.routerConfig,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}

