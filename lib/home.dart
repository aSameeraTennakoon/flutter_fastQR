import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_mobile_vision/qr_camera.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:achievement_view/achievement_view.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String qr;
  bool camState = false;


  void showAchievementView(BuildContext context){
    AchievementView(
        context,
        title: "Done!",
        subTitle: "Content copied to clipboard",
        //onTab: _onTabAchievement,
        icon: Icon(Icons.done, color: Colors.white),
        //typeAnimationContent: AnimationTypeAchievement.fadeSlideToUp,
        //borderRadius: 5.0,
        color: Colors.green,
        //textStyleTitle: TextStyle(),
        //textStyleSubTitle: TextStyle(),
        alignment: Alignment.topCenter,
        duration: Duration(seconds: 2),
        isCircle: false,
        listener: (status){
          print(status);
          //AchievementState.opening
          //AchievementState.open
          //AchievementState.closing
          //AchievementState.closed
        }
    )..show();
  }

  _onAlertButtonsPressed() {
    Alert(
      context: context,
      type: AlertType.warning,
      title: "RESULT",
      desc: "$qr",
      buttons: [
        DialogButton(
          child: Text(
            "Copy",
            style: TextStyle(
              fontFamily: 'Comfortaa',
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
            Clipboard.setData(ClipboardData(text: qr));
            showAchievementView(context);
          },
          color: Colors.green,
        ),
        DialogButton(
          child: Text(
            "OK",
            style:TextStyle(
              fontFamily: 'Comfortaa',
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
          onPressed: () => Navigator.pop(context),
          color: Colors.green,
        )
      ],
    ).show();
  }

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
//      appBar: AppBar(
//        title: Text(''),
//      ),
      body:  Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            camState
                ?  Expanded(
              child: Center(
                child: Container(
                  child: QrCamera(
                    onError: (context, error) => Text(
                      error.toString(),
                      style: TextStyle(color: Colors.red),
                    ),
                    qrCodeCallback: (code) {
                      setState(() {
                        qr = code;
                        camState = !camState;
                        _onAlertButtonsPressed();
                      });
                    },
                    child: new Container(
                      decoration: new BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: Colors.transparent, width: 10.0, style: BorderStyle.solid),
                      ),
                    ),
//                   child: Card(
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(20))
//                     ),
//                   ),
                  ),
                ),
              ),
            )
                : Center(child: Text("Press the Scan button to"
                "\n read the QR code",
              style: TextStyle(
                fontFamily: 'Comfortaa',
                fontSize: 30.0,
                color: Colors.white,
              ),textAlign: TextAlign.center,)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.green,
          label:
          !camState
              ?Text(
            "Scan",
            textAlign: TextAlign.center,
          )
              : Text(
            "Cancel",
            textAlign: TextAlign.center,
          ),
          onPressed: () {
            setState(() {
              camState = !camState;
            });
          }),
    );
  }
}