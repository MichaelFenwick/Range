import 'dart:collection';

import 'package:meta/meta.dart';

import 'inclusivity.dart';
import 'segment.dart';
import 'segmented_range_iterator.dart';
import 'step_function.dart';

class SegmentedRange<E extends Comparable, F> extends IterableBase<Segment<E>> {
  Iterator<Segment<E>> Function() _iterator;

  SegmentedRange({
    @required E start,
    @required E end,
    @required F stepSize,
    @required StepFunction<E, F> stepFunction,
    Inclusivity inclusivity: const Inclusivity.all(),
  }) {
    _iterator = () => SegmentedRangeIterator<E, F>(
          start: start,
          end: end,
          stepSize: stepSize,
          stepFunction: stepFunction,
          inclusivity: inclusivity,
        );
  }

  Iterator<Segment<E>> get iterator => _iterator();
}
