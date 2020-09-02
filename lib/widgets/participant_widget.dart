import 'package:Scaleindia/List/participant_list.dart';
import 'package:flutter/material.dart';

class ParticipantWidget extends StatelessWidget {
  final ParticiPant participant;
  ParticipantWidget({this.participant,});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text( participant.id,
         style: TextStyle(
         color: Colors.white,
        fontWeight: FontWeight.normal,
       fontSize: 15.0,
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
                              onPressed: () {},
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                side: BorderSide(color: Colors.blueAccent),
                              ),
                            ),
                          )
      ],
    );
  }
}
