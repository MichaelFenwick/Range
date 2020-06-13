import 'package:meta/meta.dart';

@immutable
class Segment<E> {
  final E start;
  final E end;

  @literal
  const Segment({@required this.start, @required this.end});

  @override
  String toString() {
    return "Start: $start, End: $end";
  }
}
