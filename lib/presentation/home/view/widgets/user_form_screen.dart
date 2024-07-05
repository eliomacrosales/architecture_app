import 'package:architecture/presentation/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserFormScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
      return Consumer<HomeController>(
      builder: (context, controller, child) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.nameController,
                  decoration: InputDecoration(labelText: 'Nombre'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese un nombre';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: controller.submitForm,
                  child: Text('Enviar'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}