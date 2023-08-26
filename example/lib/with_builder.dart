import 'package:example/widgets/colored_container.dart';
import 'package:flutter/material.dart';
import 'package:list_wheel_scroll_view_x/list_wheel_scroll_view_x.dart';

main() {
  runApp(
    MaterialApp(
      home: Home(),
    ),
  );
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  Color _getColor(int index) {
    List<Color> _colors = [
      Colors.red,
      Colors.yellow,
      Colors.green,
    ];
    return _colors[index % _colors.length];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('With Builder'),
      ),
      body: Center(
        child: Container(
          height: 250,
          color: Colors.grey[400],
          child: ListWheelScrollViewX.useDelegate(
            scrollDirection: Axis.horizontal,
            diameterRatio: 1000,
            itemExtent: 80,
            childDelegate:
                ListWheelChildBuilderDelegate(builder: (context, index) {
              return ColoredContainer(_getColor(index));
            }),
          ),
        ),
      ),
    );
  }
}
