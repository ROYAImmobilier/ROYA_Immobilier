import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:roya_immobilie/View/routing_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController pageController = PageController();

  ///list of strings containing onBoarding titles
  final List<dynamic> _titlesList = [
    DefaultTextStyle(
      style: const TextStyle(
        fontSize: 60.0,
      ),
      child: AnimatedTextKit(
        animatedTexts: [
          WavyAnimatedText("........"),
          WavyAnimatedText("........"),
          WavyAnimatedText("........"),
          WavyAnimatedText("........"),
        ],
        isRepeatingAnimation: true,
        onTap: () {
          print("Tap Event");
        },
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text('Use this starter kit to make your own classifieds app in minutes.' , style: TextStyle(fontSize: 20),),
    ),
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: MaterialButton(
        height: 58,
        minWidth: 240,
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(12)),
        onPressed: () {},
        child: Text(
          "Email / Password",
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
          ),
        ),
        color: Colors.blue,
      ),
    ),

  ];

  /// list of strings containing onBoarding subtitles, the small text under the
  /// title
  final List<dynamic> _subtitlesList = [
    Text(''),
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: MaterialButton(
        height: 58,
        minWidth: 240,
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(12)),
        onPressed: () {
Get.offAll(RoutingScreen());
        },
        child: Text(
          "Get Started",
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
          ),
        ),
        color: Colors.blue,
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container()
    ),
  ];

  /// list containing image paths or IconData representing the image of each page
  final List<dynamic> _imageList = [
  SvgPicture.asset('assets/icon/logo-roya.svg',
  color: Colors.white,
  width: 80,
  height: 80,) ,
    Image.asset('assets/images/logo-roya.png' , width: 150,height: 150,) ,
    Image.asset('assets/images/logo-roya.png', width: 150,height: 150,) ,
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.blue,
      body: Stack(
        children: <Widget>[
          PageView.builder(
            itemBuilder: (context, index) => getPage(
                _imageList[index],
                _titlesList[index],
                _subtitlesList[index],
                context,
                index + 1 == _titlesList.length),
            controller: pageController,
            itemCount: _titlesList.length,
            onPageChanged: (int index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          Visibility(
            visible: _currentIndex + 1 == _titlesList.length,
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Directionality.of(context) == TextDirection.ltr
                      ? Alignment.bottomRight
                      : Alignment.bottomLeft,
                  child: OutlinedButton(
                    onPressed: () {
                      setFinishedOnBoarding();
                      Get.offAll(RoutingScreen());
                    },
                    child: Text(
                      'Continue',
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.white),
                        shape: StadiumBorder()),
                  ),
                )),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(bottom: 50.0),
          //   child: Align(
          //     alignment: Alignment.bottomCenter,
          //     child: SmoothPageIndicator(
          //       controller: pageController,
          //       count: _titlesList.length,
          //       effect: ScrollingDotsEffect(
          //           activeDotColor: Colors.white,
          //           dotColor: Colors.grey.shade400,
          //           dotWidth: 8,
          //           dotHeight: 8,
          //           fixedCenter: true),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }

  Widget getPage(dynamic image,  title,  subTitle,
      BuildContext context, bool isLastPage) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        image,
        SizedBox(height: 0),
        title ,


        Padding(
          padding: const EdgeInsets.all(0.0),
          child:
            subTitle,


        ),
      ],
    );
  }

  Future<bool> setFinishedOnBoarding() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool('finishedOnBoarding', true);
  }
}
