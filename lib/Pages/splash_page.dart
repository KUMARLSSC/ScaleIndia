import 'package:Scaleindia/ViewModels/splashpage_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashPageViewModel>.reactive(
      viewModelBuilder: () => SplashPageViewModel(),
      onModelReady: (model) => model.handleStartUpLogic(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              FlutterLogo(
                size: 150.0,
              ),
              CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation(
                  Color(0xff19c7c1),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}