import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KosakataWidget extends StatefulWidget {
  const KosakataWidget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _KosakataWidgetState createState() => _KosakataWidgetState();
}

class _KosakataWidgetState extends State<KosakataWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Widget KataWidget() {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
      child: Container(
        width: 107,
        height: 14,
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
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(9, 5, 9, 0),
              child: Container(
                width: 90,
                height: 90,
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
            Text(
              'Soup',
            ),
          ],
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
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: GridView(
            padding: EdgeInsets.zero,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 0,
              childAspectRatio: 1,
            ),
            scrollDirection: Axis.vertical,
            children: [
              KataWidget(),
              KataWidget(),
              KataWidget(),
              KataWidget(),
              KataWidget(),
              KataWidget(),
              KataWidget(),
              KataWidget(),
              KataWidget(),
              KataWidget(),
              KataWidget(),
              KataWidget(),
              KataWidget(),
              KataWidget(),
              KataWidget(),
              KataWidget(),
              KataWidget(),
              KataWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
