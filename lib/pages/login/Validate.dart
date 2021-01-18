class Validate {
  Validate._();
  static bool userValid(String str) {
    return RegExp(
      r"^[A-Za-z0-9]{4,20}$")
      .hasMatch(str);
  }
  static bool pwdValid(String str) {
    return RegExp(
      r"^[A-Za-z0-9_]{6,20}$")
      .hasMatch(str);
  }
  static bool codeValid(String str) {
    return RegExp(
      r"^\d{4}$")
      .hasMatch(str);
  }
}
