
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sneakers_store/constants.dart';
import 'package:sneakers_store/core/utils/app_router.dart';
import 'package:sneakers_store/screens/intro/model/intro_model.dart';
import 'package:sneakers_store/screens/welcome_screen/welcome_screen.dart';
import 'package:sneakers_store/translate.dart';
import 'package:sneakers_store/translations/locale_keys.g.dart';
import 'components/animated_widget.dart';
import 'components/custom_buttons.dart';
import 'package:easy_localization/easy_localization.dart';

class IntroductionPageView extends StatefulWidget {
  const IntroductionPageView({Key? key}) : super(key: key);

  @override
  State<IntroductionPageView> createState() => _IntroductionPageViewState();
}

class _IntroductionPageViewState extends State<IntroductionPageView> {
  PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(

        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                controller: pageController,
                itemCount: listOfItems.length,
                onPageChanged: (newIndex) {
                  setState(() {
                    currentIndex = newIndex;
                  });
                },
                physics: const BouncingScrollPhysics(),
                itemBuilder: ((context, index) {
                  return Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(15, 40, 15, 10),
                        width: size.width,
                        height: size.height / 2.5,
                        child: CustomAnimatedWidget(
                          index: index,
                          delay: 100,
                          child: Lottie.network(listOfItems[index].img),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: CustomAnimatedWidget(
                            index: index,
                            delay: 300,
                            child: Text(
                              listOfItems[index].title,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                  color: Colors.black, fontSize: 26),
                            ),
                          )),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: CustomAnimatedWidget(
                          index: index,
                          delay: 500,
                          child: Text(
                            listOfItems[index].subTitle,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                fontSize: 17, fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SmoothPageIndicator(
                    controller: pageController,
                    count: listOfItems.length,
                    effect:  ExpandingDotsEffect(
                      spacing: 6.0,
                      radius: 10.0,
                      dotWidth: 10.0,
                      dotHeight: 10.0,
                      expansionFactor: 3.8,
                      dotColor: Colors.grey,
                      activeDotColor:KPrimaryColor,
                    ),
                    onDotClicked: (newIndex) {
                      setState(() {
                        currentIndex = newIndex;
                        pageController.animateToPage(newIndex,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease);
                      });
                    },
                  ),
                  const Spacer(),
                  currentIndex == 2
                      ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: PrimaryButton(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>const WelcomeScreen()), (route) => false);
                      },
                      text:Translate.IntroPage3NameSubtitle3,
                    ),
                  )
                      : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: PrimaryButton(
                      onTap: () {
                        setState(() {
                          pageController.animateToPage(2,
                              duration: const Duration(milliseconds: 1000),
                              curve: Curves.fastOutSlowIn);
                        });
                      },
                      text:Translate.IntroPage3NameSubtitle4,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ));
  }
}
