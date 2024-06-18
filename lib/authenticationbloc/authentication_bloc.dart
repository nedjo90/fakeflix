import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user.dart';
import '../services/authentication.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';



class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthService authService = AuthService();
  final _firestore = FirebaseFirestore.instance;

  AuthenticationBloc() : super(AuthenticationInitialState()) {
    on<AuthenticationEvent>((event, emit) {});

    on<SignUpUser>((event, emit) async {
      emit(AuthenticationLoadingState(isLoading: true));
      try {
        final UserModel? user =
        await authService.signUpUser(event.email, event.password);
        if (user != null) {
          await _firestore
              .collection('user')
              .doc(user.id)
              .set({'movieid': []}, SetOptions(merge: true));

          emit(AuthenticationSuccessState(user));

        } else {
          emit(const AuthenticationFailureState('create user failed'));
        }
      } catch (e) {
        print(e.toString());
        emit(AuthenticationFailureState(e.toString()));
      }
      emit(AuthenticationLoadingState(isLoading: false));
    });

    on<SignIn>((event, emit) async {
      emit(AuthenticationLoadingState(isLoading: true));
      try {
        final UserModel? user = await authService.signInUser(event.email, event.password);
        if (user != null) {
          emit(AuthenticationSuccessState(user));
        } else {
          emit(const AuthenticationFailureState('Sign in failed'));
        }
      } catch (e) {
        print(e.toString());
        emit(AuthenticationFailureState(e.toString()));
      }
      emit(AuthenticationLoadingState(isLoading: false));
    });

    on<SignOut>((event, emit) async {
      emit(AuthenticationLoadingState(isLoading: true));
      emit(AuthenticationInitialState());
      try {
        await authService.signOutUser();
      } catch (e) {
        print('error');
        print(e.toString());
        emit(AuthenticationFailureState(e.toString()));
      }
      emit(AuthenticationLoadingState(isLoading: false));
    });
  }
}
