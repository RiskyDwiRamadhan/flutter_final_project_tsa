import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_final_project_tsa/model/kata.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:flutter_final_project_tsa/network/network_request.dart';
import 'package:flutter_final_project_tsa/widget/error.dart';

class ReadingWidget extends StatefulWidget {
  const ReadingWidget(
      {Key? key,
      required this.question,
      required this.score,
      required this.nKuis})
      : super(key: key);
  final List<Kata> question;
  final int score;
  final int nKuis;

  @override
  _ReadingWidgetState createState() => _ReadingWidgetState();
}

class _ReadingWidgetState extends State<ReadingWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
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
      List<Kata> questions = await NetworkRequest.fetchKatas();
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
                ReadingWidget(question: questions, score: scores, nKuis: iKuis),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Reading"),
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
                          sgambar,
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
                      bing,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ), //Jawaban
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
                              child: GestureDetector(
                                onTap: () {
                                  _jawaban(pertanyaan[sIndex[0]].toString());
                                },
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
                                                lGambar[sIndex[0]],
                                              ).image,
                                            ),
                                            shape: BoxShape.rectangle,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0, 1),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5, 0, 5, 10),
                                        child: Text(pertanyaan[sIndex[0]]),
                                      ),
                                    ),
                                  ],
                                ),
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
                                child: GestureDetector(
                                  onTap: () {
                                    _jawaban(pertanyaan[sIndex[1]].toString());
                                  },
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0, -0.8),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  9, 5, 9, 0),
                                          child: Container(
                                            width: 120,
                                            height: 120,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              image: DecorationImage(
                                                fit: BoxFit.contain,
                                                image: Image.asset(
                                                  lGambar[sIndex[1]],
                                                ).image,
                                              ),
                                              shape: BoxShape.rectangle,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.05, 1),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5, 0, 5, 10),
                                          child: Text(pertanyaan[sIndex[1]]),
                                        ),
                                      ),
                                    ],
                                  ),
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
                              child: GestureDetector(
                                onTap: () {
                                  _jawaban(pertanyaan[sIndex[2]].toString());
                                },
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
                                                lGambar[sIndex[2]],
                                              ).image,
                                            ),
                                            shape: BoxShape.rectangle,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.05, 1),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5, 0, 5, 10),
                                        child: Text(pertanyaan[sIndex[2]]),
                                      ),
                                    ),
                                  ],
                                ),
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
                              child: GestureDetector(
                                onTap: () {
                                  _jawaban(pertanyaan[sIndex[3]].toString());
                                },
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
                                                lGambar[sIndex[3]],
                                              ).image,
                                            ),
                                            shape: BoxShape.rectangle,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.05, 1),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5, 0, 5, 10),
                                        child: Text(pertanyaan[sIndex[3]]),
                                      ),
                                    ),
                                  ],
                                ),
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
