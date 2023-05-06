import 'package:flutter/material.dart';

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({Key? key}) : super(key: key);

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Task 2'),
          centerTitle: true,
        ),
        body: Container(
          child: Column(children: [
            Stack(children: [
              Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Card(
                      elevation: 40,
                      shadowColor: Colors.pinkAccent.shade700,
                      color: Colors.transparent,
                      child: Stack(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(130),
                                    bottomRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20)),
                                gradient: RadialGradient(
                                    radius: 2,
                                    center: Alignment(-1, -1),
                                    colors: [
                                      Color(0xffe67373),
                                      Color(0xffe58185),
                                      Color(0xfff5b29b)
                                    ])),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.7,
                              height: MediaQuery.of(context).size.height * 0.5,
                              child: Padding(
                                padding: EdgeInsets.only(left: 40),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 90,
                                    ),
                                    Text(
                                      'Breakfast',
                                      style: TextStyle(
                                          fontSize: 40,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 18,
                                    ),
                                    Text(
                                      'Bread,',
                                      style: TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      'Peanut Butter,',
                                      style: TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      'Apple',
                                      style: TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.baseline,
                                      textBaseline: TextBaseline.ideographic,
                                      children: [
                                        Text(
                                          '525',
                                          style: TextStyle(
                                            fontSize: 72,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'kcal',
                                          style: TextStyle(
                                            fontSize: 32,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  CircleAvatar(
                    backgroundColor: Color(0x306eadda),
                    backgroundImage: AssetImage('assets/breakfast.jpg'),
                    radius: 72,
                  ),
                ],
              ),
            ]),
          ]),
        ),
      ),
    );
  }
}
