import 'package:meta/meta.dart';

@immutable
class Inclusivity {
  final bool includesStart;
  final bool includesEnd;

  bool get excludesStart => !includesStart;

  bool get excludesEnd => !includesEnd;

  @literal
  const Inclusivity(this.includesStart, this.includesEnd);

  @literal
  const Inclusivity.start() : this(true, false);

  @literal
  const Inclusivity.end() : this(false, true);

  @literal
  const Inclusivity.all() : this(true, true);

  @literal
  const Inclusivity.none() : this(false, false);
}
