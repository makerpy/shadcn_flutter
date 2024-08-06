import 'package:example/pages/docs/state/data_example_1.dart';
import 'package:example/pages/docs/state/data_example_10.dart';
import 'package:example/pages/docs/state/data_example_2.dart';
import 'package:example/pages/docs/state/data_example_3.dart';
import 'package:example/pages/docs/state/data_example_4.dart';
import 'package:example/pages/docs/state/data_example_5.dart';
import 'package:example/pages/docs/state/data_example_6.dart';
import 'package:example/pages/docs/state/data_example_7.dart';
import 'package:example/pages/docs/state/data_example_8.dart';
import 'package:example/pages/docs/state/data_example_9.dart';
import 'package:example/pages/docs_page.dart';
import 'package:example/pages/widget_usage_example.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class StateManagementPage extends StatefulWidget {
  const StateManagementPage({Key? key}) : super(key: key);
  @override
  State<StateManagementPage> createState() => _StateManagementPageState();
}

class _StateManagementPageState extends State<StateManagementPage> {
  @override
  Widget build(BuildContext context) {
    return DocsPage(
      name: 'state',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('State Management').h1(),
          const Text(
                  'A comprehensive guide to managing state in shadcn_flutter.')
              .lead(),
          const Text(
                  'In Flutter, everything is a widget, including where your data is stored.')
              .p(),
          const Text(
                  'Internally, shadcn_flutter has its own state management system. '
                  'Although if you are already using a state management system, '
                  'you can continue to use it with shadcn_flutter.')
              .p(),
          const Text('Passing Data to the Children').h2(),
          const Text('You can pass data to children using the Data widget. '
                  'Any changes that occur in the data will cause the child to rebuild.')
              .p(),
          const WidgetUsageExample(
            path: 'lib/pages/docs/state/data_example_1.dart',
            summarize: false,
            child: DataExample1(),
          ).p(),
          const Alert(
            leading: Icon(Icons.info_outline),
            title: Text('Did you notice the difference in the rebuild count?'),
            content: Text(
                'The MostInnerWidget rebuilds when the data changes while the InnerWidget does not. '
                'This is because the InnerWidget is not listening to the data.'),
          ).p(),
          const Text('Setting Data Boundary').h3().p(),
          const Text(
                  'You can set a boundary so that the child cannot access the data.')
              .p(),
          const WidgetUsageExample(
            path: 'lib/pages/docs/state/data_example_4.dart',
            summarize: false,
            child: DataExample4(),
          ).p(),
          const Text('Data.maybeOf/Data.of vs Data.maybeFind/Data.find')
              .h3()
              .p(),
          const Text('')
              .thenInlineCode('Data.maybeOf(context)')
              .thenText(' and ')
              .thenInlineCode('Data.of(context)')
              .thenText(
                  ' listens to the data and rebuilds the widget when the data changes. Meanwhile ')
              .thenInlineCode('Data.maybeFind(context)')
              .thenText(' and ')
              .thenInlineCode('Data.find(context)')
              .thenText(
                  ' does not listen to the data and only returns the data.')
              .p(),
          const WidgetUsageExample(
            path: 'lib/pages/docs/state/data_example_5.dart',
            summarize: false,
            child: DataExample5(),
          ).p(),
          const Text('Getting Data from the Child').h2(),
          const Text('You can get data from the child using the ')
              .thenInlineCode('Data.maybeFindMessenger(context)')
              .thenText(
                  ' method. This method does not listen to any changes that occur in the data. ')
              .p(),
          const Text(
                  'Listening to child data might cause infinite rebuild loops. '
                  'Move the data to the parent widget if you need to listen to it.')
              .p(),
          const WidgetUsageExample(
            path: 'lib/pages/docs/state/data_example_2.dart',
            summarize: false,
            child: DataExample2(),
          ).p(),
          const Alert(
            leading: Icon(Icons.info_outline),
            title: Text('Did you notice the root data?'),
            content: Text(
                'It uses the data from the left most inner data, because parent can only take data from the first attached child.'),
          ).p(),
          const Text('Setting DataMessenger Boundary').h3().p(),
          const Text(
                  'You can set a boundary so that child data cannot be obtained from specific parent.')
              .p(),
          const WidgetUsageExample(
            path: 'lib/pages/docs/state/data_example_3.dart',
            summarize: false,
            child: DataExample3(),
          ).p(),
          const Text('MultiData Widget').h2(),
          const Text(
                  'The MultiData widget allows you to pass multiple data to the children. Take a look at the following example:')
              .p(),
          const CodeSnippet(
            code: 'Data<int>.inherit(\n'
                '\tdata: counter,\n'
                '\tchild: Data<String>.inherit(\n'
                '\t\tdata: name,\n'
                '\t\tchild: Data<bool>.boundary(\n'
                '\t\t\tchild: child,\n'
                '\t\t),\n'
                '\t),\n'
                ')',
            mode: 'dart',
          ).p(),
          const Text('You can avoid nesting by using the MultiData widget.')
              .p(),
          const CodeSnippet(
            code: 'MultiData(\n'
                '\tdataList: [\n'
                '\t\tData<int>(counter),\n'
                '\t\tData<String>(name),\n'
                '\t\tData<bool>.boundary(),\n'
                '\t],\n'
                '\tchild: child,\n'
                ')',
            mode: 'dart',
          ).p(),
          const Text('Example').h3().p(),
          const WidgetUsageExample(
            path: 'lib/pages/docs/state/data_example_6.dart',
            summarize: false,
            child: DataExample6(),
          ).p(),
          const Text('Passing State as a Controller').h2(),
          const Text(
                  'You can pass state as a controller to the children. This way you can call method in parent widget from child widgets.')
              .p(),
          const WidgetUsageExample(
            path: 'lib/pages/docs/state/data_example_7.dart',
            summarize: false,
            child: DataExample7(),
          ).p(),
          const Text('DataBuilder').h2(),
          const Text(
                  'You can use the DataBuilder widget to rebuild the widget when the data changes. '
                  'This also avoids rebuilding the entire widget.')
              .p(),
          // example 8
          const WidgetUsageExample(
            path: 'lib/pages/docs/state/data_example_8.dart',
            summarize: false,
            child: DataExample8(),
          ).p(),
          const Text('DataNotifier').h2(),
          const Text(
                  'Data notifier allows you to pass value to children from a ValueListenable.')
              .p(),
          const WidgetUsageExample(
            path: 'lib/pages/docs/state/data_example_9.dart',
            summarize: false,
            child: DataExample9(),
          ).p(),
          const Text('Example with MultiData').h3().p(),
          const WidgetUsageExample(
            path: 'lib/pages/docs/state/data_example_10.dart',
            summarize: false,
            child: DataExample10(),
          ).p(),
        ],
      ),
    );
  }
}
