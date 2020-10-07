import 'package:Scaleindia/ViewModels/thirdpage_viewmodel.dart';
import 'package:Scaleindia/shared/shared_styles.dart';
import 'package:Scaleindia/widgets/HeaderWidget.dart';
import 'package:Scaleindia/widgets/thirdpage_widget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ThirdPageViewModel>.reactive(
      viewModelBuilder: () => ThirdPageViewModel(),
      builder: (context, model, child) => Scaffold(
          appBar: PreferredSize(
              child: header(context, isAppTitle: true, isIcon: false),
              preferredSize: Size.fromHeight(50.0)),
          body: Padding(
            padding: EdgeInsets.only(left: 13),
            child: Container(
              height: MediaQuery.of(context).size.height - 170.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width - 40.0,
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.all(7),
                      child:  Center(
       
            child: Image.asset(
              "assets/img/logo.png",
              fit: BoxFit.fill,
              height: 120,
              width: 450,
            ),
          ),
        ),
                      
        SizedBox(
          height: 10,
        ),
        Center(
          child: Text(
            "Center and Assesser info",
            style: TextStyle(
                color: Colors.black, fontSize: 27, fontWeight: FontWeight.bold),
          ),
        ),
        Divider(
          color: Colors.black12,
          height: 15,
        ),
        SizedBox(
          height: 10,
        ),
                     
               model.busy==false?ThirdPageWidget():Center(child: CircularProgressIndicator(backgroundColor: Colors.white,)),
                      
                      Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            height: 50,
                            width: 140,
                            child: RaisedButton(
                              splashColor: Colors.blue,
                              elevation: 5.0,
                              color: kBlackAccent,
                              child: Text(
                                'Candidate List',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                model.navigateToFourthPage();
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
