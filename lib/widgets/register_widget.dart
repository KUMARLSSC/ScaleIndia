import 'package:Scaleindia/widgets/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'input_field.dart';

class RegisterWidget extends StatefulWidget {
  @override
  _RegisterWidgetState createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  String _selectedDate = 'Date of birth';
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final Map<int, dynamic> _answers = {};
  Future<void> _selectDate(BuildContext context) async {
    final DateTime d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1980),
      lastDate: DateTime.now(),
    );
    if (d != null)
      setState(() {
        _selectedDate = new DateFormat.yMMMMd("en_US").format(d);
      });
  }
  int _currentIndex = 0;
  setSelectedUser(int val) {
    setState(() {
      _currentIndex = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.grey[200]))),
                  child: InputField(
                    placeholder: 'Name',
                    controller: emailController,
                    text1InputType: TextInputType.text,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Gender",
            style: kTitleStyle,
          ),
          Card(
            margin: EdgeInsets.only(left: 90, right: 80, bottom: 20),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 1.0, bottom: 10.0, left: 1.0, right: 1.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new RadioListTile<int>(
                      title: Text(
                        "Male",
                        style: TextStyle(fontSize: 15),
                      ),
                      activeColor: Colors.green,
                      value: 0,
                      groupValue: _answers[_currentIndex],
                      onChanged: (val) {
                        setState(() {
                          _answers[_currentIndex] = 0;
                        });
                      },
                    ),
                    new RadioListTile<int>(
                      title: Text(
                        "Female",
                        style: TextStyle(fontSize: 15),
                      ),
                      activeColor: Colors.green,
                      value: 1,
                      groupValue:_answers[_currentIndex],
                      onChanged: (val) {
                        setState(() {
                          _answers[_currentIndex] = 1;
                        });
                      },
                    ),
                    new RadioListTile<int>(
                      title: Text(
                        "Other",
                        style: TextStyle(fontSize: 15),
                      ),
                      activeColor: Colors.green,
                      value: 2,
                      groupValue: _answers[_currentIndex],
                      onChanged: (val) {
                        setState(() {
                          _answers[_currentIndex]= 2;
                        });
                      },
                    ),
                  ]),
            ),
          ),
          Container(
            width: 180,
            height: 69,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.grey[200]))),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    InkWell(
                      child: Text(
                          _selectedDate,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Color(0xFF000000))
                      ),
                      onTap: (){
                        _selectDate(context);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.calendar_today),
                      tooltip: 'Tap to open date picker',
                      onPressed: () {
                        _selectDate(context);
                      },
                    ),
                  ],
                ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: 300,
            height: 86,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.grey[200]))),
                  child: InputField(
                    placeholder: 'Aadhar number',
                    controller: emailController,
                    text1InputType: TextInputType.number,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            width: 300,
            height: 86,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.grey[200]))),
                  child: InputField(
                    placeholder: 'Phone number',
                    controller: emailController,
                    text1InputType: TextInputType.phone,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            width: 300,
            height: 86,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.grey[200]))),
                  child: InputField(
                    placeholder: ' Alternate Phone number',
                    controller: emailController,
                    text1InputType: TextInputType.phone,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            width: 300,
            height: 86,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.grey[200]))),
                  child: InputField(
                    placeholder: 'Father name',
                    controller: emailController,
                    text1InputType: TextInputType.text,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            width: 300,
            height: 86,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.grey[200]))),
                  child: InputField(
                    placeholder: 'Mother name',
                    controller: emailController,
                    text1InputType: TextInputType.text,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            width: 300,
            height: 86,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.grey[200]))),
                  child: InputField(
                    placeholder: 'Address',
                    controller: emailController,
                    text1InputType: TextInputType.text,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            width: 300,
            height: 86,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.grey[200]))),
                  child: InputField(
                    placeholder: 'District',
                    controller: emailController,
                    text1InputType: TextInputType.text,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            width: 300,
            height: 86,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.grey[200]))),
                  child: InputField(
                    placeholder: 'State',
                    controller: emailController,
                    text1InputType: TextInputType.text,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            width: 300,
            height: 86,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.grey[200]))),
                  child: InputField(
                    placeholder: 'Pin code',
                    controller: emailController,
                    text1InputType: TextInputType.number,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            width: 300,
            height: 86,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.grey[200]))),
                  child: InputField(
                    placeholder: 'Educational Qualification',
                    controller: emailController,
                    text1InputType: TextInputType.text,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            width: 300,
            height: 86,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.grey[200]))),
                  child: InputField(
                    placeholder: '  Work Experiance',
                    controller: emailController,
                    text1InputType: TextInputType.number,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            width: 300,
            height: 86,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.grey[200]))),
                  child: InputField(
                    placeholder: 'Last Company Worked for',
                    controller: emailController,
                    text1InputType: TextInputType.text,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            width: 300,
            height: 86,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.grey[200]))),
                  child: InputField(
                    placeholder: 'Last Working Designation',
                    controller: emailController,
                    text1InputType: TextInputType.text,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          RaisedButton(
            splashColor: Colors.blue,
            elevation: 5.0,
            color: Colors.black87,
            child: Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Upload Picture',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                  ),
                ),
                Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 24.0,
                ),
              ],
            ),
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          SizedBox(
            height: 8,
          ),
        ],
      )),
    );
  }
}
