import 'package:Scaleindia/List/participant_list.dart';
import 'package:Scaleindia/ViewModels/fourthpage_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ParticipantWidget extends StatelessWidget {
  final ParticiPant participant;
  ParticipantWidget({
    this.participant,
  });
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FourthPageViewModel>.reactive(
      viewModelBuilder: () => FourthPageViewModel(),
      builder: (context, model, child) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            participant.id,
            maxLines: 2,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.normal,
              fontSize: 16.0,
            ),
          ),
          Text(
            participant.name,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.normal,
              fontSize: 15.0,
            ),
          ),
          Container(
            height: 30,
            width: 80,
            child: RaisedButton(
              splashColor: Colors.blue,
              elevation: 3.0,
              color: new Color(0xffffffff),
              child: Text(
                'Start',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.blueAccent,
                ),
              ),
              onPressed: () {
                model.navigateToFifthPage();
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
                
              ),
            ),
          )
        ],
      ),
    );
  }
}
