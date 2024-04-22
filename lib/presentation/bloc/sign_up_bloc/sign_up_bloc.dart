import 'package:bloc/bloc.dart';
import 'package:car_ticket/domain/models/user/user.dart';
import 'package:car_ticket/domain/repositories/user/user_repository.dart';
import 'package:equatable/equatable.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final UserRepository _userRepository;
  SignUpBloc({
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(SignUpInitial()) {
    on<SignUpRequired>((event, emit) async {
      emit(SignUpProcess());

      try {
        MyUser user = await _userRepository.signUpWithEmailAndPassword(
          event.user,
          event.password,
        );
        await _userRepository.setUserData(user);
        emit(SignUpSuccess());
      } catch (e) {
        emit(SignUpFailure());
      }
    });
  }
}
