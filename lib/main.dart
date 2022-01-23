import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Quizbrain quizbrain = Quizbrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scorekeeper =[];
  void alerter(bool usranswer) {

      Alert(
        context: context,
        type: AlertType.error,
        title: "Out of questions",
        desc: "do you wish to reset the question list"
            ",Last questions answer was true",
        buttons: [
          DialogButton(
            child: Text(
              "yes",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              Navigator.pop(context);


            },
            width: 120,
          )
        ],
      ).show();


  }
  void answchk(bool useranswer){
    if(useranswer==quizbrain.getanswer())
      {
        scorekeeper.add(Icon(Icons.check, color: Colors.green, size: 25,),);
      }


    else {
      scorekeeper.add(Icon(Icons.close, color: Colors.red, size: 25, ),);
    }

    setState(() {
      quizbrain.questionchk();

    });
  }
  bool answusr;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(10, 150, 0, 0),
          alignment: Alignment.center,
          child: Text(
            quizbrain.getquestion(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        SizedBox(
          height: 120,
        ),
        TextButton(
          onPressed: () {
            answusr=true;
            answchk(answusr);
            if (quizbrain.quesno==12) {
              answchk(answusr);
              alerter(answusr);

              scorekeeper =[];
            }

            print(quizbrain.quesno);



          },
          child: Container(

            margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
            alignment: Alignment.center,
            padding: EdgeInsets.all(20),
            color: Colors.green,
            child: Center(
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        TextButton(
          onPressed: () {
            answusr=false;
            answchk(answusr);

            if (quizbrain.quesno==12) {
              answchk(answusr);
              alerter(answusr);
              scorekeeper =[];

            }



          },
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(20),
            color: Colors.red,
            child: Center(
              child: Text(
                'False',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),

        Row(
          children:
            scorekeeper,

        ),
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
