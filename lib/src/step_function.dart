typedef E StepFunction<E, F>(E e, F step);

class StepFunctions {
  static num numericSummation<E extends num, F extends num>(E e, F f) => e + f;

  static num numericMultiplication<E extends num, F extends num>(E e, F f) => e * f;

  static String characterIteration(String string, int step) {
    if (string.length != 1) {
      throw ArgumentError.value(string, "The string to iterate over must have a length of 1");
    }
    return String.fromCharCode(string.codeUnitAt(0) + step);
  }

  static DateTime dateTimeIteration(DateTime time, Duration duration) => time.add(duration);
}
