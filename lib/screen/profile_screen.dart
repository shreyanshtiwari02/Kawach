import 'package:flutter/material.dart';

import '../reusable_widgets/cards.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _Profile_PageState();
}

class _Profile_PageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: const Color(0xFFEADAF5),
          body: Container(
            color: Colors.white54,
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                ListTile(
                  leading: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(Icons.arrow_back),
                  ),
                  trailing: GestureDetector(
                    onTap: () {},
                    child: Icon(Icons.menu),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircleAvatar(
                      maxRadius: 65,
                      foregroundImage: AssetImage("assets/erza.jpg"),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Ms. XYZ",
                      style:
                      TextStyle(fontWeight: FontWeight.w900, fontSize: 26),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [Text("@women123")],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Feeling Great!",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  child: Expanded(
                      child: ListView(
                        children: [
                          edit_profile(),
                          const SizedBox(
                            height: 10,
                          ),
                          help_support(),
                          const SizedBox(
                            height: 10,
                          ),
                          settings(),
                          const SizedBox(
                            height: 10,
                          ),
                          invite(),
                          const SizedBox(
                            height: 10,
                          ),
                          logout()
                        ],
                      )),
                )
              ],
            ),
          ),
        ));
  }
}
