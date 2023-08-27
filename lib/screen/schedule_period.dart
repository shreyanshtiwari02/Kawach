import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kawach/services/notification_service.dart';
import 'package:table_calendar/table_calendar.dart';

class SchedulePeriodScreen extends StatefulWidget {
  const SchedulePeriodScreen({super.key});

  @override
  State<SchedulePeriodScreen> createState() => _SchedulePeriodScreenState();
}

class _SchedulePeriodScreenState extends State<SchedulePeriodScreen> {
  int? _cycleLength;
  List<int> items = [];
  DateTime? _focusedDay;
  DateTime? _lastDay;
  DateTime? _firstDay;
  DateTime? _selectedDay;

  void _onDaySelect(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
    });
  }

  @override
  void initState() {
    for(int i=20;i<=40;i++){
      items.add(i);
    }
    super.initState();
    _focusedDay = DateTime.now();
    _lastDay = DateTime.now();
    _firstDay = DateTime.now().subtract(Duration(days: 45));
    _cycleLength = 28;
  }
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    TableCalendar tableCalendar = TableCalendar(
      firstDay: this._firstDay!,
      lastDay: this._lastDay!,
      focusedDay: this._focusedDay!,
      calendarFormat: CalendarFormat.month,
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
      ),
      rowHeight: 45.0,
      calendarStyle: CalendarStyle(
        isTodayHighlighted: false,
        selectedDecoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).primaryColor,
        ),
      ),
      // daysOfWeekStyle: DaysOfWeekStyle(
      //   weekdayStyle: Theme.of(context).textTheme.bodyText1,
      //   weekendStyle: Theme.of(context).textTheme.bodyText1,
      // ),
      availableGestures: AvailableGestures.horizontalSwipe,
      selectedDayPredicate: (day) => isSameDay(this._selectedDay, day),
      onDaySelected: this._onDaySelect,
      onPageChanged: (focusedDay) {
        this._focusedDay = focusedDay;
      },
    );

    //     );

    Container datePicker() => Container(
      margin: EdgeInsets.only(
        top: 0.0,
        bottom: 20.0,
        left: 15.0,
        right: 15.0,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 10.0,
        shadowColor: Theme.of(context).primaryColor.withOpacity(0.2),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  "Select your last date of period?",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              tableCalendar,
            ]),
      ),
    );

    Column main() => Column(
      children: [

        Text(
          "Predict cycle accurately.",
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Padding(padding: EdgeInsets.all(2.0)),
        Text(
          "Track period easily.",
          style: Theme.of(context).textTheme.bodyText2,
        ),
        SizedBox(height: 20),
      ],
    );

    return Scaffold(
      backgroundColor: Color(0xFFB77DE3),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 5.0),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              main(),
              // cycleLengthPicker(),
              datePicker(),
              Text("$_selectedDay"),
              Text("${items[_currentIndex]}"),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.only(top: 5.0),
                height: 75,
                width: 375,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),

                  shadowColor: Theme.of(context).primaryColor.withOpacity(0.2),

                  child:
                  CarouselSlider(
                    options: CarouselOptions(
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });

                      },
                      aspectRatio: 2.0,
                      enlargeCenterPage: false,
                      viewportFraction: .2,
                    ),
                    items: items.map((item) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            child: Center(
                              child: Text(
                                item.toString(),
                                style: TextStyle(fontSize: 20.0),
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),

                ),
              ),
              SizedBox(height: 10),
              Text("Pick usual menstrual cycle length"),
              SizedBox(height: 10,),
              ElevatedButton(
                onPressed: () => NotificationController.scheduleNewNotification(_selectedDay,items[_currentIndex]),
                  child: Text("Remind me :)"),)
            ],
          ),
        ),
      ),
    );
  }
}

