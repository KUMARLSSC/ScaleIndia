import 'package:Scaleindia/Pages/RPL-4Candidate/rpl-4_viewmodel.dart';
import 'package:Scaleindia/widgets/busy_button.dart';
import 'package:Scaleindia/widgets/expansion_list.dart';
import 'package:Scaleindia/widgets/video_widget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class FeedBackPage extends StatefulWidget {
  @override
  _FeedBackPageState createState() => _FeedBackPageState();
}

class _FeedBackPageState extends State<FeedBackPage> {
  final List<String> topic = ['topic 1', 'topic 2', 'topic 3', 'topic 4'];
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RPL4ViewModel>.reactive(
      viewModelBuilder: () => RPL4ViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            color: Colors.black,
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'FeedBack',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
            padding: EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Topics:",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.normal),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.grey[200]))),
                          child: ExpansionList<String>(
                              items: topic,
                              title: model.selectedTopic,
                              onItemSelected: model.setSelectedTopic),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    // When we tap we call selectImage
                    onTap: () {
                      model.selectVideo();
                    },
                    child: Container(
                      height: 250,
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10)),
                      alignment: Alignment.center,
                      // If the selected image is null we show "Tap to add post image"
                      child: model.selectedVideo == null
                          ? Text(
                              'Tap to Upload image',
                              style: TextStyle(color: Colors.grey[400]),
                            )
                          // If we have a selected image we want to show it
                          : VideoWidget(model.selectedVideo, model.busy),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  BusyButton(
                    busy: model.busy,
                    title: 'Submit',
                    onPressed: () {
                      model.addFeedBack(
                        topic: model.selectedTopic,
                      );
                    },
                    color: Colors.blueAccent,
                  )
                ],
              ),
            )),
      ),
    );
  }
}
