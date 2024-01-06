import 'package:dotenv/dotenv.dart';

class Base {
  static const String BASEURL = 'https://agricma-backend.onrender.com';
  static String APIKEY = DotEnv().getOrElse('API_KEY', () => '');
}
