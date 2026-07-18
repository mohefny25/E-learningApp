import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EditProfileRepo {
  final sup = Supabase.instance.client;

  Future<Either<String, void>> updateEmail(String newEmail) async {
    try {
      await sup.auth.updateUser(UserAttributes(email: newEmail));

      return right(null);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, void>> updateNameAndEmail(
    String newName,
    String newEmail,
  ) async {
    try {
      final user = sup.auth.currentUser;

      if (user == null) {
        return left('User not authenticated');
      }

      if (newEmail != user.email) {
        await sup.auth.updateUser(UserAttributes(email: newEmail.trim()));
      }

      await sup.from('users').upsert({
        'id': user.id,
        'name': newName.trim(),
        'updated_at': DateTime.now().toIso8601String(),
      });

      return right(null);
    } catch (e) {
      return left(e.toString());
    }
  }
}
