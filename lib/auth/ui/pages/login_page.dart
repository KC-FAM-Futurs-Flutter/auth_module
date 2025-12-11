import 'package:auth_module/auth/ui/widgets/login_email_form_widget.dart';
import 'package:auth_module/core/locator/locator.dart';
import 'package:auth_module/core/router/app_router.dart';
import 'package:auth_module/start/cubits/start_app/start_app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              SizedBox(height: 50),
              LoginEmailFormWidget(),
              SizedBox(height: 50),
              TextButton(
                onPressed: () {
                  context.goNamed(AppRoutes.register.name);
                },
                child: Text("Ir al Registro"),
              ),
              SizedBox(height: 50),
              TextButton(
                onPressed: () {
                  locator<StartAppCubit>().signInAnonymously();
                },
                child: Text("Iniciar como Anónimo"),
              ),
              // SizedBox(height: 50),
              // if (locator<StartAppCubit>().state.firebaseError != null)
              //   Text(locator<StartAppCubit>().state.firebaseError ?? ''),
            ],
          ),
        ),
      ),
    );
  }
}
