import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GambarWidget extends StatefulWidget {
  const GambarWidget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _GambarWidgetState createState() => _GambarWidgetState();
}

class _GambarWidgetState extends State<GambarWidget> {
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
                    'Terjemahkan Kalimat Dibawah ini!!',
                    textAlign: TextAlign.start,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 10, 10),
                              child: Image.asset(
                                'assets/images/hot-pot.png',
                                width: 120,
                                height: 120,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              width: 200,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Color(0xBC37B4DA),
                                  width: 3,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Color(0xBC37DAC7),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            7, 7, 7, 7),
                                        child: Container(
                                          width: 100,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: Image.asset(
                                                'assets/images/loud-speaker.png',
                                              ).image,
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: Text(
                                      'Hewan',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                          child: Column(
                            children: [
                              Divider(
                                height: 30,
                                thickness: 3,
                                color: Colors.black,
                              ),
                              Divider(
                                height: 30,
                                thickness: 3,
                                color: Colors.black,
                              ),
                              Divider(
                                height: 30,
                                thickness: 3,
                                color: Colors.black,
                              ),
                              Divider(
                                height: 30,
                                thickness: 3,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Stack(
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(50, 5, 0, 5),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 200,
                                        height: 55,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 0),
                                        child: TextButton(
                                          style: TextButton.styleFrom(
                                            backgroundColor: Color.fromARGB(
                                                255, 27, 40, 155),
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
                                        width: 200,
                                        height: 55,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 0, 0),
                                        child: TextButton(
                                          style: TextButton.styleFrom(
                                            backgroundColor: Color.fromARGB(
                                                255, 27, 40, 155),
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
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 200,
                                        height: 55,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 0),
                                        child: TextButton(
                                          style: TextButton.styleFrom(
                                            backgroundColor: Color.fromARGB(
                                                255, 27, 40, 155),
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
                                        width: 200,
                                        height: 55,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 0, 0),
                                        child: TextButton(
                                          style: TextButton.styleFrom(
                                            backgroundColor: Color.fromARGB(
                                                255, 27, 40, 155),
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
