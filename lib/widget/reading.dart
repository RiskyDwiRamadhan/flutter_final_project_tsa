import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReadingWidget extends StatefulWidget {
  const ReadingWidget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _ReadingWidgetState createState() => _ReadingWidgetState();
}

class _ReadingWidgetState extends State<ReadingWidget> {
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
                  padding: EdgeInsetsDirectional.fromSTEB(15, 10, 0, 0),
                  child: Text(
                    'Pilih Gambar yang Benar!!',
                    textAlign: TextAlign.start,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.95, -0.89),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 5, 0, 20),
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xBC37DAC7),
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(7, 7, 7, 7),
                        child: Image.asset(
                          'assets/images/loud-speaker.png',
                          width: 2,
                          height: 100,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.57, -0.83),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 10),
                    child: Text(
                      'Hewan ',
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.9, 0),
                  child: Container(
                    width: double.infinity,
                    height: 400,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.9, -0.95),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: Container(
                              width: 150,
                              height: 170,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 6,
                                    color: Color(0x33000000),
                                    offset: Offset(0, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0, -0.8),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          9, 5, 9, 0),
                                      child: Container(
                                        width: 120,
                                        height: 120,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          image: DecorationImage(
                                            fit: BoxFit.contain,
                                            image: Image.asset(
                                              'assets/images/hot-pot.png',
                                            ).image,
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0, 1),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 0, 5, 10),
                                      child: Text(
                                        'Hello World',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-0.88, -0.95),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(5, 10, 0, 0),
                            child: Container(
                              width: 150,
                              height: 170,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 6,
                                    color: Color(0x33000000),
                                    offset: Offset(0, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0, -0.95),
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0, -0.8),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            9, 5, 9, 0),
                                        child: Container(
                                          width: 120,
                                          height: 120,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            image: DecorationImage(
                                              fit: BoxFit.contain,
                                              image: Image.asset(
                                                'assets/images/hot-pot.png',
                                              ).image,
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.05, 1),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5, 0, 5, 10),
                                        child: Text(
                                          'Hello World',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-0.88, 0.9),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 5),
                            child: Container(
                              width: 150,
                              height: 170,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 6,
                                    color: Color(0x33000000),
                                    offset: Offset(0, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0, -0.8),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          9, 5, 9, 0),
                                      child: Container(
                                        width: 120,
                                        height: 120,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          image: DecorationImage(
                                            fit: BoxFit.contain,
                                            image: Image.asset(
                                              'assets/images/hot-pot.png',
                                            ).image,
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.05, 1),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 0, 5, 10),
                                      child: Text(
                                        'Hello World',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.9, 0.9),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 5),
                            child: Container(
                              width: 150,
                              height: 170,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 6,
                                    color: Color(0x33000000),
                                    offset: Offset(0, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0, -0.8),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          9, 5, 9, 0),
                                      child: Container(
                                        width: 120,
                                        height: 120,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          image: DecorationImage(
                                            fit: BoxFit.contain,
                                            image: Image.asset(
                                              'assets/images/hot-pot.png',
                                            ).image,
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.05, 1),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 0, 5, 10),
                                      child: Text(
                                        'Hello World',
                                      ),
                                    ),
                                  ),
                                ],
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
          ),
        ),
      ),
    );
  }
}
