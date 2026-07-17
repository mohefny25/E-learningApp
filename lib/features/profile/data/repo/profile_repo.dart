import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:your_academy/features/home/data/models/user_model.dart';

class ProfileRepo {
  final sup = Supabase.instance.client;
  // في ProfileRepo
  Future<Either<String, List<UserModel>>> getUsers(String userId) async {
    try {
      final response = await sup.from('users').select().eq('id', userId);

      debugPrint('Response from Supabase: $response'); // ✅ طباعة للتحقق

      final List<UserModel> users = [];
      for (var user in response) {
        debugPrint('User data: $user'); // ✅ طباعة لكل مستخدم
        users.add(UserModel.fromJson(user));
      }

      debugPrint('Users count: ${users.length}'); // ✅ طباعة العدد
      return right(users);
    } catch (e) {
      return left(e.toString());
    }
  }
}
