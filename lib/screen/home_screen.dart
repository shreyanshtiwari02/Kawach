//home page
import 'package:flutter/material.dart';
import '../reusable_widgets/icons.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  final List<String> _list = ['assets/images/rectangle2.svg', 'assets/images/rectangle2.svg'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEADAF5) ,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [];
        },
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          // uppermost margin
          SizedBox(
            height: 30,
          ),

          // USER NAME field
          Text("USER NAME",
              style: TextStyle(
                color: Color(0xFF0F2851),
                // fontFamily: 'Roboto',
                fontSize: 15,
                fontWeight: FontWeight.bold,
              )),

          // space

          SizedBox(
            height: 30,
          ),

          // articles/stories
          Container(
            height: 200,
            child: PageView.builder(
              itemBuilder: (context, index) {
                return Center(
                    child: Container(
                      // padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                      child: SvgPicture.asset(_list[index % _list.length],
                          fit: BoxFit.contain),
                    ));
              },
            ),
          ),
          //spacing
          SizedBox(
            height: 35,
          ),
          //search bar
          SvgPicture.asset("assets/images/search.svg"),

          //space
          SizedBox(
            height: 45,
          ),
          //
          SingleChildScrollView(
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    HeartButton(),
                    SizedBox(height: 4),
                    HeartButton(),
                    SizedBox(height: 4),
                    HeartButton(),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    HeartButton(),
                    SizedBox(height: 4),
                    HeartButton(),
                    SizedBox(height: 4),
                    HeartButton(),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    HeartButton(),
                    SizedBox(height: 4),
                    HeartButton(),
                    SizedBox(height: 4),
                    HeartButton(),
                  ],
                ),
                SizedBox(height: 20),
              ])),
// bottom navigation bar
        ]),
      ),
    );
  }
}