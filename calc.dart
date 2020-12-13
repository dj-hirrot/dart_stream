import 'dart:async';
import 'dart:math' show Random;

class MentalCalc {
  final _calcController = StreamController<int>();
  final _outputController = StreamController<String>();
  final _stopController = StreamController<Null>();

  Function(int) get add => _calcController.sink.add;
  Stream<String> get onAdd => _outputController.stream;
  Stream<String> get onStop => _stopController.stream;

  int _sum = 0;

  MentalCalc(int repeat) {
    _calcController.stream.listen((count) {
      if (count < repeat + 1) {
        var num = Random().nextInt(99) + 1;
        _outputController.sink.add('$num');
        _sum += num;
      } else {
        _outputController.sink.add('答は$_sum');
        _stopController.sink.add(null);
      }
    });
  }
}
