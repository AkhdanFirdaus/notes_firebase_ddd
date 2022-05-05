// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'note_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NoteFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unexpected,
    required TResult Function() inSufficientPermission,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unexpected,
    TResult Function()? inSufficientPermission,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unexpected,
    TResult Function()? inSufficientPermission,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unexpected value) unexpected,
    required TResult Function(_InSufficientPermission value)
        inSufficientPermission,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Unexpected value)? unexpected,
    TResult Function(_InSufficientPermission value)? inSufficientPermission,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unexpected value)? unexpected,
    TResult Function(_InSufficientPermission value)? inSufficientPermission,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteFailureCopyWith<$Res> {
  factory $NoteFailureCopyWith(
          NoteFailure value, $Res Function(NoteFailure) then) =
      _$NoteFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$NoteFailureCopyWithImpl<$Res> implements $NoteFailureCopyWith<$Res> {
  _$NoteFailureCopyWithImpl(this._value, this._then);

  final NoteFailure _value;
  // ignore: unused_field
  final $Res Function(NoteFailure) _then;
}

/// @nodoc
abstract class _$UnexpectedCopyWith<$Res> {
  factory _$UnexpectedCopyWith(
          _Unexpected value, $Res Function(_Unexpected) then) =
      __$UnexpectedCopyWithImpl<$Res>;
}

/// @nodoc
class __$UnexpectedCopyWithImpl<$Res> extends _$NoteFailureCopyWithImpl<$Res>
    implements _$UnexpectedCopyWith<$Res> {
  __$UnexpectedCopyWithImpl(
      _Unexpected _value, $Res Function(_Unexpected) _then)
      : super(_value, (v) => _then(v as _Unexpected));

  @override
  _Unexpected get _value => super._value as _Unexpected;
}

/// @nodoc

class _$_Unexpected implements _Unexpected {
  const _$_Unexpected();

  @override
  String toString() {
    return 'NoteFailure.unexpected()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Unexpected);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unexpected,
    required TResult Function() inSufficientPermission,
  }) {
    return unexpected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unexpected,
    TResult Function()? inSufficientPermission,
  }) {
    return unexpected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unexpected,
    TResult Function()? inSufficientPermission,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unexpected value) unexpected,
    required TResult Function(_InSufficientPermission value)
        inSufficientPermission,
  }) {
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Unexpected value)? unexpected,
    TResult Function(_InSufficientPermission value)? inSufficientPermission,
  }) {
    return unexpected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unexpected value)? unexpected,
    TResult Function(_InSufficientPermission value)? inSufficientPermission,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(this);
    }
    return orElse();
  }
}

abstract class _Unexpected implements NoteFailure {
  const factory _Unexpected() = _$_Unexpected;
}

/// @nodoc
abstract class _$InSufficientPermissionCopyWith<$Res> {
  factory _$InSufficientPermissionCopyWith(_InSufficientPermission value,
          $Res Function(_InSufficientPermission) then) =
      __$InSufficientPermissionCopyWithImpl<$Res>;
}

/// @nodoc
class __$InSufficientPermissionCopyWithImpl<$Res>
    extends _$NoteFailureCopyWithImpl<$Res>
    implements _$InSufficientPermissionCopyWith<$Res> {
  __$InSufficientPermissionCopyWithImpl(_InSufficientPermission _value,
      $Res Function(_InSufficientPermission) _then)
      : super(_value, (v) => _then(v as _InSufficientPermission));

  @override
  _InSufficientPermission get _value => super._value as _InSufficientPermission;
}

/// @nodoc

class _$_InSufficientPermission implements _InSufficientPermission {
  const _$_InSufficientPermission();

  @override
  String toString() {
    return 'NoteFailure.inSufficientPermission()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _InSufficientPermission);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unexpected,
    required TResult Function() inSufficientPermission,
  }) {
    return inSufficientPermission();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unexpected,
    TResult Function()? inSufficientPermission,
  }) {
    return inSufficientPermission?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unexpected,
    TResult Function()? inSufficientPermission,
    required TResult orElse(),
  }) {
    if (inSufficientPermission != null) {
      return inSufficientPermission();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unexpected value) unexpected,
    required TResult Function(_InSufficientPermission value)
        inSufficientPermission,
  }) {
    return inSufficientPermission(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Unexpected value)? unexpected,
    TResult Function(_InSufficientPermission value)? inSufficientPermission,
  }) {
    return inSufficientPermission?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unexpected value)? unexpected,
    TResult Function(_InSufficientPermission value)? inSufficientPermission,
    required TResult orElse(),
  }) {
    if (inSufficientPermission != null) {
      return inSufficientPermission(this);
    }
    return orElse();
  }
}

abstract class _InSufficientPermission implements NoteFailure {
  const factory _InSufficientPermission() = _$_InSufficientPermission;
}
