

import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shake/shake.dart';
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';

import '../main.dart';
import '../services/notification_service.dart';
import 'home_screen.dart';
import 'profile_screen.dart';
import 'shake_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:kawach/main.dart';

import 'navbar_provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});



  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final Uri hospital_url = Uri.parse('womenapp://kawach.com/path');
  bool _initialURILinkHandled = false;
  Uri? _initialURI;
  Uri? _currentURI;
  Object? _err;
  StreamSubscription? _streamSubscription;
  ShakeDetector? _shakeDetector;

  @override
  void initState()  {
    NotificationController.startListeningNotificationEvents();
    _initURIHandler();
    _incomingLinkHandler();
    _configureShakeDetector();
    AwesomeNotifications().isNotificationAllowed().then(
          (isAllowed) {
        if (!isAllowed) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Allow Notifications'),
              content: const Text('Our app would like to send you notifications'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Don\'t Allow',
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                ),
                TextButton(
                  onPressed: () => AwesomeNotifications()
                      .requestPermissionToSendNotifications()
                      .then((_) => Navigator.pop(context)),
                  child: const Text(
                    'Allow',
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );


    super.initState();
  }

  void _configureShakeDetector() {
    _shakeDetector = ShakeDetector.autoStart(
      shakeThresholdGravity: 2.5, // Adjust the gravity value here
      onPhoneShake: () {
        NotificationController.createNewNotification();

        // createShakeNotification();
        google_maps_launcher(hospital_url);
        setState(() {
        });
      },
    );
  }
  Future<void> _initURIHandler() async {
    // 1
    if (!_initialURILinkHandled) {
      _initialURILinkHandled = true;
      // 2
      Fluttertoast.showToast(
          msg: "Invoked _initURIHandler",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white
      );
      try {
        // 3
        final initialURI = await getInitialUri();
        // 4
        if (initialURI != null) {
          debugPrint("Initial URI received $initialURI");
          if (!mounted) {
            return;
          }
          setState(() {
            _initialURI = initialURI;
          });
        } else {
          debugPrint("Null Initial URI received");
        }
      } on PlatformException { // 5
        debugPrint("Failed to receive initial uri");
      } on FormatException catch (err) { // 6
        if (!mounted) {
          return;
        }
        debugPrint('Malformed Initial URI received');
        setState(() => _err = err);
      }
    }
  }
  void _incomingLinkHandler() {
    // 1
    if (!kIsWeb) {
      // 2
      _streamSubscription = uriLinkStream.listen((Uri? uri) {

        if (!mounted) {
          return;
        }
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ShakeScreen()));
        debugPrint('Received URI: $uri');
        setState(() {

          _currentURI = uri;
          _err = null;
        });
        // 3
      }, onError: (Object err) {
        if (!mounted) {
          return;
        }
        debugPrint('Error occurred: $err');
        setState(() {
          _currentURI = null;
          if (err is FormatException) {
            _err = err;
          } else {
            _err = null;
          }
        });
      });
    }
  }
  @override
  void dispose() {

    _streamSubscription?.cancel();
    super.dispose();
  }
  Future<void> google_maps_launcher(Uri destination) async {

    if (!await launchUrl(destination,
        mode: LaunchMode.externalNonBrowserApplication))
    {
      throw 'Could not launch';
    }
  }


   static Future<void> onActionReceivedMethod(ReceivedAction receivedAction) async {

    // print("here ......................");
    // print(MyApp.navigatorKey);
    // print(MyApp.navigatorKey.currentContext);
    //  MyApp.navigatorKey.currentState?.push(
    //    MaterialPageRoute(
    //      builder: (_) =>  ShakeScreen(),
    //    ),
    //  );
    //  print("here again ....................");
  }

  final items =  [
    Lottie.asset("assets/animations/safety2.json",height: 50),
    Lottie.asset("assets/animations/home.json",height: 50),
    Lottie.asset("assets/animations/profile.json",height: 50 ),
  ];

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    final currentIndex = navigationProvider.currentIndex;
    return Scaffold(

      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   title: const Text("nav_bar"),
      // ),
      body: _buildScreen(currentIndex),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: const Color(0xFFEADAF5),
        items: items,
        index: currentIndex,
        onTap: (selectedindex) {
          navigationProvider.updateCurrentIndex(selectedindex);
        },
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  Widget _buildScreen(int index) {
    switch (index) {
      case 0:
        return ShakeScreen();
      case 2:
        return ProfilePage();
      case 1:
        return HomePage();
      default:
        return HomePage();
    // Add more cases for additional screens
    }
  }
}

