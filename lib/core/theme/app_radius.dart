/// Centralizes the border-radius values that are repeated across the app.
///
/// Names are value-based (r5, r12, ...) so the exact radius is unambiguous at
/// the call site. Only add a new value here when it is actually reused in more
/// than one place — one-off radii should stay inline to keep this list minimal.
class AppRadius {
  static const double r5 = 5;
  static const double r12 = 12;
  static const double r15 = 15;
  static const double r20 = 20;
}
