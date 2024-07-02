import 'package:architecture/config/theme/theme_provider/theme_provider.dart';
import 'package:architecture/core/extensions/localization_extension.dart';
import 'package:architecture/core/extensions/theme_extension.dart';
import 'package:architecture/core/extensions/typography_extension.dart';
import 'package:architecture/core/networking/api_response.dart';
import 'package:architecture/domain/models/user/user.dart';
import 'package:architecture/domain/repository/repository_interface.dart';
import 'package:architecture/presentation/design_system/atoms/svg_icon.dart';
import 'package:architecture/presentation/design_system/templates/base_view_template.dart';
import 'package:architecture/presentation/design_system/templates/template_ui_states.dart';
import 'package:architecture/presentation/home/controller/home_controller.dart';
import 'package:architecture/utils/app_icon/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late HomeController homeController;

  void updateThemeMode(ThemeMode themeMode) {
    context.read<ThemeProvider>().setThemeMode(themeMode);
  }

  @override
  Widget build(BuildContext context) {
    homeController = HomeController(context.read<RepositoryInterface>());
    return BaseViewTemplate<HomeController>(
      controller: homeController,
      initPage: (HomeController controller) {
        controller.fetchUser();
      },
      builder: _builder,
    );
  }

  Widget _builder(BuildContext context, HomeController controller, Widget? child) {
    final appColor =  context.theme.appColors;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.appColors.primary20,
        title: Text('Welcome'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TemplateUIStates<APIResponse<User>>(
                isLoading: controller.isLoading,
                data: controller.user,
                loadingBuilder: () => Center(child: CircularProgressIndicator()),
                dataBuilder: (user) => Text(
                      user.data!.fullName,
                      style:
                          context.appTypography.heading1_28Regular.copyWith(color: appColor.primary20),
                    ),
                errorBuilder: (error) => Text(error!, style: TextStyle(color: Colors.red))),

            // controller.isLoading ? Center(child: CircularProgressIndicator()) : controller.user.error
            //     ? Text('error')
            //     : Text(
            //     controller.user.data!.fullName,
            //     // context.localization.continueBtn,
            //     style: context.appTypography.heading1_28Regular.copyWith(color: context.theme.appColors.primary20)
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => updateThemeMode(ThemeMode.light),
                  child: Text('Light', style: TextStyle(color: context.theme.appColors.primary20)),
                ),
                TextButton(
                  onPressed: () => updateThemeMode(ThemeMode.dark),
                  child: const Text('Dark'),
                ),
                TextButton(
                  onPressed: () => updateThemeMode(ThemeMode.system),
                  child: const Text('System'),
                ),
              ],
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: (){

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

  @override
  void dispose() {
    homeController.disposeResources();
    super.dispose();
  }
}
