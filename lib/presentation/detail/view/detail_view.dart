import 'package:architecture/core/constants/app_routes.dart';
import 'package:architecture/core/extensions/theme_extension.dart';
import 'package:architecture/core/extensions/typography_extension.dart';
import 'package:architecture/presentation/design_system/atoms/svg_icon.dart';
import 'package:architecture/presentation/home/controller/home_controller.dart';
import 'package:architecture/utils/app_icon/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DetailScreen extends ConsumerWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appColor = context.theme.appColors;
    final userAsyncValue = ref.watch(homeControllerProvider);

    return PopScope(
      onPopInvoked: (didPop) {
        ref.read(reloadUser.notifier).state = true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: context.theme.appColors.primary20,
          title: const Text('Detail'),
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
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  // Aquí puedes editar los datos del usuario
                  // Luego, establece el estado para recargar los datos al regresar
                  ref.read(reloadUser.notifier).state = true;
                  context.pop();
                },
                child: SvgIcon(
                  assetsIcon: AppIcon.calendar,
                  color: appColor.primary20,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
