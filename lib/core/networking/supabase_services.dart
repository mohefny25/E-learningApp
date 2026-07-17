import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseServices {
  static const String url = 'https://uumnjwrwdeveulglvnbm.supabase.co';
  static const String apiKey = 'sb_publishable_13RTd3PMaHJ2je-VZOEY4w_Yr6ke7H4';

  static init() async {
    await Supabase.initialize(url: url, anonKey: apiKey);
  }

  /// Whether a Supabase session was restored (persisted from a previous run).
  /// `persistSession` is enabled by default, so a valid session recovered during
  /// [init] means the user is still signed in and can skip the auth screens.
  static bool get hasActiveSession =>
      Supabase.instance.client.auth.currentSession != null;
}
