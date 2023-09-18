import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mindful_task_pro/event.dart';
import 'package:table_calendar/table_calendar.dart';






class Calendar extends StatefulWidget {
  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
   DateTime today = DateTime.now();
   DateTime?  _selectedDay;
   Map<DateTime, List<Events>> events = {};
   TextEditingController _eventController = TextEditingController();
   //late final ValueNotifier <List<Events>> _selectedEvents;
   
     get builder => null;
   void _onDaySelected(DateTime day, DateTime focusedDay){
    setState(() {
      today = day;
    });
   }

@override
  void initState() {
  super.initState();
  _selectedDay = _selectedDay;                                                                                                                                                                                    
  //_selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
}                                                                                   
//all events from the day                                                                                   
List <Events> _getEventsForDay (DateTime day){
  return events[day]?? [];
}

@override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Calendar'),),
        floatingActionButton: FloatingActionButton(onPressed: (){

          showDialog(
           context: context,
           builder: (context) {
            return AlertDialog(
              scrollable: true,
              title: Text('Event Name'),
              content: Padding(
                padding: EdgeInsets.all(8),
                child: TextField(
                  controller: _eventController,
                ),
              ),
              actions: [
                ElevatedButton(
                  onPressed: (){
                    events.addAll({_selectedDay!: [Events(_eventController.text)]
                    });
              
                  Navigator.of(context).pop();
                }, child: Text('Submit'),
                )
              ],
            );
           });
        },
        child: Icon(Icons.add)),
        body: Container(
          child: TableCalendar(
            locale: 'en_us',
            rowHeight: 50,
            headerStyle: HeaderStyle(formatButtonVisible: false, titleCentered: true),
            focusedDay: today,
            onDaySelected: _onDaySelected,
            eventLoader: _getEventsForDay,
            availableGestures: AvailableGestures.all,
            selectedDayPredicate: (day) => isSameDay(day, today),
            firstDay: DateTime(2000, 01, 01),
            lastDay: DateTime(2030, 01, 01),
        ),
      
      ),
  );

}





/////