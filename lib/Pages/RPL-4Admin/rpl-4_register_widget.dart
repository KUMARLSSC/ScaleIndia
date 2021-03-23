import 'package:Scaleindia/Pages/RPL-4Admin/rpl_otp.dart';
import 'package:Scaleindia/widgets/busy_button.dart';
import 'package:Scaleindia/widgets/expansion_list.dart';
import 'package:Scaleindia/widgets/input_field.dart';
import 'package:flutter/material.dart';

class RPL4RegisterWidgetAdmin extends StatefulWidget {
  @override
  _RPL4RegisterWidgetAdminState createState() =>
      _RPL4RegisterWidgetAdminState();
}

class _RPL4RegisterWidgetAdminState extends State<RPL4RegisterWidgetAdmin> {
  final List<String> gender = ['Male', 'Female', 'Other'];
  final candidatenamecontroller = TextEditingController();
  final phoneNumberController = TextEditingController();
  final companynamecontroller = TextEditingController();
  final aadharNumberController = TextEditingController();
  Map<String, String> categoryJobrole = {
    "Drum Operator": "Finished Leather",
    "Buffing Operator": "Finished Leather",
    "Shaving Operator": "Finished Leather",
    "	Post Tanning Operator": "Finished Leather",
    "Splitting – Sammying Operator": "",
    "Fleshing Operator": "Finished Leather",
    "Helper – Dry Operation": "Finished Leather",
    "Helper – Wet Operations": "Finished Leather",
    "Helper – Finished Operations": "Finished Leather",
    "Scudder (Machine)": "Finished Leather",
    "Setting Operator": "Finished Leather",
    "Glazing Operator": "Finished Leather",
    "Finishing Operator": "Finished Leather",
    "Cutter": "Leather Goods & Garments",
    "Helper – Finishing Process": "Leather Goods & Garments",
    "Stitcher": "Leather Goods & Garments",
    "Helper – Parts Making": "Leather Goods & Garments",
    "Skiving Operator (Machine)": "Leather Goods & Garments",
    "Pattern Cutter": "Leather Goods & Garments",
    "Goods & Garments- Quality Control Inspector": "Leather Goods & Garments",
    "Sample Maker": "Leather Goods & Garments",
    "CAD CAM Operator- Goods": "Leather Goods & Garments",
    "CAD CAM Operator Garments": "Leather Goods & Garments",
    "Saddle- Maker": "Leather Goods & Garments",
    "Saddlery-Harness Maker": "Leather Goods & Garments",
    "Saddlery-Quality Control Inspector": "Leather Goods & Garments",
    "Sewing Machine Operator": "Leather Goods & Garments",
    "	Knitting Operator Footwear": "Non-Leather Footwear",
    "Cutter-F": "Footwear",
    "Operator – Moulding": "Footwear",
    "Operator – Lasting": "Footwear",
    "Operator – Skiving": "Footwear",
    "Operator – Pre Assembly": "Footwear",
    "Operator – Stitching": "Footwear",
    "Helper – Finishing": "Footwear",
    "Helper – Uppers Making": "Footwear",
    "Helper – Bottom Making": "Footwear",
    "Skiver(by hand)": "Footwear",
    "Laster (By Hand)": "Footwear",
    "Heel Attacher": "Footwear",
    "Finishing Operator-F": "Footwear",
    "Heel Builder": "Footwear",
    "Pattern Cutter-F": "Footwear",
    "Line Supervisor": "Footwear",
    "Quality Control Inspector": "Footwear",
    "Product Developer": "Footwear",
    "CAD CAM Operator": "Footwear",
    "Sample Maker-F": "Footwear",
    "Quality Control Supervisor": "Footwear",
    "Store In-charge": "Footwear",
    "Moulding Supervisor": "Footwear",
  };
  List<String> jobcategory = [
    "Finished Leather",
    "Leather Goods & Garments",
    "Footwear",
    "Non-Leather Footwear",
  ];
  List<String> jobRole = [];
  String selectedCategory;
  String selectedJobRole;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: 500,
        height: MediaQuery.of(context).size.height - 275,
        child: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    "Enter Admin Name:",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.grey[200]))),
                    child: InputField(
                      placeholder: 'Admin Name',
                      controller: candidatenamecontroller,
                      text1InputType: TextInputType.text,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    "Enter your phone number:",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.grey[200]))),
                    child: InputField(
                      placeholder: 'Phone number',
                      controller: phoneNumberController,
                      text1InputType: TextInputType.phone,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    "Gender:",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.grey[200]))),
                    child: ExpansionList<String>(
                        items: gender, title: null, onItemSelected: null),
                  ),
                ],
              ),
            ),
            Container(
              height: 114,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    "Company Name",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.grey[200]))),
                    child: InputField(
                      placeholder: 'company name',
                      controller: companynamecontroller,
                      text1InputType: TextInputType.text,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Column(
              children: <Widget>[
                Text(
                  "Job Category:",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                ),
                Container(
                  width: 200,
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[200],
                      border: Border.all()),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      isExpanded: true,
                      onChanged: (value) {
                        setState(() {
                          selectedCategory = value;
                          selectedJobRole = null;
                          jobRole.clear();
                          categoryJobrole.forEach((k, v) {
                            print(k);
                            if (selectedCategory == v) {
                              jobRole.add(k);
                            }
                          });
                        });
                      },
                      value: selectedCategory,
                      hint: Center(
                        child: Text('Select a category'),
                      ),
                      items: jobcategory
                          .map((jobcategory) => DropdownMenuItem(
                                child: Text(jobcategory),
                                value: jobcategory,
                              ))
                          .toList(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 1,
            ),
            Column(
              children: <Widget>[
                Text(
                  "Job Role:",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                ),
                Container(
                  width: 200,
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[200],
                      border: Border.all()),
                  child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                    isExpanded: true,
                    onChanged: (value) {
                      setState(() {
                        selectedJobRole = value;
                      });
                      print(value);
                    },
                    value: selectedJobRole,
                    hint: Center(
                      child: Text('Select a Role'),
                    ),
                    items: selectedCategory != null
                        ? jobRole
                            .map((jobRole) => DropdownMenuItem(
                                  child: Text(jobRole),
                                  value: jobRole,
                                ))
                            .toList()
                        : [],
                  )),
                ),
              ],
            ),
            SizedBox(
              height: 1,
            ),
            Container(
              height: 114,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    "Enter Aadhar number:",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.grey[200]))),
                    child: InputField(
                      placeholder: 'Aadhar number',
                      controller: aadharNumberController,
                      text1InputType: TextInputType.number,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 18,
            ),
            BusyButton(
              title: 'Submit',
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        OTPScreenAdmin(phoneNumberController.text)));
              },
              color: Colors.blue,
            ),
          ],
        )),
      ),
    ]);
  }
}
