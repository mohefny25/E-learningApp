import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EditProfileRepo {

  final sup = Supabase.instance.client;

Future<Either<String,void>> updateEmail(String newEmail) async {
  try {
     await sup.auth.updateUser(
      UserAttributes(
        email: newEmail
      )
    );

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

      if (kDebugMode) {
        print('Auth User Email: ${user.email}');
        print('New Email: $newEmail');
        print('Will Update: ${newEmail != user.email}');
      }


      if (newEmail != user.email) {
        if (kDebugMode) {
          print('Calling updateUser...');
        }

        await sup.auth.updateUser(
          UserAttributes(
            email: newEmail.trim(),
          ),
        );
        final user = sup.auth.currentUser;

        if (kDebugMode) {
          print('Current Email: ${user?.email}');
          print('Email Confirmed At: ${user?.emailConfirmedAt}');
          print('User JSON: ${user?.toJson()}');
        }

      }

      await sup.from('users').upsert({
        'id': user.id,
        'name': newName.trim(),
        //'email': newEmail.trim(),
        'updated_at': DateTime.now().toIso8601String(),
      });

      return right(null);
    } catch (e) {
      if (kDebugMode) {
        print('FULL ERROR: $e');
      }
      return left(e.toString());
    }
  }
}