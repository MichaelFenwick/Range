import 'dart:collection';

import 'package:meta/meta.dart';

import 'graduated_range_iterator.dart';
import 'inclusivity.dart';
import 'step_function.dart';

class GraduatedRange<E extends Comparable, F> extends IterableBase<E> {
  Iterator<E> Function() _iterator;

  GraduatedRange({
    @required E start,
    @required E end,
    @required F stepSize,
    @required StepFunction<E, F> stepFunction,
    Inclusivity inclusivity: const Inclusivity.all(),
  }) {
    _iterator = () => GraduatedRangeIterator<E, F>(
          start: start,
          end: end,
          stepSize: stepSize,
          stepFunction: stepFunction,
          inclusivity: inclusivity,
        );
  }

  Iterator<E> get iterator => _iterator();
}
