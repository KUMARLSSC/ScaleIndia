import 'package:Scaleindia/ViewModels/splashpage_viewmodel.dart';
import 'package:Scaleindia/widgets/loader_animation.dart';
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
              Image.asset(
                "assets/img/logo.png",
                fit: BoxFit.fill,
                height: 100,
                width: 250,
              ),
              SizedBox(height: 30,),
              ColorLoader3(
                radius: 20.0,
                dotRadius: 10.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
