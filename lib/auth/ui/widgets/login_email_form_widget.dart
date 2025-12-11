import 'package:auth_module/auth/ui/helpers/validators_form.dart';
import 'package:auth_module/core/locator/locator.dart';
import 'package:auth_module/start/cubits/start_app/start_app_cubit.dart';
import 'package:auth_module/start/cubits/start_app/start_app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginEmailFormWidget extends StatelessWidget {
  LoginEmailFormWidget({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passWordController = TextEditingController();
    ValidatorsForm validatorsForm = ValidatorsForm();

    return BlocListener<StartAppCubit, StartAppState>(
      bloc: locator<StartAppCubit>(),
      listener: (context, state) {
        if (state.firebaseError != null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.firebaseError ?? '')));
        }
      },
      child: BlocBuilder<StartAppCubit, StartAppState>(
        bloc: locator<StartAppCubit>(),
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                TextFormField(
                  validator: validatorsForm.isValidEmail,
                  controller: emailController,
                  decoration: InputDecoration(hintText: "Itroduzca su email"),
                ),
                SizedBox(height: 50),
                TextFormField(
                  validator: validatorsForm.isValidPass,
                  controller: passWordController,
                  decoration: InputDecoration(
                    hintText: "Itroduzca su contraseña",
                  ),
                ),
                SizedBox(height: 50),
                (state.chargeState == ChargeState.loading)
                    ? CircularProgressIndicator()
                    : GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            print("Este formulario es valido");
                            locator<StartAppCubit>().signInWithEmailAndPassword(
                              email: emailController.text,
                              password: passWordController.text,
                            );
                          } else {
                            print("Este formulario NO es valido");
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.lightBlue,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          height: 50,
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              "Iniciar Sesión",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
