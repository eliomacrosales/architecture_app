import 'package:architecture/config/localization/locale_controller/locale_controller.dart';
import 'package:architecture/config/theme/theme_controller/theme_controller.dart';
import 'package:architecture/core/constants/app_routes.dart';
import 'package:architecture/core/extensions/localization_extension.dart';
import 'package:architecture/core/extensions/theme_extension.dart';
import 'package:architecture/core/extensions/typography_extension.dart';
import 'package:architecture/presentation/design_system/atoms/svg_icon.dart';
import 'package:architecture/presentation/home/controller/home_controller.dart';
import 'package:architecture/utils/app_icon/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appColor = context.theme.appColors;
    final userAsyncValue = ref.watch(homeControllerProvider);
    final themeController = ref.read(themeControllerProvider.notifier);
    final localeController = ref.read(localeControllerProvider.notifier);
    final reload = ref.watch(reloadUser);

    if (reload) {
      Future(() {
        ref.read(homeControllerProvider.notifier).refreshUser();
        ref.read(reloadUser.notifier).state = false;
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.appColors.primary20,
        title: Text(context.localization.welcome),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            userAsyncValue.when(
              data: (user) => Center(
                child: Text(
                  user.fullName,
                  style: context.appTypography.heading1_28Regular.copyWith(color: appColor.primary20),
                ),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (error, stack) => Center(
                child: Text('Error: $error'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => localeController.setLocale('es'),
                  child: Text('ES', style: TextStyle(color: context.theme.appColors.primary20)),
                ),
                TextButton(
                  onPressed: () => localeController.setLocale('en'),
                  child: const Text('US'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => themeController.toggleTheme(),
                  child: Text('Light', style: TextStyle(color: context.theme.appColors.primary20)),
                ),
                TextButton(
                  onPressed: () => themeController.toggleTheme(),
                  child: const Text('Dark'),
                ),
                TextButton(
                  onPressed: () => themeController.toggleTheme(),
                  child: const Text('System'),
                ),
              ],
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                context.pushNamed(AppRoutes.detail);
              },
              child: SvgIcon(
                assetsIcon: AppIcon.calendar,
                color: appColor.primary20,
              ),
            )
          ],
        ),
      ),
    );
  }
}

