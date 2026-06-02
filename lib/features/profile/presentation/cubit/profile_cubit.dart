import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_academy/features/profile/data/repo/profile_repo.dart';
import 'package:your_academy/features/profile/presentation/cubit/profile_states.dart';

class ProfileCubit extends Cubit<ProfileState>{
  ProfileCubit({required this.profileRepo}):super(ProfileInitialState());

  final ProfileRepo profileRepo;

  Future<void> getUsers(userId)async{
    final response = await profileRepo.getUsers(userId);
    response.fold(
        (error){emit(GetUserErrorState(error: error));},
        (users){emit(GetUserSuccessState(users: users));}
    );


  }
}