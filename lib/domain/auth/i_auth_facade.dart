import 'package:ddd_notes/domain/core/value_objects.dart';

abstract class IAuthFacade {
  Future<void> registerWithEmailPassword({
    required EmailAddress emailAddress,
    required Password password,
  });
  Future<void> signInWithEmailPassword({
    required EmailAddress emailAddress,
    required Password password,
  });
  Future<void> signInWithGoogle();
}
