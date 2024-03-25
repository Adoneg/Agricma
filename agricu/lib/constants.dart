import 'package:money_formatter/money_formatter.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? prefs;

String formatPrice(double price) {
  MoneyFormatter fmf = MoneyFormatter(amount: price);
  return fmf.output.compactNonSymbol;
}
