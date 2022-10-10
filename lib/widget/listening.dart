// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListeningWidget extends StatefulWidget {
  const ListeningWidget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _ListeningWidgetState createState() => _ListeningWidgetState();
}

class _ListeningWidgetState extends State<ListeningWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 10, 0, 0),
                  child: Text(
                    'Pilih Jawaban Dengan benar!!',
                    textAlign: TextAlign.start,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                        child: Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                            color: Color(0xBC37DAC7),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 6,
                                color: Color(0x33000000),
                                offset: Offset(0, 2),
                              )
                            ],
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                            child: Image.asset(
                              'assets/images/loud-speaker.png',
                              width: 2,
                              height: 100,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      Stack(
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 30, 0, 5),
                            child: Container(
                              width: double.infinity,
                              height: 250,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    width: 350,
                                    height: 45,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor:
                                            Color.fromARGB(255, 27, 40, 155),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        "Hewan",
                                        style: TextStyle(
                                          color: Color(0xffffffff),
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 350,
                                    height: 45,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor:
                                            Color.fromARGB(255, 27, 40, 155),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        "Hewan",
                                        style: TextStyle(
                                          color: Color(0xffffffff),
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 350,
                                    height: 45,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor:
                                            Color.fromARGB(255, 27, 40, 155),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        "Hewan",
                                        style: TextStyle(
                                          color: Color(0xffffffff),
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 350,
                                    height: 45,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor:
                                            Color.fromARGB(255, 27, 40, 155),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        "Hewan",
                                        style: TextStyle(
                                          color: Color(0xffffffff),
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
