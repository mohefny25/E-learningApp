import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepo {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<Either<String, void>> signin({
    required String email,
    required String password,
  }) async {
    try {
      await supabase.auth.signInWithPassword(email: email, password: password);

      return right(null);
    } on AuthException catch (e) {
      return left(e.message);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, void>> signup({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final response = await supabase.auth.signUp(
        email: email,
        password: password,
      );

      final user = response.user;

      if (user == null) {
        return left("User creation failed");
      }

      final result = await saveUserData(id: user.id, name: name, email: email);

      return result;
    } on AuthException catch (e) {
      return left(e.message);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, void>> saveUserData({
    required String id,
    required String name,
    required String email,
  }) async {
    try {
      await supabase.from('users').insert({
        'id': id,
        'name': name,
        'email': email,
      });

      return right(null);
    } catch (e) {
      return left(e.toString());
    }
  }
}
