import 'package:Scaleindia/ViewModels/firstpage_viewmodel.dart';
import 'package:Scaleindia/widgets/busy_button.dart';
import 'package:Scaleindia/widgets/input_field.dart';
import 'package:Scaleindia/widgets/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class FirstPage extends StatelessWidget {
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FirstPageViewModel>.reactive(
      viewModelBuilder: () => FirstPageViewModel(),
      builder: (context, model, child) => Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: ClipRRect(
                      child: Image.asset(
                        "assets/img/logo.png",
                        fit: BoxFit.fill,
                        height: 100,
                        width: 250,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Text(
                      "Welcomes You",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 23,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(1),
                  child: Column(
                    children: <Widget>[
                      Center(
                          child: Text(
                        "Request ID:",
                        style: kTitleStyle,
                      )),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: 200,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(32, 132, 232, .3),
                                  blurRadius: 20,
                                  offset: Offset(0, 10))
                            ]),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey[200]))),
                              child: InputField(
                                placeholder: 'Enter request id',
                                text1InputType: TextInputType.number,
                                controller: textController,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      BusyButton(
                        title: 'Start',
                        busy: model.busy,
                        color: Colors.green,
                        onPressed: () {
                          model.firstpage(requestidText: textController.text);
                        },
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      new Padding(padding: EdgeInsets.only(bottom: 20.0)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
