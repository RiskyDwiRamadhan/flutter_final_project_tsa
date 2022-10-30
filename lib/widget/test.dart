// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_final_project_tsa/model/kata.dart';
import 'package:flutter_final_project_tsa/network/network_request.dart';
import 'package:flutter_final_project_tsa/widget/error.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_tts/flutter_tts.dart';
// import 'package:flutter_tts/flutter_tts_web.dart';

class TestWidget extends StatefulWidget {
  const TestWidget(
      {Key? key,
      required this.question,
      required this.score,
      required this.nKuis})
      : super(key: key);
  final List<Kata> question;
  final int score;
  final int nKuis;

  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  // final FlutterTts flutterTts = FlutterTts();

  late int iKuis = widget.nKuis;
  late int scores = widget.score;

  List<int> sIndex = [0, 1, 2, 3];
  late String bi, bing, sgambar;
  int indexSoal = Random().nextInt(10);
  // Pertanyaan ingris ke indo
  List<String> pertanyaan = [];
  List<String> lGambar = [];
  late bool processing;

  @override
  void initState() {
    super.initState();
    processing = false;
    soal();
    pilihan();
  }

  void soal() async {
    this.bi = widget.question[indexSoal].bindo.toString();
    this.bing = widget.question[indexSoal].bing.toString();
    this.sgambar = widget.question[indexSoal].gambar.toString();
    this.pertanyaan.add(widget.question[indexSoal].bindo.toString());
    this.lGambar.add(widget.question[indexSoal].gambar.toString());
  }

  void pilihan() async {
    for (int i = 0; i < 3; i++) {
      int angka = Random().nextInt(10);
      if (indexSoal != angka) {
        pertanyaan.add(widget.question[angka].bindo.toString());
        lGambar.add(widget.question[angka].gambar.toString());
      } else {
        angka = Random().nextInt(10);
        pertanyaan.add(widget.question[angka].bindo.toString());
        lGambar.add(widget.question[angka].gambar.toString());
      }
    }
    sIndex.shuffle();
  }

  void _jawaban(String jawaban) async {
    if (bi == jawaban) {
      scores += 10;
    }
    _startQuizReading();
  }

  void _startQuizReading() async {
    setState(() {
      processing = true;
      iKuis++;
    });
    try {
      String kategori = widget.question[0].kategori.toString();
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
      if (iKuis < 10) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) =>
                TestWidget(question: questions, score: scores, nKuis: iKuis),
          ),
        );
      } else {
        print("Selesai");
        print("Score = ${widget.score}");
      }
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
              "Are you sure you want to quit the quis?",
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

  // Future _speak() async {
  //   await flutterTts.setLanguage("en-US");
  //   await flutterTts.setPitch(1);
  //   await flutterTts.speak(bing);
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
            title: Text("Listening"),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () => _onWillPop,
            )),
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
                          child: GestureDetector(
                            onTap: () {},
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
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 20, 20),
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
                                        onPressed: () {
                                          _jawaban(
                                              pertanyaan[sIndex[0]].toString());
                                        },
                                        child: Text(
                                          pertanyaan[sIndex[0]],
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
                                        onPressed: () {
                                          _jawaban(
                                              pertanyaan[sIndex[1]].toString());
                                        },
                                        child: Text(
                                          pertanyaan[sIndex[1]],
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
                                        onPressed: () {
                                          _jawaban(
                                              pertanyaan[sIndex[2]].toString());
                                        },
                                        child: Text(
                                          pertanyaan[sIndex[2]],
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
                                        onPressed: () {
                                          _jawaban(
                                              pertanyaan[sIndex[3]].toString());
                                        },
                                        child: Text(
                                          pertanyaan[sIndex[3]],
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
      ),
    );
  }
}
