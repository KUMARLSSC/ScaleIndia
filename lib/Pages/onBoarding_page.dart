import 'dart:io';

import 'package:Scaleindia/ApiModel/slider_model.dart';
import 'package:Scaleindia/ViewModels/onBoardingPage_viewmodel.dart';
import 'package:Scaleindia/shared/shared_styles.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  List<SliderModel> mySlides = new List<SliderModel>();
  int slideIndex = 0;
  PageController controller;

  Widget _buildPageIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.grey : Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    mySlides = getSlides();
    controller = new PageController();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnBoardPageViewModel>.reactive(
        viewModelBuilder: () => OnBoardPageViewModel(),
        builder: (context, model, child) => Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                const Color(0xff3C8CE7),
                const Color(0xff00EAFF)
              ])),
              child: Scaffold(
                  backgroundColor: kBlack,
                  body: Container(
                    height: MediaQuery.of(context).size.height - 100,
                    child: PageView(
                      controller: controller,
                      onPageChanged: (index) {
                        setState(() {
                          slideIndex = index;
                        });
                      },
                      children: [
                        SlideTile(
                          title: mySlides[0].getTitle(),
                          imagePath: mySlides[0].getImageAssetPath(),
                          desc: mySlides[0].getDesc(),
                        ),
                        SlideTile(
                          title: mySlides[1].getTitle(),
                          imagePath: mySlides[1].getImageAssetPath(),
                          desc: mySlides[1].getDesc(),
                        ),
                        SlideTile(
                          title: mySlides[2].getTitle(),
                          imagePath: mySlides[2].getImageAssetPath(),
                          desc: mySlides[2].getDesc(),
                        ),
                        SlideTile(
                          title: mySlides[3].getTitle(),
                          imagePath: mySlides[3].getImageAssetPath(),
                          desc: mySlides[3].getDesc(),
                        ),
                        SlideTile(
                          title: mySlides[4].getTitle(),
                          imagePath: mySlides[4].getImageAssetPath(),
                          desc: mySlides[4].getDesc(),
                        ),
                        SlideTile(
                          title: mySlides[5].getTitle(),
                          imagePath: mySlides[5].getImageAssetPath(),
                          desc: mySlides[5].getDesc(),
                        ),
                      ],
                    ),
                  ),
                  bottomSheet: slideIndex != 5
                      ? Container(
                          margin: EdgeInsets.symmetric(vertical: 1),
                          color: kBlackAccent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FlatButton(
                                onPressed: () {
                                  controller.animateToPage(5,
                                      duration: Duration(milliseconds: 400),
                                      curve: Curves.linear);
                                },
                                splashColor: Colors.blue[50],
                                child: Text(
                                  "Skip",
                                  style: TextStyle(
                                      color: Color(0xFF0074E4),
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    for (int i = 0; i < 6; i++)
                                      i == slideIndex
                                          ? _buildPageIndicator(true)
                                          : _buildPageIndicator(false),
                                  ],
                                ),
                              ),
                              FlatButton(
                                onPressed: () {
                                  controller.animateToPage(slideIndex + 1,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.linear);
                                },
                                splashColor: Colors.blue[50],
                                child: Text(
                                  "Next",
                                  style: TextStyle(
                                      color: Color(0xFF0074E4),
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            model.navigateToHomePage();
                          },
                          child: Container(
                            height: Platform.isIOS ? 70 : 60,
                            color: kBlackAccent,
                            alignment: Alignment.center,
                            child: Text(
                              "GET STARTED NOW",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        )),
            ));
  }
}

class SlideTile extends StatelessWidget {
  final String imagePath, title, desc;
  SlideTile({this.desc, this.imagePath, this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
          SizedBox(
            height: 20,
          ),
          Image.asset(imagePath),
          SizedBox(
            height: 30,
          ),
          Text(
            desc,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14,color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
