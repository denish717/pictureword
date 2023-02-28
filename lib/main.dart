import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List image = [
    "animals1.jpg",
    "animals2.jpg",
    "animals3.jpg",
    "animals4.jpg",
    "animals5.jpg",
    "animals6.jpg",
    "animals7.jpg",
    "animals8.jpg",
    "animals9.jpg",
    "animals10.jpg",
  ];
  List image1 = [
    "girly1.jpg",
    "girly2.jpg",
    "girly3.jpg",
    "girly4.jpg",
    "girly5.jpg",
    "girly6.jpg",
    "girly7.jpg",
    "girly8.jpg",
    "girly9.jpg",
    "girly10.jpg",
  ];
  int i = 0;
  int price = 200;
  int coin = 100;
  String ans = "";
  TextEditingController a = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Pictures words",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                      backgroundImage: AssetImage("img/coin.png.png"),
                      radius: 25),
                  Container(
                    margin: EdgeInsets.all(5),
                    alignment: Alignment.center,
                    height: 100,
                    width: 45,
                    child: Text("${price}", style: TextStyle(fontSize: 25)),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: Container(
                      margin: EdgeInsets.all(5),
                      height: 150,
                      width: 140,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("img/${image[i]}"))),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    height: 150,
                    width: 70,
                    child: Icon(Icons.add, color: Colors.black, size: 40),
                  ),
                  Container(
                      margin: EdgeInsets.all(5),
                      height: 150,
                      width: 140,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("img/${image1[i]}")))),
                ],
              ),
              Row(
                children: [
                  Container(
                    height: 50,
                  )
                ],
              ),
              TextField(
                controller: a,
                cursorColor: Colors.amber,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "ENTER YOUR ANSWER",
                  border: OutlineInputBorder(),
                ),
              ),
              TextButton(
                  onPressed: () {
                    setState(() {
                      answer();
                      if (a.text == ans) {
                        i++;
                        price = price + 100;
                        if (i == 11) {
                          i = 0;
                        }
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("ENTER VALID ANS"),
                            );
                          },
                        );
                      }
                    });
                  },
                  child: Text("SUBMIT")),
              Row(
                children: [
                  Container(
                    height: 70,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 80,
                    width: 100,
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            i--;
                            if (i == -1) {
                              i = 0;
                            }
                          });
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 70,
                        )),
                  ),
                  Container(
                    height: 80,
                    width: 100,
                    child: IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("you have pay 50 coins for hint"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("CANCEL")),
                                  TextButton(
                                      onPressed: () {
                                        setState(() {
                                          price = price - 50;
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Text(
                                                    "this is the animal whos colore is black"),
                                              );
                                            },
                                          );
                                        });
                                      },
                                      child: Text("OK")),
                                ],
                              );
                            },
                          );
                        },
                        icon: Icon(
                          Icons.lightbulb_rounded,
                          size: 70,
                        )),
                  ),
                  Container(
                    height: 80,
                    width: 100,
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            price = price - 100;
                            if (price == 0) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("YOU HAVE NOT VALID MONEY"),
                                  );
                                },
                              );
                            }
                            i++;
                          });
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          size: 70,
                        )),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 80,
                    width: 100,
                    child: Text(
                      "  BACK",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  Container(
                    height: 80,
                    width: 100,
                    child: Text(
                      "   HINT",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  Container(
                    height: 80,
                    width: 100,
                    child: Text(
                      " SKIP",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  answer() {
    if (i == 0) {
      ans = "lion";
    }
    if (i == 1) {
      ans = "money";
    }
    if (i == 2) {
      ans = "egle";
    }
    if (i == 3) {
      ans = "book";
    }
    if (i == 4) {
      ans = "mobile";
    }
    if (i == 5) {
      ans = "beer";
    }
    if (i == 6) {
      ans = "monkey";
    }
    if (i == 7) {
      ans = "taddy";
    }
    if (i == 8) {
      ans = "alephat";
    }
    if (i == 9) {
      ans = "dish";
    }
  }
}
