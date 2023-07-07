import 'package:awesome_notifications/awesome_notifications.dart';

Future<void> createShakeNotification() async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: createUniqueId(),
      channelKey: 'shake_notification',
      title:
      '${Emojis.money_money_bag + Emojis.plant_cactus} Buy Plant Food!!!',
      body: 'Florist at 123 Main St. has 2 in stock.',
      // bigPicture: 'asset://assets/notification_map.png',
      fullScreenIntent: true,
      notificationLayout: NotificationLayout.BigText,
    ),
  );
}
int createUniqueId(){
  return DateTime.now().millisecondsSinceEpoch.remainder(54);
}