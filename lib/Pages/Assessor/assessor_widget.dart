import 'package:Scaleindia/shared/shared_styles.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geocoder/model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:stacked/stacked.dart';

import 'assessor_viewmodel.dart';

class AssessorWidget extends StatefulWidget {
  @override
  _AssessorWidgetState createState() => _AssessorWidgetState();
}

class _AssessorWidgetState extends State<AssessorWidget> {
  /* final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();*/
  String lati = "";
  String longi = "";
  String currentlocation = "";
  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  getCurrentLocation() async {
    final geoposition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    final coordinates =
        new Coordinates(geoposition.latitude, geoposition.longitude);
    var address =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    setState(() {
      lati = address.first.postalCode;

      currentlocation = lati;
    });
    print(lati + longi);
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AssessorPageViewModel>.reactive(
      viewModelBuilder: () => AssessorPageViewModel(),
      builder: (context, model, child) => Container(
        width: 280.0,
        margin: EdgeInsets.only(right: 15.0),
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: kBlack,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  "Batch ID: 1",
                  style: kTitleStyle.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Text(
                  "Date : 11-01-2021",
                  style: kTitleStyle.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 15.0),
            Center(
              child: Text(
                "Status: Not Activated",
                style: kTitleStyle.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 15.0),
            Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Time:10 am to 1 pm",
                      style: kSubtitleStyle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: "  •  ",
                      style: kSubtitleStyle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: "Chennai",
                      style: kSubtitleStyle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15.0),
            Center(
                // ignore: deprecated_member_use
                child: RaisedButton(
              splashColor: Colors.blue,
              elevation: 10.0,
              color: currentlocation == "600095" ? Colors.green : Colors.grey,
              child: Text(
                'Start',
                style: TextStyle(fontSize: 15.0, color: Colors.white),
              ),
              onPressed: () {
                if (currentlocation == "600095") {
                  model.navigateToSop();
                } else {}
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ))
          ],
        ),
      ),
    );
  }

  /* Future<Null> _refresh() async {
    //Holding pull to refresh loader widget for 2 sec.
    //You can fetch data from server.
    await new Future.delayed(const Duration(seconds: 2));
    setState(() => getCurrentLocation());
    return null;
  }*/
}
