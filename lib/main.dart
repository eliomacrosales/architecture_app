import 'package:architecture/config/init_app_config.dart';
import 'package:architecture/config/localization/locale_provider/local_state_provider.dart';
import 'package:architecture/config/theme/theme_manager/theme_dark.dart';
import 'package:architecture/config/theme/theme_manager/theme_light.dart';
import 'package:architecture/config/theme/theme_provider/theme_provider.dart';
import 'package:architecture/core/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final locale = await InitAppConfig.initialize();
  runApp(ProviderScope(child: MyApp(locale: locale)));
}

class MyApp extends ConsumerWidget {
  final String locale;

  const MyApp({super.key, required this.locale});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localeProvider = ref.watch(localeStateProvider(locale));
    final themeProvider = ref.watch(themeStateProvider);

    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeLight.lightTheme,
      darkTheme: ThemeDark.darkTheme,
      themeMode: themeProvider,
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

