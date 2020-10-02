import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';


class ConnectionCheck extends StatelessWidget {
  final Widget child;
  const ConnectionCheck({this.child});
  @override
  Widget build(BuildContext context) {
    return Builder(
            builder: (BuildContext context) {
              return 
              OfflineBuilder(
                connectivityBuilder: (BuildContext context,
                    ConnectivityResult connectivity, Widget child) {
                  final bool connected =
                      connectivity != ConnectivityResult.none;
                  return Stack(
                    fit: StackFit.expand,
                    children: [
                      child,
                      Positioned(
                        left: 40.0,
                        right: 40.0,
                        height: 320.0,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          color: connected ? null : Color(0xFFEE4400),
                          child: connected ? null: 
                          Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Please check your internet connection",
                                      style: TextStyle(color: Colors.white,fontSize: 15),
                                    ),
                                    SizedBox(
                                     height: 20.0,
                                    ),
                                    SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 8.0,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                        ),
                      ),
                    ],
                  );
                },    
                child: child,         
              );
            },
    );
  }
}