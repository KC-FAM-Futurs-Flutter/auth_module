import 'package:auth_module/core/locator/locator.dart';
import 'package:auth_module/start/cubits/start_app/start_app_cubit.dart';
import 'package:auth_module/start/cubits/start_app/start_app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StartAppCubit, StartAppState>(
      bloc: locator<StartAppCubit>()..init(),
      builder: (context, state) {
        return Scaffold(
          body: Center(child: CircularProgressIndicator()),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              locator<StartAppCubit>().login();
            },
          ),
        );
      },
    );
  }
}
