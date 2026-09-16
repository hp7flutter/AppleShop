import 'package:apple_shop_ir/common/di/di.dart';
import 'package:apple_shop_ir/features/Auth/bloc/auth_event.dart';
import 'package:apple_shop_ir/features/Auth/bloc/auth_state.dart';
import 'package:apple_shop_ir/features/Auth/domain/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository = Di.sl.get<AuthRepository>();

  AuthBloc() : super(AuthInitialState()) {
    on<AuthRegisterEvent>(onRegisterEvent);
    on<AuthLoginEvent>(onLoginEvent);
    on<AuthResetStateEvent>(onResetState);
  }

  Future<void> onRegisterEvent(
    AuthRegisterEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoadingState());
    final response = await authRepository.register(
      username: event.username,
      password: event.password,
      passwordConfirm: event.passwordConfirm,
    );
    response.fold(
      (failure) => emit(AuthErrorState(failure)),
      (result) => emit(AuthSuccessState(result)),
    );
  }

  Future<void> onLoginEvent(
    AuthLoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoadingState());
    final response = await authRepository.login(
      username: event.username,
      password: event.password,
    );
    response.fold(
      (failure) => emit(AuthErrorState(failure)),
      (result) => emit(AuthSuccessState(result)),
    );
  }

  void onResetState(AuthResetStateEvent event, Emitter<AuthState> emit) {
    emit(AuthInitialState());
  }
}
