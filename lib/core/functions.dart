import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Formats [price] using the current locale's digits and grouping
/// (e.g. English "1,250", Arabic "١٬٢٥٠"). The currency label ("EGP") lives in
/// the localized ARB string, so only the number is formatted here.
String formatPrice(BuildContext context, num price) =>
    NumberFormat.decimalPattern(
      Localizations.localeOf(context).languageCode,
    ).format(price);

void snackBarMessage({required context, required text, required color}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(backgroundColor: color, content: Center(child: Text(text))),
  );
}

navigateTo(context, widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

navigateToAndReplace(context, widget) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}
