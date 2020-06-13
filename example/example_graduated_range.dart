import 'package:range/range.dart';

main() {
  Iterable<num> numsum = GraduatedRange<num, int>(
    start: 1,
    end: 10,
    stepSize: 1,
    stepFunction: StepFunctions.numericSummation,
  );
  for (num e in numsum) {
    print(e);
  }

  Iterable<num> nummult = GraduatedRange<num, int>(
    start: 1,
    end: 40,
    stepSize: 2,
    stepFunction: StepFunctions.numericMultiplication,
  );
  print(nummult);

  Iterable<String> chariter = GraduatedRange<String, int>(
    start: 'a',
    end: 'z',
    stepSize: 1,
    stepFunction: StepFunctions.characterIteration,
  );
  print(chariter);

  Iterable<DateTime> dateiter = GraduatedRange<DateTime, Duration>(
    start: DateTime.now(),
    end: DateTime.now().add(const Duration(days: 1)),
    stepSize: const Duration(hours: 4),
    stepFunction: StepFunctions.dateTimeIteration,
  );
  for (DateTime time in dateiter) {
    print("${time.year}.${time.month}.${time.day}.${time.hour} ${time.minute}");
  }

  Iterable<Segment<num>> numsumseg = SegmentedRange<num, int>(
    start: 1,
    end: 10,
    stepSize: 1,
    stepFunction: StepFunctions.numericSummation,
  );
  print(numsumseg);

  Iterable<Segment<String>> chariterseg = SegmentedRange<String, int>(
    start: 'a',
    end: 'z',
    stepSize: 1,
    stepFunction: StepFunctions.characterIteration,
  );
  print(chariterseg);

  Iterable<Segment<DateTime>> dateiterseg = SegmentedRange<DateTime, Duration>(
    start: DateTime.now(),
    end: DateTime.now().add(const Duration(days: 1)),
    stepSize: const Duration(hours: 4),
    stepFunction: StepFunctions.dateTimeIteration,
  );
  for (Segment<DateTime> segment in dateiterseg) {
    print(
        "${segment.start.year}.${segment.start.month}.${segment.start.day} ${segment.start.hour}.${segment.start.minute} TO ${segment.end.year}.${segment.end.month}.${segment.end.day} ${segment.end.hour}.${segment.end.minute}");
  }
}
