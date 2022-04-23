import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:roya_immobilie/RouteScreen/routeScreen.dart';
import 'package:roya_immobilie/View/page/auth/Login/login_screen.dart';
import 'package:roya_immobilie/View/routing_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'View/page/Home/home.dart';

//
// class OnBoardingScreen extends StatefulWidget {
//   @override
//   _OnBoardingScreenState createState() => _OnBoardingScreenState();
// }
//
// class _OnBoardingScreenState extends State<OnBoardingScreen> {
//   PageController pageController = PageController();
//
//   ///list of strings containing onBoarding titles
//   final List<dynamic> _titlesList = [
//     // DefaultTextStyle(
//     //   style: const TextStyle(
//     //     fontSize: 60.0,
//     //   ),
//     //   child: AnimatedTextKit(
//     //     animatedTexts: [
//     //       WavyAnimatedText("........"),
//     //       WavyAnimatedText("........"),
//     //       WavyAnimatedText("........"),
//     //       WavyAnimatedText("........"),
//     //     ],
//     //     isRepeatingAnimation: true,
//     //     onTap: () {
//     //       print("Tap Event");
//     //     },
//     //   ),
//     // ),
//     const Padding(
//       padding: EdgeInsets.all(20.0),
//       child: Text('Use this starter kit to make your own classifieds app in minutes.' , style: TextStyle(fontSize: 20),),
//     ),
//     Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: MaterialButton(
//         height: 58,
//         minWidth: 240,
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12)),
//         onPressed: () {},
//         child: const Text(
//           "Email / Password",
//           style: TextStyle(
//             fontSize: 24,
//             color: Colors.black,
//           ),
//         ),
//         color: Colors.blue,
//       ),
//     ),
//
//   ];
//
//   /// list of strings containing onBoarding subtitles, the small text under the
//   /// title
//   final List<dynamic> _subtitlesList = [
//    // Text(''),
//     Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: MaterialButton(
//         height: 58,
//         minWidth: 240,
//         shape: RoundedRectangleBorder(
//             borderRadius: new BorderRadius.circular(12)),
//         onPressed: () {
// Get.offAll(const RoutingScreen());
//         },
//         child: const Text(
//           "Get Started",
//           style: TextStyle(
//             fontSize: 24,
//             color: Colors.black,
//           ),
//         ),
//         color: Colors.blue,
//       ),
//     ),
//     Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Container()
//     ),
//   ];
//
//   /// list containing image paths or IconData representing the image of each page
//   final List<dynamic> _imageList = [
//   // SvgPicture.asset('assets/icon/logo-roya.svg',
//   // color: Colors.white,
//   // width: 80,
//   // height: 80,) ,
//     Image.asset('assets/images/logo-roya.png' , width: 150,height: 150,) ,
//     Image.asset('assets/images/logo-roya.png', width: 150,height: 150,) ,
//   ];
//
//   int _currentIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor:Colors.blue,
//       body: Stack(
//         children: <Widget>[
//           PageView.builder(
//             itemBuilder: (context, index) => getPage(
//                 _imageList[index],
//                 _titlesList[index],
//                 _subtitlesList[index],
//                 context,
//                 index + 1 == _titlesList.length),
//             controller: pageController,
//             itemCount: _titlesList.length,
//             onPageChanged: (int index) {
//               setState(() {
//                 _currentIndex = index;
//               });
//             },
//           ),
//           Visibility(
//             visible: _currentIndex + 1 == _titlesList.length,
//             child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Align(
//                   alignment: Directionality.of(context) == TextDirection.ltr
//                       ? Alignment.bottomRight
//                       : Alignment.bottomLeft,
//                   child: OutlinedButton(
//                     onPressed: () {
//                       setFinishedOnBoarding();
//                       Get.offAll(RoutingScreen());
//                     },
//                     child: Text(
//                       'Continue',
//                       style: TextStyle(
//                           fontSize: 14.0,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold),
//                     ),
//                     style: OutlinedButton.styleFrom(
//                         side: BorderSide(color: Colors.white),
//                         shape: StadiumBorder()),
//                   ),
//                 )),
//           ),
//           // Padding(
//           //   padding: const EdgeInsets.only(bottom: 50.0),
//           //   child: Align(
//           //     alignment: Alignment.bottomCenter,
//           //     child: SmoothPageIndicator(
//           //       controller: pageController,
//           //       count: _titlesList.length,
//           //       effect: ScrollingDotsEffect(
//           //           activeDotColor: Colors.white,
//           //           dotColor: Colors.grey.shade400,
//           //           dotWidth: 8,
//           //           dotHeight: 8,
//           //           fixedCenter: true),
//           //     ),
//           //   ),
//           // )
//         ],
//       ),
//     );
//   }
//
//   Widget getPage(dynamic image,  title,  subTitle,
//       BuildContext context, bool isLastPage) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         image,
//         SizedBox(height: 0),
//         title ,
//
//
//         Padding(
//           padding: const EdgeInsets.all(0.0),
//           child:
//             subTitle,
//
//
//         ),
//       ],
//     );
//   }
//
//   Future<bool> setFinishedOnBoarding() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.setBool('finishedOnBoarding', true);
//   }
// }

