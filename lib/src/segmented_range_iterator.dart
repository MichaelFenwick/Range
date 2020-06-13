import 'package:meta/meta.dart';

import 'graduated_range_iterator.dart';
import 'inclusivity.dart';
import 'segment.dart';
import 'step_function.dart';

class SegmentedRangeIterator<E extends Comparable, F> implements Iterator<Segment<E>> {
  GraduatedRangeIterator<E, F> _range;
  Segment<E> _current;

  E get start => _range.start;

  E get end => _range.end;

  dynamic get stepSize => _range.stepSize;

  StepFunction<E, F> get stepFunction => _range.stepFunction;

  @override
  Segment<E> get current => _current;

  SegmentedRangeIterator({
    @required E start,
    @required E end,
    @required dynamic stepSize,
    StepFunction<E, F> stepFunction,
    Inclusivity inclusivity,
  }) {
    _range = GraduatedRangeIterator<E, F>(
      start: start,
      end: end,
      stepSize: stepSize,
      stepFunction: stepFunction,
      inclusivity: inclusivity,
    );
  }

  @override
  bool moveNext() {
    if (_current == null) {
      E firstSegmentStart;
      E firstSegmentEnd;
      if (_range.moveNext()) {
        firstSegmentStart = _range.current;
      }
      if (_range.moveNext()) {
        firstSegmentEnd = _range.current;
      }
      if (firstSegmentStart != null && firstSegmentEnd != null) {
        _current = Segment(start: firstSegmentStart, end: firstSegmentEnd);
        return true;
      }
      return false;
    } else if (_range.moveNext()) {
      E currentSegmentEnd = _current.end;
      E nextSegmentEnd = _range.current;
      _current = Segment(start: currentSegmentEnd, end: nextSegmentEnd);
      return true;
    }
    return false;
  }
}
