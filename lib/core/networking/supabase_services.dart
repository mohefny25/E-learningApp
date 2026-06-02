import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseServices{
  static const String url = 'https://uumnjwrwdeveulglvnbm.supabase.co';
  static const String apiKey = 'sb_publishable_13RTd3PMaHJ2je-VZOEY4w_Yr6ke7H4';

  static init()async{
    await Supabase.initialize(url: url, anonKey: apiKey);
  }
}