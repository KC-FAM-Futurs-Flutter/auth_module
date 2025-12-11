import 'package:auth_module/core/locator/locator.dart';
import 'package:auth_module/core/router/app_router.dart';
import 'package:auth_module/start/cubits/start_app/start_app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.goNamed(AppRoutes.login.name);
                },
                child: Text("Ir al Login"),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  context.goNamed(AppRoutes.register.name);
                },
                child: Text("Ir al Registro"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
