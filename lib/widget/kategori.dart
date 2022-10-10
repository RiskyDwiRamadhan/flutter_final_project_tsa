import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'reading.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Widget _KategoriWidget() {
    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
        child: Container(
          width: 330,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 6,
                color: Color.fromARGB(144, 56, 56, 56),
                // color: Color(0x9037DAC7),
                offset: Offset(0, 2),
                spreadRadius: 1,
              )
            ],
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 5, 5, 5),
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(251, 9, 166, 187),
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
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Food',
                    textAlign: TextAlign.start,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Score : ',
                      ),
                      Text(
                        '10',
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: GestureDetector(
            onTap: () => Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (_) {
              return ReadingWidget(
                title: 'Reading',
              );
            })),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                _KategoriWidget(),
                _KategoriWidget(),
                _KategoriWidget(),
                _KategoriWidget(),
                _KategoriWidget(),
                _KategoriWidget(),
                _KategoriWidget(),
                _KategoriWidget(),
                _KategoriWidget(),
                _KategoriWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
