import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:car_ticket/domain/repositories/user/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationBlocEvent, AuthenticationState> {
  final UserRepository _userRepository;
  late final StreamSubscription<User?> _userSubscription;

  AuthenticationBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(const AuthenticationState.unknown()) {
    _userSubscription = _userRepository.user.listen((user) {
      add(AuthenticationUserChanged(user));
    });
    on<AuthenticationUserChanged>((event, emit) {
      emit(event.user != null
          ? AuthenticationState.authenticated(event.user!)
          : const AuthenticationState.unauthenticated());
    });
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
