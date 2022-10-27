import 'package:flutter/material.dart';
import 'package:flutter_final_project_tsa/widget/kategori.dart';
import 'package:google_fonts/google_fonts.dart';

class ScoreWidget extends StatefulWidget {
  const ScoreWidget({Key? key, required this.score, required this.kategori})
      : super(key: key);
  final int score;
  final String kategori;

  @override
  _ScoreWidgetState createState() => _ScoreWidgetState();
}

class _ScoreWidgetState extends State<ScoreWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late int scores = widget.score;
  late String kategori = widget.kategori;

  Widget _starWidget() {
    return Image.asset(
      'assets/images/star.png',
      width: 55,
      height: 55,
      fit: BoxFit.cover,
    );
  }

  Widget _starlineWidget() {
    return Image.asset(
      'assets/images/starline.png',
      width: 55,
      height: 55,
      fit: BoxFit.cover,
    );
  }

  _star() {
    if (widget.score == 20) {
      return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _starWidget(),
          _starlineWidget(),
          _starlineWidget(),
          _starlineWidget(),
          _starlineWidget(),
        ],
      );
    } else if (widget.score == 40) {
      return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _starWidget(),
          _starWidget(),
          _starlineWidget(),
          _starlineWidget(),
          _starlineWidget(),
        ],
      );
    } else if (widget.score == 60) {
      return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _starWidget(),
          _starWidget(),
          _starWidget(),
          _starlineWidget(),
          _starlineWidget(),
        ],
      );
    } else if (widget.score == 80) {
      return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _starWidget(),
          _starWidget(),
          _starWidget(),
          _starWidget(),
          _starlineWidget(),
        ],
      );
    } else if (widget.score == 100) {
      return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _starWidget(),
          _starWidget(),
          _starWidget(),
          _starWidget(),
          _starWidget(),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Page Title',
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.1,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x33000000),
                          offset: Offset(0, 2),
                        )
                      ],
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Color(0xFF0F2C67),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Text(
                            "$kategori",
                            style: TextStyle(
                              fontFamily: 'PT Sans',
                              color: Colors.black,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Container(
                            width: 140,
                            height: 140,
                            decoration: BoxDecoration(
                              color: Color(0xD237B4DA),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 6,
                                  color: Color(0x33000000),
                                  offset: Offset(0, 2),
                                  spreadRadius: 3,
                                )
                              ],
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  19, 19, 19, 19),
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                    fit: BoxFit.fitWidth,
                                    image: Image.asset(
                                      'assets/images/logo.png',
                                    ).image,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 6,
                                      color: Color(0x33000000),
                                      offset: Offset(0, 2),
                                      spreadRadius: 3,
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Text(
                            "$scores",
                            style: TextStyle(
                              fontFamily: 'Source Sans Pro',
                              color: Colors.black,
                              fontSize: 70,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 10, 20, 20),
                          child: _star(),
                        ),
                        Container(
                          width: double.infinity,
                          height: 80,
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 10, 20, 20),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 27, 40, 155),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        HomePageWidget(title: "Kategori"),
                                  ),
                                );
                              },
                              child: Text(
                                'HOME',
                                style: TextStyle(
                                  color: Color(0xffffffff),
                                  fontFamily: 'Montserrat',
                                  fontSize: 20,
                                ),
                              ),
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
    );
  }
}
