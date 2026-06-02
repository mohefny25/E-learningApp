import 'package:equatable/equatable.dart';

// ✅ Better - with Equatable
abstract class EditProfileState extends Equatable {
  const EditProfileState();

  @override
  List<Object?> get props => [];
}

class EditProfileInitialStates extends EditProfileState {
  const EditProfileInitialStates();

  @override
  List<Object?> get props => [];
}

class UpdateNameAndEmailLoadingStates extends EditProfileState {
  const UpdateNameAndEmailLoadingStates();

  @override
  List<Object?> get props => [];
}

class UpdateNameAndEmailSuccessStates extends EditProfileState {
  const UpdateNameAndEmailSuccessStates();

  @override
  List<Object?> get props => [];
}

class UpdateNameAndEmailErrorStates extends EditProfileState {
  final String error;

  const UpdateNameAndEmailErrorStates({required this.error});

  @override
  List<Object?> get props => [error]; // Important for equality check
}