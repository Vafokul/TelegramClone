import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'PhoneNumberPage.dart';


class WelcomePage extends StatefulWidget{
  @override
  _WelcomePageState createState() {
    // TODO: implement createState
    return _WelcomePageState();
  }

}
class _WelcomePageState extends State<WelcomePage>{
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Column(
          children:<Widget> [
            Container(
              height: MediaQuery.of(context).size.height*0.7,
              child: PageView(
                  controller: _pageController,
                children: [
                  WelcomePageItem(
                    image: 'assets/images/img.png',
                    title: 'Welcome to Telegram',
                    subtitle: 'The world’s fastest messaging app. It’s free and secure.',

                  ),
                  WelcomePageItem(
                    image: 'assets/images/img.png',
                    title: 'Fast',
                    subtitle: 'Telegram delivers messages faster than any other application.',

                  ),
                  WelcomePageItem (
                    image: 'assets/images/img.png',
                    title: 'Secure',
                    subtitle: 'Telegram keeps your messages safe from hacker attacks.',

                  ),
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
              child: SmoothPageIndicator(
                controller:_pageController ,
                count:3 ,
                effect: WormEffect(
                  dotHeight: 8.0,
                  dotWidth: 8.0,
                  activeDotColor: Color(0xFF0088CC),
                  dotColor: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50.0, 80.0, 50.0, 20.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: ()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>PhoneNumberPage())),
                  child: const Text('Start Messaging'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF0088CC),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    elevation: 5,
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }

}

class WelcomePageItem extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  WelcomePageItem({
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Padding(
        padding:EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget> [
          Image.asset(image,height: 180),
          SizedBox(
            height: 20,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0088CC),
            ),
          ),
          SizedBox(height: 10),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),

        ],
      ),
      ),
    );
  }

}

