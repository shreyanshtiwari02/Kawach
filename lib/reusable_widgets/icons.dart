import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kawach/services/utilities.dart';

import '../screen/schedule_period.dart';
import '../services/notification_service.dart';

class HeartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        NotificationWeekAndTime? pickedSchedule = await pickSchedule(context);
        if(pickedSchedule!=null){
          createWaterReminderNotification(pickedSchedule);
        }
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SchedulePeriodScreen()),
        );
      },
      child: SvgPicture.asset(
        'assets/images/pregnancy.svg',
        // width: 120,
        // height: 120,
      ),
    );
  }
}
