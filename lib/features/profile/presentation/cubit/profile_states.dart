import 'package:your_academy/features/home/data/models/user_model.dart';

abstract class ProfileState {}

class ProfileInitialState extends ProfileState{}

class GetUserLoadingState extends ProfileState{}
class GetUserSuccessState extends ProfileState{
  final List<UserModel>users;
  GetUserSuccessState({ required this.users});
}
class GetUserErrorState extends ProfileState{
  final String error;
  GetUserErrorState({ required this.error});
}