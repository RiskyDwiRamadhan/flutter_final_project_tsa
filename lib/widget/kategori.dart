import 'package:flutter/material.dart';
import 'package:flutter_final_project_tsa/model/kata.dart';
import 'package:flutter_final_project_tsa/network/network_request.dart';
import 'package:flutter_final_project_tsa/widget/error.dart';
import 'package:flutter_final_project_tsa/widget/gambar.dart';
import 'package:flutter_final_project_tsa/widget/kosakata.dart';
import 'package:flutter_final_project_tsa/widget/listening.dart';
import 'package:flutter_final_project_tsa/widget/test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'reading.dart';
import 'dart:io';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late bool processing;

  @override
  void initState() {
    super.initState();
    processing = false;
  }

  Future<void> openDialog(String kategori) async {
    List<Kata> katas = await NetworkRequest.fetchKatas(kategori);
    switch (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text('Menu'),
            children: [
              processing
                  ? const CircularProgressIndicator()
                  : SimpleDialogOption(
                      child: Text("Vacabulari"),
                      onPressed: () {
                        Navigator.pop(context, "Vacabulari");
                      },
                    ),
              processing
                  ? const CircularProgressIndicator()
                  : SimpleDialogOption(
                      child: Text("Listening"),
                      onPressed: () {
                        Navigator.pop(context, "Listening");
                      },
                    ),
              processing
                  ? const CircularProgressIndicator()
                  : SimpleDialogOption(
                      child: Text("Reading"),
                      onPressed: () {
                        Navigator.pop(context, "Reading");
                      },
                    ),
              processing
                  ? const CircularProgressIndicator()
                  : SimpleDialogOption(
                      child: Text("Image"),
                      onPressed: () {
                        Navigator.pop(context, "Image");
                      },
                    ),
            ],
          );
        })) {
      case "Vacabulari":
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
          return KosaKataWidget(kategori: kategori);
        }));
        break;
      case "Listening":
        _startQuizListening(kategori);
        break;
      case "Reading":
        _startQuizReading(kategori);
        break;
      case "Image":
        _startQuizImage(kategori);
        break;
    }
  }

  Widget _KategoriWidget(String kategori, String gambar) {
    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: GestureDetector(
        onTap: () {
          openDialog(kategori);
        },
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
                      padding: EdgeInsetsDirectional.all(10),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(251, 9, 166, 187),
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: Image.asset(
                            'assets/images/$gambar.png',
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
                      kategori,
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
      ),
    );
  }

  void _startQuizReading(String kategori) async {
    setState(() {
      processing = true;
    });
    try {
      List<Kata> questions = await NetworkRequest.fetchKatas(kategori);
      await Future.delayed(
        const Duration(seconds: 1),
      );
      if (!mounted) return;
      Navigator.pop(context);
      if (questions.isEmpty) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => const ErrorPage(
              message:
                  "There are not enough questions in the category, with the options you selected.",
              key: null,
            ),
          ),
        );
        return;
      }
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) =>
              ReadingWidget(question: questions, nKuis: 0, score: 0),
        ),
      );
    } on SocketException catch (_) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const ErrorPage(
            message:
                "Can't reach the servers, \n Please check your internet connection.",
          ),
        ),
      );
    } catch (e) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) {
            return const ErrorPage(
              message: "Unexpected error trying to connect to the API",
            );
          },
        ),
      );
    }
    setState(() {
      processing = false;
    });
  }

  void _startQuizListening(String kategori) async {
    setState(() {
      processing = true;
    });
    try {
      List<Kata> questions = await NetworkRequest.fetchKatas(kategori);
      await Future.delayed(
        const Duration(seconds: 1),
      );
      if (!mounted) return;
      Navigator.pop(context);
      if (questions.isEmpty) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => const ErrorPage(
              message:
                  "There are not enough questions in the category, with the options you selected.",
              key: null,
            ),
          ),
        );
        return;
      }
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) =>
              ListeningWidget(question: questions, nKuis: 0, score: 0),
        ),
      );
    } on SocketException catch (_) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const ErrorPage(
            message:
                "Can't reach the servers, \n Please check your internet connection.",
          ),
        ),
      );
    } catch (e) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) {
            return const ErrorPage(
              message: "Unexpected error trying to connect to the API",
            );
          },
        ),
      );
    }
    setState(() {
      processing = false;
    });
  }

  void _startQuizImage(String kategori) async {
    setState(() {
      processing = true;
    });
    try {
      List<Kata> questions = await NetworkRequest.fetchKatas(kategori);
      await Future.delayed(
        const Duration(seconds: 1),
      );
      if (!mounted) return;
      Navigator.pop(context);
      if (questions.isEmpty) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => const ErrorPage(
              message:
                  "There are not enough questions in the category, with the options you selected.",
              key: null,
            ),
          ),
        );
        return;
      }
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => GambarWidget(question: questions, nKuis: 0, score: 0),
        ),
      );
    } on SocketException catch (_) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const ErrorPage(
            message:
                "Can't reach the servers, \n Please check your internet connection.",
          ),
        ),
      );
    } catch (e) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) {
            return const ErrorPage(
              message: "Unexpected error trying to connect to the API",
            );
          },
        ),
      );
    }
    setState(() {
      processing = false;
    });
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: const Text(
              "Are you sure you want to quit the app?",
            ),
            title: const Text("Warning!"),
            actions: <Widget>[
              ElevatedButton(
                child: const Text("Yes"),
                onPressed: () {
                  Navigator.pop(context, true);
                },
              ),
              ElevatedButton(
                child: const Text("No"),
                onPressed: () {
                  Navigator.pop(context, false);
                },
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
            title: Text(widget.title),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () => _onWillPop,
            )),
        body: SafeArea(
          child: SingleChildScrollView(
            child: GestureDetector(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  _KategoriWidget("Animal", "owl"),
                  _KategoriWidget("Fruit", "fruit"),
                  _KategoriWidget("Food", "hot-pot"),
                  _KategoriWidget("Colors", "palette"),
                  _KategoriWidget("Sport", "sport"),
                  _KategoriWidget("Number", "number-blocks"),
                  _KategoriWidget("Family", "family"),
                  _KategoriWidget("Transport", "transportation"),
                  _KategoriWidget("Alphabet", "abc"),
                  _KategoriWidget("Vegetables", "vegetables"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
