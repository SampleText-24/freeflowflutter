import 'package:flutter/material.dart';

class WheelPicker extends StatelessWidget {
  const WheelPicker({
    super.key,
    required this.limit,
    this.title = '',
  });

  final int limit;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 120),
        child: Column(
          children: [
            Expanded(
              child:
                ListWheelScrollView.useDelegate(
                    physics: FixedExtentScrollPhysics(),
                    itemExtent: 30,
                    childDelegate: ListWheelChildLoopingListDelegate(
                        children: List<Widget>.generate(
                            limit,
                                (index) => Text(
                              '${index > 9 ? index : '0$index'}',
                              style: TextStyle(fontSize: 20),
                            )))),

            ),
            SizedBox(height: 2),
            Text(title)
          ],
        ),
      ),
    );
  }
}
