//home page
import 'package:flutter/material.dart';
import '../reusable_widgets/icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> headlines = [];

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  Future<List<dynamic>> fetchWomenHealthTips(String apiKey) async {
    String url = 'https://newsapi.org/v2/everything?q=women%20health%20tips&apiKey=$apiKey';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      return jsonData['articles'];
    } else {
      throw Exception('Failed to load women health tips articles');
    }
  }

  void fetchNews() async {
    String apiKey = '34f4259e519341a5bdd51faa0bac19d8'; // Replace with your actual NewsAPI key
    List<dynamic> result = await fetchWomenHealthTips(apiKey);
    setState(() {
      headlines = result;
    });
  }

  void launchURL(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url , mode: LaunchMode.externalNonBrowserApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Color(0xFFEADAF5),
            body: ListView(

                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // uppermost margin
                  SizedBox(
                    height: 30,
                  ),

                  // USER NAME field
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Username",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      )
                    ],
                  ),
                
                  // space

                  SizedBox(
                    height: 15,
                  ),

                  // articles/stories
                  Container(
                    height: 250,
                    child: PageView.builder(
          
          itemCount: headlines.length,
          itemBuilder: (context, index) {
            var article = headlines[index];
            if (article['urlToImage'] == null) {
              return SizedBox(
                height: 1,
              ); // Skip displaying the card if image URL is null
            }
            return  InkWell(
              onTap: () {
                final news_url= Uri.parse(article['url']);
                launchURL(news_url);
              },
              child: Card(
                elevation: 4,
                margin: EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Container(
                  height:250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: NetworkImage(article['urlToImage']),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          article['title'],
                          style: TextStyle(
                            color: Color.fromARGB(255, 241, 237, 237),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
                  ),
                  //spacing
                  SizedBox(
                    height: 20,
                  ),
                  // search bar
                  SvgPicture.asset("assets/images/search.svg"),

                  //space
                  SizedBox(
                    height: 40,
                  ),
                  //
                  SingleChildScrollView(
                      child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                ]
                )
                );
  }
}