import 'package:meta/meta.dart';

import 'inclusivity.dart';
import 'step_function.dart';

class GraduatedRangeIterator<E extends Comparable, F> implements Iterator<E> {
  final E start;
  final E end;
  final F stepSize;
  final StepFunction<E, F> stepFunction;
  final Inclusivity inclusivity;
  E _current;

  @override
  E get current => _current;

  GraduatedRangeIterator({
    @required this.start,
    @required this.end,
    @required this.stepSize,
    @required this.stepFunction,
    this.inclusivity: const Inclusivity.all(),
  }) : assert(start != end, "A range must have a start and end point which are not equal.");

  @override
  bool moveNext() {
    if (_current == null) {
      if (inclusivity.includesStart) {
        _current = start;
        return true;
      } else {
        E firstStep = stepFunction(start, stepSize);
        if (isWithinRange(firstStep)) {
          _current = firstStep;
          return true;
        }
        return false;
      }
    } else {
      E nextStep = stepFunction(_current, stepSize);
      if (isWithinRange(nextStep)) {
        _current = nextStep;
        return true;
      }
      return false;
    }
  }

  bool isWithinRange(E element) {
    num startCompare = start.compareTo(element);
    num endCompare = end.compareTo(element);
    return (inclusivity.includesStart ? startCompare <= 0 : startCompare < 0) && (inclusivity.includesEnd ? endCompare >= 0 : endCompare > 0);
  }
}
