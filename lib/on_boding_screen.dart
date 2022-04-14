import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:roya_immobilie/RouteScreen/routeScreen.dart';
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
class OnBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SafeArea(
    child: IntroductionScreen(
      pages: [
        PageViewModel(
          title: 'Roya',
          body: 'Roya Immobilier est active dans le domaine Achat & vente de biens immobiliers propres.',
          image: Image.asset("assets/house.png"),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'Featured Books',
          body: 'Available right at your fingerprints',
          image: Image.asset("assets/house.png"),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'Simple UI',
          body: 'For enhanced reading experience',
          image: Image.asset("assets/house.png",),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'Roya',
          body: 'Start your journey',
          footer: ButtonWidget(
            text: 'Login',
            onClicked: () => goToHome(context),
          ),
          image:Image.asset("assets/house.png"),
          decoration: getPageDecoration(),
        ),
      ],
      done: Align(alignment:Alignment.topRight,child: Text('Read', style: TextStyle(fontWeight: FontWeight.w600,color: Color.fromARGB(255, 130, 108, 219)),)),
      onDone: () => goToHome(context),
      showSkipButton: true,
     skip: Align(alignment:Alignment.topLeft,child: Text('Skip',style: TextStyle(color:Color.fromARGB(255, 130, 108, 219)),)),
      onSkip: () => goToHome(context),
      next: Align(alignment:Alignment.topRight,child: Icon(Icons.arrow_forward,color: Color.fromARGB(255, 130, 108, 219),)),
      dotsDecorator: getDotDecoration(),
      onChange: (index) => print('Page $index selected'),
      globalBackgroundColor: Colors.white,
      //dotsFlex: 0,
     //nextFlex: 0,
      // isProgressTap: false,
      // isProgress: false,
      // showNextButton: false,
    //  freeze: true,
      animationDuration: 1000,
    ),
  );

  void goToHome(context) => Get.to( RoutingScreen()  );

  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 350));

  DotsDecorator getDotDecoration() => DotsDecorator(
    color: Color.fromARGB(255, 130, 108, 219),
    activeColor:Color.fromARGB(255, 46, 34, 106),
    size: Size(5, 5),
    activeSize: Size(22, 10),
    activeShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
  );

  PageDecoration getPageDecoration() => PageDecoration(
    titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
    bodyTextStyle: TextStyle(fontSize: 20),
    //descriptionPadding: EdgeInsets.all(16).copyWith(bottom: 0),
    imagePadding: EdgeInsets.all(24),
    pageColor: Colors.white,
  );
}
class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    required this.text,
    required this.onClicked,
  }) ;

  @override
  Widget build(BuildContext context) => MaterialButton(
    onPressed: onClicked,
    color: Theme.of(context).primaryColor,
    shape: StadiumBorder(),
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    child: Text(
      text,
      style: TextStyle(color: Colors.white, fontSize: 16),
    ),
  );
}