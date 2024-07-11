import 'package:example/pages/docs/components/carousel_example.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class TabsExample1 extends StatefulWidget {
  @override
  State<TabsExample1> createState() => _TabsExample1State();
}

class _TabsExample1State extends State<TabsExample1> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Tabs(
          index: index,
          tabs: [
            Text('Tab 1'),
            Text('Tab 2'),
            Text('Tab 3'),
          ],
          onChanged: (int value) {
            setState(() {
              index = value;
            });
          },
        ),
        gap(8),
        IndexedStack(
          index: index,
          children: [
            NumberedContainer(
              index: 1,
            ),
            NumberedContainer(
              index: 2,
            ),
            NumberedContainer(
              index: 3,
            ),
          ],
        ).sized(height: 300),
      ],
    );
  }
}