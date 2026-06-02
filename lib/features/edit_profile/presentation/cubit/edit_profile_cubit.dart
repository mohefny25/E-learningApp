import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_academy/features/edit_profile/data/repo/edit_profile_repo/edit_profile_repo.dart';
import 'package:your_academy/features/edit_profile/presentation/cubit/edit_profile_states.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit({required this.editProfileRepo})
      : super(EditProfileInitialStates());

  final EditProfileRepo editProfileRepo;
  static EditProfileCubit get(context) => BlocProvider.of(context);

  Future<void> updateNameAndEmail(String newName, String newEmail) async {
    // Validation before API call
    if (newName.trim().isEmpty) {
      emit(UpdateNameAndEmailErrorStates(error: 'Name cannot be empty'));
      return;
    }

    if (newEmail.trim().isEmpty || !newEmail.contains('@')) {
      emit(UpdateNameAndEmailErrorStates(error: 'Please enter a valid email'));
      return;
    }

    emit(UpdateNameAndEmailLoadingStates());

    final result = await editProfileRepo.updateNameAndEmail(
        newName.trim(),
        newEmail.trim()
    );

    result.fold(

          (error) {
            if (kDebugMode) {
              print('ERROR from Supabase: $error');
            }
            emit(UpdateNameAndEmailErrorStates(error: error));},
          (_) => emit(UpdateNameAndEmailSuccessStates()),
    );
  }
}