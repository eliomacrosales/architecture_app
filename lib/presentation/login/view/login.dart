import 'package:architecture/core/constants/app_routes.dart';
import 'package:architecture/core/extensions/localization_extension.dart';
import 'package:architecture/core/extensions/theme_extension.dart';
import 'package:architecture/core/extensions/typography_extension.dart';
import 'package:architecture/core/networking/api_response.dart';
import 'package:architecture/domain/models/token/token.dart';
import 'package:architecture/domain/repository/repository_interface.dart';
import 'package:architecture/presentation/design_system/templates/base_view_template.dart';
import 'package:architecture/presentation/login/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late LoginController loginController;

  Future<void> _login() async {
    final String user = _userController.text;
    final String password = _passwordController.text;

    APIResponse<Token> result = await loginController.login(user: user, password: password);

    if(result.error){
      print('error en el login');
      print(result.errorMessage);
    }
    else{
      context.goNamed(AppRoutes.home);
    }
  }

  @override
  void dispose() {
    loginController.disposeResources();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    loginController = LoginController(context.read<RepositoryInterface>());
    return BaseViewTemplate<LoginController>(
      controller: loginController,
      builder: _builder,
    );
  }

  Widget _builder(BuildContext context, LoginController controller, Widget? child) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _userController,
              decoration: InputDecoration(labelText: 'Usuario'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            controller.isLoading
                ? Center(child: CircularProgressIndicator())
                : ElevatedButton(
                    onPressed: _login,
                    child: Text(context.localization.login,
                        style: context.appTypography.heading1_28Regular
                            .copyWith(color: context.theme.appColors.primary20)),
                  ),
          ],
        ),
      ),
    );
  }
}
