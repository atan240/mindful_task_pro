import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:mindful_task_pro/event.dart';
import 'package:intl/intl.dart';

class Calendar extends StatefulWidget {
  @override
  State<Calendar> createState() => _CalendarAppState();
}

class _CalendarAppState extends State<Calendar>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  DateTime _today = DateTime.now();
  DateTime? _selectedDay;
  Map<DateTime, List<String>> _events = {};
  TextEditingController _eventController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedDay = _today;
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
              locale: 'en_us',
              rowHeight: 50,
              headerStyle:
                  HeaderStyle(formatButtonVisible: false, titleCentered: true),
              focusedDay: _today,
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                });
              },
              eventLoader: (day) => _events[day] ?? [],
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
              firstDay: DateTime(2000, 01, 01),
              lastDay: DateTime(2030, 01, 01),
              calendarStyle: CalendarStyle(
                selectedDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
              ),
            ),
            if (_events[_selectedDay] != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _events[_selectedDay]!.asMap().entries.map((entry) {
                  final index = entry.key;
                  final event = entry.value;
                  return ListTile(
                    title: Row(
                      children: [
                        Expanded(
                          child: Text(event),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              _events[_selectedDay!]!.removeAt(index);
                            });
                          },
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Add Task'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Text('Selected Date: ${_selectedDay?.toLocal()}'),
                    Text(
                        'Selected Date: ${_selectedDay != null ? DateFormat('dd/MM/yyyy').format(_selectedDay!) : ''}'),
                    TextFormField(
                      controller: _eventController,
                      decoration: InputDecoration(labelText: 'Task for today'),
                    ),
                  ],
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      final eventText = _eventController.text;
                      if (eventText.isNotEmpty && _selectedDay != null) {
                        setState(() {
                          if (_events[_selectedDay!] == null) {
                            _events[_selectedDay!] = [eventText];
                          } else {
                            _events[_selectedDay!]!.add(eventText);
                          }
                        });
                      }
                      _eventController.clear();
                      Navigator.of(context).pop();
                    },
                    child: Text('Save'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Calendar(),
  ));
}
