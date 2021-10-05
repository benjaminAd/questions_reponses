import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:questions_reponses/model/question.dart';
import 'package:questions_reponses/provider/question_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /*final List<Question> questions = [
    new Question("Paris est-elle la capitale de la France ?",
        "images/tour-eiffel-paris.jpg", true),
    new Question(
        "Le zèbre possède-t-il des rayures ?",
        "images/cover-r4x3w1000-57e155592330a-pourquoi-le-zebre-est-il-raye.jpg",
        true),
    new Question("Le buffle est-il carnivore ? ",
        "images/b11b597d02_50036097_800px-serengeti-bueffel1.jpg", false),
    new Question("La France est-elle un pays Américain ? ",
        "images/frenchflag.jpg", false),
    new Question("Le développeur s'appelle Benjamin ADOLPHE ",
        "images/1000emote1.png", true)
  ];
  late Question question;

  var nbgoodanswer = 0;
  var nbquestion = 0;

  _HomePageState() {
    question = questions[nbquestion];
  }

  _checkanswer(bool answer, BuildContext context) {
    if (nbquestion < questions.length) {
      var flag = (answer == questions[nbquestion].correctAnswer);
      ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
          content: Text(flag
              ? "Vous avez trouvé une bonne réponse!"
              : "C'est dommage ..."),
          duration: Duration(milliseconds: 500)));
      _changeQuestion(flag);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
          content:
              Text('Vous avez terminé le jeu avec un score de $nbgoodanswer!'),
          duration: Duration(milliseconds: 500)));
    }
  }

  _changeQuestion(bool flagreceived) {
    setState(() {
      if (flagreceived) {
        nbgoodanswer += 1;
        nbquestion += 1;
        if (nbquestion < questions.length) {
          question = questions[nbquestion];
        } else {
          ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
              content: Text(
                  'Vous avez terminé le jeu avec un score de $nbgoodanswer!'),
              duration: Duration(milliseconds: 500)));
        }
      } else {
        nbquestion += 1;
        if (nbquestion < questions.length) {
          question = questions[nbquestion];
        } else {
          ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
            content: Text(
                'Vous avez terminé le jeu avec un score de $nbgoodanswer!'),
            duration: Duration(milliseconds: 500),
          ));
        }
      }
    });
  }

  _resetall() {
    setState(() {
      nbquestion = 0;
      nbgoodanswer = 0;
      question = questions[nbquestion];
    });
  }*/

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
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.2,
            //child: Image.asset(question.path),
            child: Consumer<QuestionProvider>(
              builder: (context, question, child) {
                return (question.nbquestion >= question.questions.length)
                    ? Image.asset(question.questions.last.path)
                    : Image.asset(question.questions[question.nbquestion].path);
              },
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            child: Center(
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                //child: Text(question.question),
                child: Consumer<QuestionProvider>(
                  builder: (context, question, child) {
                    return (question.nbquestion >= question.questions.length)
                        ? Text(question.questions.last.question)
                        : Text(
                            question.questions[question.nbquestion].question);
                  },
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * 0.2,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Consumer<QuestionProvider>(
                      builder: (context, question, child) {
                        return ElevatedButton(
                          onPressed: () =>
                              {question.checkAnswer(true, context)},
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.1)),
                          ),
                          child: Text("Vrai"),
                        );
                      },
                    ),
                    /*ElevatedButton(
                      onPressed: () => {_checkanswer(true, context)},
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.1)),
                      ),
                      child: Text("Vrai"),
                    ),*/
                    Consumer<QuestionProvider>(
                      builder: (context, question, child) {
                        return ElevatedButton(
                          onPressed: () =>
                              {question.checkAnswer(false, context)},
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.1)),
                          ),
                          child: Text("Faux"),
                        );
                      },
                    ),
                    /*ElevatedButton(
                      onPressed: () => {_checkanswer(false, context)},
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.1)),
                      ),
                      child: Text("Faux"),
                    ),*/
                    Consumer<QuestionProvider>(
                      builder: (context, question, child) {
                        return ElevatedButton(
                          onPressed: () => {
                            (question.nbquestion >= question.questions.length)
                                ? question.resetall()
                                : question.changeQuestion(false, context)
                          },
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.1)),
                          ),
                          child:
                              (question.nbquestion >= question.questions.length)
                                  ? Icon(Icons.restart_alt)
                                  : Icon(Icons.arrow_forward),
                        );
                      },
                    ),
                    /*ElevatedButton(
                      onPressed: () => {
                        (nbquestion >= questions.length)
                            ? _resetall()
                            : _changeQuestion(false)
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.1)),
                      ),
                      child: (nbquestion >= questions.length)
                          ? Icon(Icons.restart_alt)
                          : Icon(Icons.arrow_forward),
                    ),*/
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                //Text('$nbgoodanswer / ${questions.length}'),
                Consumer<QuestionProvider>(
                  builder: (context, question, child) {
                    return Text(
                        '${question.nbgoodanswer} / ${question.questions.length}');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
