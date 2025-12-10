import 'package:auth_module/start/cubits/start_app/start_app_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartAppCubit extends Cubit<StartAppState> {
  StartAppCubit() : super(StartAppState());

  void init() {
    // Inicializar Provider y carga de datos
    emit(state.copyWith(isLoged: true));
  }

  void login() {
    emit(state.copyWith(isLoged: true));
  }

  void logOut() {
    emit(state.copyWith(isLoged: false));
  }
}
