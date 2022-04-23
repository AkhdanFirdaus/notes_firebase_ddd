import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ddd_notes/domain/auth/auth_failure.dart';
import 'package:ddd_notes/domain/core/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';
part 'sign_in_form_bloc.freezed.dart';

class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  SignInFormBloc() : super(SignInFormState.initial()) {
    on<SignInFormEvent>((event, emit) {});
  }
}
