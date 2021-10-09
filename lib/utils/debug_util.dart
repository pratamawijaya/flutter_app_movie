class DebugUtil {
  static const bool isDebugMode = false;

  static debug(msg) {
    if (isDebugMode) {
      print(msg);
    }
  }
}
