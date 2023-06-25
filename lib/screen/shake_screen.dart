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
  late ShakeDetector shakeDetector;
  int counter=0;
  @override
  void initState() {
    super.initState();
    shakeDetector = ShakeDetector.autoStart(
      shakeThresholdGravity: 2.5, // Shake intensity threshold
      onPhoneShake: () {
        google_maps_launcher(metro_url);
        setState(() {
          //  google_maps_launcher(police_url);
          counter++;
        });
      },
    );
  }


  @override
  void dispose() {
    shakeDetector.stopListening();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("shake"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed:(){ google_maps_launcher(police_url);},
              child: Text('Nearest Police Station'),
            ),
            ElevatedButton(
              onPressed:(){ google_maps_launcher(metro_url);},
              child: Text('Nearest Metro Station'),
            ),
            ElevatedButton(
              onPressed:(){ google_maps_launcher(hospital_url);},
              child: Text('Nearest Hospital'),
            ),
            Text("$counter"),
          ],
        ),
      ),
    );
  }
}
