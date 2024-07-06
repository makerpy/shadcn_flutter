import 'package:shadcn_flutter/shadcn_flutter.dart';

class CalendarExample4 extends StatefulWidget {
  const CalendarExample4({super.key});

  @override
  State<CalendarExample4> createState() => _CalendarExample4State();
}

class _CalendarExample4State extends State<CalendarExample4> {
  CalendarValue? _value;
  CalendarView _view = CalendarView.now();
  @override
  Widget build(BuildContext context) {
    ShadcnLocalizations localizations = ShadcnLocalizations.of(context);
    return Card(
      child: IntrinsicWidth(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                OutlineButton(
                  padding: Button.iconPadding,
                  onPressed: () {
                    setState(() {
                      _view = _view.previous;
                    });
                  },
                  child: Icon(Icons.arrow_back).iconXSmall(),
                ),
                Text('${localizations.getMonth(_view.month)} ${_view.year}')
                    .small()
                    .medium()
                    .center()
                    .expanded(),
                OutlineButton(
                  padding: Button.iconPadding,
                  onPressed: () {
                    setState(() {
                      _view = _view.next;
                    });
                  },
                  child: Icon(Icons.arrow_forward).iconXSmall(),
                ),
              ],
            ),
            gap(16),
            Calendar(
              value: _value,
              view: _view,
              onChanged: (value) {
                setState(() {
                  _value = value;
                });
              },
              now: DateTime.now(),
              selectionMode: CalendarSelectionMode.none,
            ),
          ],
        ),
      ),
    );
  }
}
