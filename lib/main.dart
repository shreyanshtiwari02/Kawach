import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kawach/screen/home_screen.dart';
import 'package:kawach/screen/main_page.dart';
import 'package:kawach/screen/signin_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kawach/services/notification_service.dart';
import 'package:provider/provider.dart';
import '../screen/navbar_provider.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationController.initializeLocalNotifications();
  // AwesomeNotifications().initialize('resource://drawable/res_app_icon',
  // [NotificationChannel(
  //     channelKey: 'shake_notification',
  //     channelName: 'Shake Notifications',
  //     channelDescription: 'This channel is for opening app when a shake is detected',
  //     importance: NotificationImportance.Max,
  //     channelShowBadge: true,
  //     ),
  // NotificationChannel(
  //     channelKey: 'schedule_channel',
  //     channelName: 'Schedule Notifications',
  //     channelDescription: 'This channel is for scheduled notifications',
  //     importance: NotificationImportance.Max,
  //     channelShowBadge: true)
  // ]);

  await Firebase.initializeApp();

  runApp( MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  User? user;
  @override
  void initState() {

    user = FirebaseAuth.instance.currentUser;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NavigationProvider(),
      child:   MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: user != null ?const MainPage(): const SignInScreen(),
      ),
    );
  }
}


