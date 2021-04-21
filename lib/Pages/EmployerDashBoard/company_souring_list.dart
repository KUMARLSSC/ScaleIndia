import 'package:Scaleindia/ApiModel/company_sourcing.dart';
import 'package:flutter/material.dart';

class CompanySourcingList extends StatelessWidget {
  final ComapanySourcing comapanySourcing;
  final Function onDeleteItem;
  final double height;
  final double width;
  const CompanySourcingList(
      {Key key,
      this.comapanySourcing,
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Text(
                      comapanySourcing.companyname,
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
                        Text(
                            'RequestDepartment:${comapanySourcing.requestDepartment}'),
                        Text('Function:${comapanySourcing.function}')
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('State:${comapanySourcing.state}'),
                        Text('City:${comapanySourcing.city}')
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
                              'Estimated : ${comapanySourcing.dateOfJoin}',
                              style: TextStyle(fontSize: 13),
                            ),
                            SizedBox(
                              height: 1.5,
                            ),
                            Text(
                              'Duration:${comapanySourcing.category}',
                              style: TextStyle(fontSize: 13),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Experience: ${comapanySourcing.experience}',
                              style: TextStyle(fontSize: 13),
                            ),
                            SizedBox(
                              height: 1.5,
                            ),
                            Text(
                              'No.of.Postion:${comapanySourcing.numberofposition}',
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
