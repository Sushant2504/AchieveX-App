import 'package:achievex/screens/chess_game/views/components/main_menu_view/game_options/picker.dart';
import 'package:flutter/cupertino.dart';

class TimeLimitPicker extends StatelessWidget {
  final int? selectedTime;
  final Function(int?)? setTime;

  const TimeLimitPicker({super.key, this.selectedTime, this.setTime});

  final Map<int, Text> timeOptions = const <int, Text>{
    0: Text('None'),
    1: Text('1m'),
    3: Text('3m'),
    5: Text('5m'),
    10: Text('10m'),
  };

  @override
  Widget build(BuildContext context) {
    return Picker<int>(
      label: 'Choose Time Limit',
      options: timeOptions,
      selection: selectedTime,
      setFunc: setTime,
    );
  }
}
