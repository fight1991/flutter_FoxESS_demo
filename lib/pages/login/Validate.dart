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
  static bool emailValid(String str) {
    return RegExp(
      r"^[A-Za-z0-9]+([_.][A-Za-z0-9]+)*@([A-Za-z0-9-]+.)+[A-Za-z]{2,6}$|^$")
      .hasMatch(str);
  }
}
