import 'package:ddd_notes/application/auth/auth_bloc.dart';
import 'package:ddd_notes/application/auth/sign_in_form/bloc/sign_in_form_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ddd_notes/presentation/routes/app_router.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormBloc, SignInFormState>(
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
          () => {},
          (either) => either.fold(
            (l) => {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(
                    l.map(
                      cancelledByUser: (_) => 'Cancelled',
                      serverError: (_) => 'Server Error',
                      emailAlreadyInUse: (_) => 'Email already in use',
                      invalidEmailAndPasswordCombination: (_) =>
                          'Invalid email an password combination',
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              )
            },
            (_) => {
              context.router.replace(const NotesOverviewRoute()),
              context.read<AuthBloc>().add(const AuthEvent.authCheckRequested())
            },
          ),
        );
      },
      builder: (context, state) {
        return Form(
          autovalidateMode: AutovalidateMode.always,
          child: ListView(
            padding: const EdgeInsets.all(24),
            children: [
              const Text(
                '📝',
                style: TextStyle(fontSize: 130),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: 'Email',
                ),
                autocorrect: false,
                onChanged: (value) {
                  context
                      .read<SignInFormBloc>()
                      .add(SignInFormEvent.emailChanged(value));
                },
                validator: (_) {
                  return context
                      .read<SignInFormBloc>()
                      .state
                      .emailAddress
                      .value
                      .fold(
                        (l) => l.maybeMap(
                          invalidEmail: (_) => 'Invalid Email',
                          orElse: () => null,
                        ),
                        (r) => null,
                      );
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'Password',
                ),
                autocorrect: false,
                obscureText: true,
                onChanged: (value) {
                  context
                      .read<SignInFormBloc>()
                      .add(SignInFormEvent.passwordChanged(value));
                },
                validator: (_) {
                  return context
                      .read<SignInFormBloc>()
                      .state
                      .password
                      .value
                      .fold(
                        (l) => l.maybeMap(
                          shortPassword: (_) => 'Invalid Password',
                          orElse: () => null,
                        ),
                        (r) => null,
                      );
                },
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        context.read<SignInFormBloc>().add(const SignInFormEvent
                            .signInWithEmailAndPasswordPressed());
                      },
                      child: const Text('SIGN IN'),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        context.read<SignInFormBloc>().add(const SignInFormEvent
                            .registerWithEmailAndPasswordPressed());
                      },
                      child: const Text('REGISTER'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              FractionallySizedBox(
                widthFactor: 1,
                child: ElevatedButton(
                  onPressed: () {
                    context
                        .read<SignInFormBloc>()
                        .add(const SignInFormEvent.signInWithGooglePressed());
                  },
                  child: const Text("SIGN IN WITH GOOGLE"),
                ),
              ),
              if (state.isSubmitting) ...[
                const SizedBox(height: 8),
                const LinearProgressIndicator(),
              ],
            ],
          ),
        );
      },
    );
  }
}
