import 'package:freezed_annotation/freezed_annotation.dart';

part 'start_app_state.freezed.dart';

enum ChargeState { initial, loading, success, error }

@freezed
abstract class StartAppState with _$StartAppState {
  const factory StartAppState({
    @Default(null) bool? isLoged,
    @Default(null) String? firebaseError,
    @Default(ChargeState.initial) ChargeState chargeState,
  }) = _StartAppState;
}
