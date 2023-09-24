import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool checktick = true; // first player  mark is true;

  List<String> displaych = ["", "", "", "", "", "", "", "", ""];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: GridView.builder(
          itemCount: 9,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Tapped(index);
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[700]!),
                ),
                child: Center(
                    child: Text(
                  displaych[index],
                  style: TextStyle(color: Colors.white, fontSize: 40),
                )),
              ),
            );
          }),
    );
  }

  void Tapped(int index) {
    setState(() {
      if (checktick) {
        displaych[index] = '0';
        checktick = false;
        Checkwineer();
      } else {
        displaych[index] = 'X';
        checktick = true;
        Checkwineer();
      }
    });
  }

  void Checkwineer() {
    // first row
    if (displaych[0] == displaych[1] &&
        displaych[0] == displaych[2] &&
        displaych[0] != "") {
      showdialog(displaych[0]);
    }
    // second row
    if (displaych[3] == displaych[4] &&
        displaych[3] == displaych[5] &&
        displaych[3] != "") {
      showdialog(displaych[3]);
    } // 3rs row
    if (displaych[6] == displaych[7] &&
        displaych[6] == displaych[8] &&
        displaych[6] != "") {
      showdialog(displaych[6]);
    } // 1th coloum
    if (displaych[0] == displaych[3] &&
        displaych[0] == displaych[6] &&
        displaych[0] != "") {
      showdialog(displaych[0]);
    } // 2th col
    if (displaych[1] == displaych[4] &&
        displaych[1] == displaych[7] &&
        displaych[1] != "") {
      showdialog(displaych[1]);
    } // 3th  col
    if (displaych[2] == displaych[5] &&
        displaych[2] == displaych[8] &&
        displaych[2] != "") {
      showdialog(displaych[2]);
    } // 1st diagonal
    if (displaych[0] == displaych[4] &&
        displaych[0] == displaych[8] &&
        displaych[0] != "") {
      showdialog(displaych[0]);
    } // 2nd daigonal
    if (displaych[2] == displaych[4] &&
        displaych[2] == displaych[6] &&
        displaych[2] != "") {
      showdialog(displaych[2]);
    }
  }

  void showdialog( String winner) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(title: Text("Winner is: "+ winner));
        });
  }
}
