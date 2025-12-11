import 'package:auth_module/auth/ui/widgets/register_email_form_widget.dart';
import 'package:auth_module/core/locator/locator.dart';
import 'package:auth_module/core/router/app_router.dart';
import 'package:auth_module/start/cubits/start_app/start_app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              SizedBox(height: 50),
              RegisterEmailFormWidget(),
              SizedBox(height: 50),
              TextButton(
                onPressed: () {
                  context.goNamed(AppRoutes.login.name);
                },
                child: Text("Ir al Login"),
              ),
              SizedBox(height: 50),
              TextButton(
                onPressed: () {
                  locator<StartAppCubit>().signInAnonymously();
                },
                child: Text("Iniciar como Anónimo"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
