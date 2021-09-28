import 'package:flutter/material.dart';
import 'package:questions_reponses/model/question.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Question> questions = [
    new Question("Ceci est une question ? ", false),
    new Question("Ceci est une  ? ", false),
    new Question("Ceci  une question ? ", false),
    new Question(" est une question ? ", false),
    new Question("Ceci est  question ? ", false)
  ];
  late Question question;

  var nbgoodanswer = 0;
  var nbquestion = 0;

  _HomePageState() {
    question = questions[nbquestion];
  }

  _checkanswer(bool answer, BuildContext context) {
    var flag = (answer == questions[nbquestion].correctAnswer);
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
      content: Text(
          flag ? "Vous avez trouvé une bonne réponse!" : "C'est dommage ..."),
    ));
    _changeQuestion(flag);
  }

  _changeQuestion(bool flagreceived) {
    setState(() {
      if (flagreceived) {
        nbgoodanswer += 1;
        nbquestion += 1;
        question = questions[nbquestion];
      } else {
        nbquestion += 1;
        question = questions[nbquestion];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Questions / Réponses"),
      ),
      backgroundColor: Colors.blueGrey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
              color: Colors.black,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Text(question.question),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * 0.2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => {_checkanswer(true, context)},
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.1)),
                  ),
                  child: Text("Vrai"),
                ),
                ElevatedButton(
                  onPressed: () => {_checkanswer(false, context)},
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.1)),
                  ),
                  child: Text("Faux"),
                ),
                ElevatedButton(
                  onPressed: () => {},
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.1)),
                  ),
                  child: Icon(Icons.arrow_forward),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
