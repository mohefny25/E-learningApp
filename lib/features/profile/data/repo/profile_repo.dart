import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:your_academy/features/home/data/models/user_model.dart';

class ProfileRepo {
  final sup = Supabase.instance.client;

  Future<Either<String, List<UserModel>>> getUsers(String userId) async {
    try {
      final response = await sup.from('users').select().eq('id', userId);

      final List<UserModel> users = [];
      for (var user in response) {
        users.add(UserModel.fromJson(user));
      }

      return right(users);
    } catch (e) {
      return left(e.toString());
    }
  }
}
