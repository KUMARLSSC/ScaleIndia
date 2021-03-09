import 'package:Scaleindia/ApiModel/employee_candidate_sourcing.dart';
import 'package:Scaleindia/widgets/loader_animation.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class EcasCandidateList extends StatelessWidget {
  final EmployeeCandidateSourcing employeeCandidateSourcing;
  final Function onDeleteItem;
  final double height;
  final double width;
  const EcasCandidateList(
      {Key key,
      this.employeeCandidateSourcing,
      this.onDeleteItem,
      this.height,
      this.width})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15),
        elevation: 8,
        child: Container(
          width: width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              employeeCandidateSourcing.imageUrl != null
                  ? Container(
                      height: height * 0.2,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                              employeeCandidateSourcing.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : Center(
                      child: ColorLoader3(
                        radius: 20.0,
                        dotRadius: 10.0,
                      ),
                    ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Text(
                      employeeCandidateSourcing.name,
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 19,
                      ),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Phone:${employeeCandidateSourcing.phoneNumber}'),
                        Text('Email:${employeeCandidateSourcing.state}')
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('State:${employeeCandidateSourcing.state}'),
                        Text('City:${employeeCandidateSourcing.city}')
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Date of birth : ${employeeCandidateSourcing.dateOfBirth}',
                              style: TextStyle(fontSize: 13),
                            ),
                            SizedBox(
                              height: 1.5,
                            ),
                            Text(
                              'Aadhar:${employeeCandidateSourcing.aadharNumber}',
                              style: TextStyle(fontSize: 13),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Qualification: ${employeeCandidateSourcing.educationalQualification}',
                              style: TextStyle(fontSize: 13),
                            ),
                            SizedBox(
                              height: 1.5,
                            ),
                            Text(
                              'workExperiance:${employeeCandidateSourcing.workExperiance}',
                              style: TextStyle(fontSize: 13),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