class BoardingPage extends StatefulWidget {
  @override
  _BoardingScreenState createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingPage> {
  // creating all the widget before making our home screeen

  int _currentPage = 0;
  List<Slide> _slides = [];
  PageController _pageController = PageController();

  @override
  void initState() {
    _currentPage = 0;
    _slides = [
      Slide("assets/resources/img2.jpg", ""),
      Slide(
          "assets/resources/slide2.png", ""),
      Slide("assets/resources/slide3.png",
          ""),
      Slide("assets/resources/img2.jpg",
          ""),
      Slide("assets/resources/img1.jpg",
          ""),

    ];
    _pageController = PageController(initialPage: _currentPage);
    super.initState();
  }

  // the list which contain the build slides
  List<Widget> _buildSlides() {
    return _slides.map(_buildSlide).toList();
  }

  // building single slide

  Widget _buildSlide(Slide slide) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            margin: EdgeInsets.all(32),
            child: Image.asset(slide.image, fit: BoxFit.contain),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 70),
          child: Text(
            slide.heading,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        SizedBox(
          height: 230,
        )
      ],
    );
  }

  // handling the on page changed
  void _handlingOnPageChanged(int page) {
    setState(() => _currentPage = page);
  }

  // building page indicator
  Widget _buildPageIndicator() {
    Row row = Row(mainAxisAlignment: MainAxisAlignment.center, children: []);
    for (int i = 0; i < _slides.length; i++) {
      row.children.add(_buildPageIndicatorItem(i));
      if (i != _slides.length - 1)
        row.children.add(SizedBox(
          width: 12,
        ));
    }
    return row;
  }

  Widget _buildPageIndicatorItem(int index) {
    return Container(
      width: index == _currentPage ? 8 : 5,
      height: index == _currentPage ? 8 : 5,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: index == _currentPage
              ? Color.fromRGBO(136, 144, 178, 1)
              : Color.fromRGBO(206, 209, 223, 1)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          PageView(
            controller: _pageController,
            onPageChanged: _handlingOnPageChanged,
            physics: BouncingScrollPhysics(),
            children: _buildSlides(),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              children: <Widget>[
                _buildPageIndicator(),
                SizedBox(
                  height: 32,
                ),
                Container(
                  // see the page indicators

                  margin: EdgeInsets.symmetric(horizontal: 32),
                  child: SizedBox(
                      width: double.infinity,
                      child: GradientButton(
                        callback: ()  async {
                          final SharedPreferences prefs = await SharedPreferences.getInstance();
                          prefs.setBool('finishedOnBoarding', true);
                          Get.offAll(LoginScreen());
                        },
                        gradient: LinearGradient(colors: [
                          Color.fromRGBO(11, 198, 200, 1),
                          Color.fromRGBO(68, 183, 183, 1)
                        ]),
                        elevation: 0,
                        increaseHeightBy: 28,
                        increaseWidthBy: double.infinity,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                            letterSpacing: 4,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                MaterialButton(
                    child: Text(
                      "skip",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey,
                      ),
                    ),
                    onPressed: () async {
                      final SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setBool('finishedOnBoarding', true);
                      Get.offAll(RoutingScreen());}),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
// class OnBoardingScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) => SafeArea(
//     child: IntroductionScreen(
//       pages: [
//         PageViewModel(
//           title: 'Roya',
//           body: 'Roya Immobilier est active dans le domaine Achat & vente de biens immobiliers propres.',
//           image: Image.asset("assets/logo-roya.png"),
//           decoration: getPageDecoration(),
//         ),
//         PageViewModel(
//           title: 'Simple UI',
//           body: '',
//           image: Image.asset("assets/images/img2.jpg",height: 500,),
//           decoration: getPageDecoration(),
//         ),
//         PageViewModel(
//
//           title: 'Roya',
//           body: '',
//
//           footer: ButtonWidget(
//             text: 'Login',
//             onClicked: () => goToHome(context),
//           ),
//           image:Image.asset("assets/images/img3.jpg",height: 500),
//           decoration: getPageDecoration(),
//         ),
//       ],
//       done: Align(alignment:Alignment.topRight,child: Text('Annoce', style: TextStyle(fontWeight: FontWeight.w600,color: Color.fromARGB(255, 130, 108, 219)),)),
//       onDone: () => goToHome(context),
//       showSkipButton: true,
//      skip: Align(alignment:Alignment.topLeft,child: Text('Skip',style: TextStyle(color:Color.fromARGB(255, 130, 108, 219)),)),
//       onSkip: () => goToHome(context),
//       next: Align(alignment:Alignment.topRight,child: Icon(Icons.arrow_forward,color: Color.fromARGB(255, 130, 108, 219),)),
//       dotsDecorator: getDotDecoration(),
//       onChange: (index) => print('Page $index selected'),
//       globalBackgroundColor: Colors.white,
//       //dotsFlex: 0,
//      //nextFlex: 0,
//       // isProgressTap: false,
//       // isProgress: false,
//       // showNextButton: false,
//     //  freeze: true,
//       animationDuration: 1000,
//     ),
//   );
//
//   void goToHome(context) => Get.to( RoutingScreen()  );
//
//   Widget buildImage(String path) =>
//       Center(child: Image.asset(path, width: 350));
//
//   DotsDecorator getDotDecoration() => DotsDecorator(
//     color: Color.fromARGB(255, 130, 108, 219),
//     activeColor:Color.fromARGB(255, 46, 34, 106),
//     size: Size(5, 5),
//     activeSize: Size(22, 10),
//     activeShape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(24),
//     ),
//   );
//
//   PageDecoration getPageDecoration() => PageDecoration(
//     titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//     bodyTextStyle: TextStyle(fontSize: 20),
//     //descriptionPadding: EdgeInsets.all(16).copyWith(bottom: 0),
//     imagePadding: EdgeInsets.all(24),
//     pageColor: Colors.white,
//   );
// }
// class ButtonWidget extends StatelessWidget {
//   final String text;
//   final VoidCallback onClicked;
//
//   const ButtonWidget({
//     required this.text,
//     required this.onClicked,
//   }) ;
//
//   @override
//   Widget build(BuildContext context) => MaterialButton(
//     onPressed: onClicked,
//     color: Theme.of(context).primaryColor,
//     shape: StadiumBorder(),
//     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//     child: Text(
//       text,
//       style: TextStyle(color: Colors.white, fontSize: 16),
//     ),
//   );
// }

class Slide {
  String image;
  String heading;

  Slide(this.image, this.heading);
}
