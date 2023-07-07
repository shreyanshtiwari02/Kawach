import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shake/shake.dart';


class ShakeScreen extends StatefulWidget {
  const ShakeScreen({Key? key}) : super(key: key);
  @override
  State<ShakeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ShakeScreen> {
  final Uri police_url = Uri.parse('https://www.google.com/maps/dir/?api=1&destination=Nearest+police+station&waypoints=nearest+metro+station');
  final Uri metro_url = Uri.parse('https://www.google.com/maps/dir/?api=1&destination=Nearest+police+station&dir_action=navigate&waypoints=nearest+metro+station%7Cnearest+hospital');
  final Uri hospital_url = Uri.parse('https://www.google.com/maps/dir/?api=1&destination=Nearest+hospital');

  Future<void> google_maps_launcher(Uri destination) async {
    if (!await launchUrl(
        destination,
        mode: LaunchMode.externalNonBrowserApplication
    )
    )
    {
      throw 'Could not launch';
    }
  }

  //shake

  int counter=0;
  @override
  void initState() {
    super.initState();
  }


  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFEADAF5),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed:(){ google_maps_launcher(police_url);},
              child: const Text('Nearest Police Station'),
            ),
            ElevatedButton(
              onPressed:(){ google_maps_launcher(metro_url);},
              child: const Text('Nearest Metro Station'),
            ),
            ElevatedButton(
              onPressed:(){ google_maps_launcher(hospital_url);},
              child: const Text('Nearest Hospital'),
            ),
            Text("$counter"),
          ],
        ),
      ),
    );
  }
}
