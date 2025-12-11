import 'package:auth_module/auth/data/models/auth_response.dart';
import 'package:auth_module/auth/data/repositories/auth_firebase_repository.dart';
import 'package:auth_module/start/cubits/start_app/start_app_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartAppCubit extends Cubit<StartAppState> {
  StartAppCubit() : super(StartAppState());

  Future<void> init() async {
    // Inicializar Provider y carga de datos
    AuthResponse myResponse = await AuthFirebaseRepository()
        .isLoggedCurrentUser();
    bool? isLoged = myResponse.isLogged;
    emit(state.copyWith(isLoged: isLoged));
  }

  void signInAnonymously() async {
    await AuthFirebaseRepository().signInAnonymously();
    emit(state.copyWith(isLoged: true));
  }

  Future<void> logOut() async {
    await AuthFirebaseRepository().logOut();
    emit(state.copyWith(isLoged: false));
  }

  void signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    AuthResponse myResponse = await AuthFirebaseRepository()
        .loginWithEmailAndPassword(email: email, password: password);
    emit(
      state.copyWith(
        isLoged: myResponse.isLogged,
        firebaseError: myResponse.firebaseError,
      ),
    );
  }

  void registerWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    AuthResponse myResponse = await AuthFirebaseRepository()
        .registerWithEmailAndPassword(email: email, password: password);
    emit(
      state.copyWith(
        isLoged: myResponse.isLogged,
        firebaseError: myResponse.firebaseError,
      ),
    );
  }
}
