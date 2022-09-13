import 'package:flutter/material.dart';
import 'package:flutter_quiz_show/consts.dart';
import 'package:flutter_quiz_show/quiz_bank.dart';

class QuizShow extends StatefulWidget {
  const QuizShow({Key? key}) : super(key: key);

  @override
  State<QuizShow> createState() => _BilgiTestiState();
}

Test test_1 = Test();

class _BilgiTestiState extends State<QuizShow> {
  List<Widget> secimler = [];
  void buttonFonksiyonu(bool secilerButton) {
    if (test_1.testBittiMi() == true) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Text("TEBRİKLER TESTİ BİTİRDİNİZ"),
              actions: <Widget>[
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      setState(() {
                        test_1.testiSifirla();
                        secimler = [];
                      });
                    },
                    child: new Text("Başa dön"))
              ],
            );
          });
    } else {
      setState(
        () {
          if (test_1.getSoruYaniti() == secilerButton) {
            secimler.add(dogruSecim);
          } else {
            secimler.add(yanlisSecim);
          }
          test_1.sonrakiSoru();
          //secimler.add(dogruSecim);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[700],
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        centerTitle: true,
        title: const Text(
          "Test",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Column(children: [
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Text(
                test_1.getSoruMetni(),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Wrap(
            runSpacing: 2,
            spacing: 3,
            children: secimler,
          ),
        ),
        Expanded(
            flex: 1,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.indigo[700]),
                            onPressed: () {
                              buttonFonksiyonu(true);
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(12),
                              child: Icon(Icons.thumb_up),
                            )),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.red),
                            onPressed: () {
                              buttonFonksiyonu(false);
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(12),
                              child: Icon(Icons.thumb_down),
                            )),
                      ),
                    ),
                  ],
                )))
      ]),
    );
  }
}
