import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseServices {
  // Supplied at build/run time via --dart-define so credentials stay out of
  // source control, e.g.:
  //   flutter run \
  //     --dart-define=SUPABASE_URL=https://<project>.supabase.co \
  //     --dart-define=SUPABASE_ANON_KEY=<anon-or-publishable-key>
  // The anon/publishable key is only safe to expose when Row Level Security
  // (RLS) is enabled on all Supabase tables.
  static const String url = String.fromEnvironment('SUPABASE_URL');
  static const String apiKey = String.fromEnvironment('SUPABASE_ANON_KEY');

  static init() async {
    await Supabase.initialize(url: url, anonKey: apiKey);
  }

  /// Whether a Supabase session was restored (persisted from a previous run).
  /// `persistSession` is enabled by default, so a valid session recovered during
  /// [init] means the user is still signed in and can skip the auth screens.
  static bool get hasActiveSession =>
      Supabase.instance.client.auth.currentSession != null;
}
