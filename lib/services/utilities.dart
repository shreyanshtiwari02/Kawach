import 'package:flutter/material.dart';
import 'package:kawach/services/notification_service.dart';

int createUniqueId() {
  return DateTime.now().millisecondsSinceEpoch.remainder(100000);
}

class NotificationWeekAndTime {
  final int dayOfTheWeek;
  final TimeOfDay timeOfDay;

  NotificationWeekAndTime({
    required this.dayOfTheWeek,
    required this.timeOfDay,
  });
}

Future<NotificationWeekAndTime?> pickSchedule(
    BuildContext context,
    ) async {
  Map<int , String> watertimer = {
    30:"0.5 hour",
    60:"1 hour",
    90:"1.5 hour",
    120:"2 hour",
  };
  TimeOfDay? timeOfDay;
  DateTime now = DateTime.now();
  int? selectedDay;

  await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'I want to be reminded every:',
            textAlign: TextAlign.center,
          ),
          content: Wrap(
            alignment: WrapAlignment.center,
            spacing: 3,
            children: [
              for (int index = 0; index < watertimer.length; index++)
                ElevatedButton(
                  onPressed: () {
                    waterReminderScheduler(index+1);


                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.white,
                    ),
                  ),
                  child: Text(watertimer[(index+1)*30].toString()),
                ),
            ],
          ),
        );
      });

  // if (selectedDay != null) {
  //   timeOfDay = await showTimePicker(
  //       context: context,
  //       initialTime: TimeOfDay.fromDateTime(
  //         now.add(
  //           Duration(minutes: 1),
  //         ),
  //       ),
  //       builder: (BuildContext context, Widget? child) {
  //         return Theme(
  //           data: ThemeData(
  //             colorScheme: ColorScheme.light(
  //               primary: Colors.teal,
  //             ),
  //           ),
  //           child: child!,
  //         );
  //       });
  //
  //   if (timeOfDay != null) {
  //     return NotificationWeekAndTime(
  //         dayOfTheWeek: selectedDay!, timeOfDay: timeOfDay);
  //   }
  // }
  // return null;
}
void waterReminderScheduler(int interval){
  final currentTime = DateTime.now();
  final initialTime = currentTime.copyWith(hour: 02, minute: 30 , second: 0 ,microsecond: 0 , millisecond: 0);
  int val = ((12*60)/(30*interval)).toInt();
  for(int i=1;i<=val;i++){
    NotificationController.scheduleWaterNotification(initialTime,i*30);
  }
}

