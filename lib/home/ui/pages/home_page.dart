import 'package:auth_module/core/locator/locator.dart';
import 'package:auth_module/start/cubits/start_app/start_app_cubit.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("HomePage")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          locator<StartAppCubit>().logOut();
        },
      ),
    );
  }
}
