import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_final_project_tsa/model/kata.dart';
import 'package:flutter_final_project_tsa/network/network_request.dart';
import 'package:flutter_final_project_tsa/widget/error.dart';
import 'package:flutter_final_project_tsa/widget/kategori.dart';
import 'package:google_fonts/google_fonts.dart';

class GambarWidget extends StatefulWidget {
  const GambarWidget(
      {Key? key,
      required this.question,
      required this.score,
      required this.nKuis})
      : super(key: key);
  final List<Kata> question;
  final int score;
  final int nKuis;

  @override
  _GambarWidgetState createState() => _GambarWidgetState();
}

class _GambarWidgetState extends State<GambarWidget> {
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
                GambarWidget(question: questions, score: scores, nKuis: iKuis),
          ),
        );
      } else {
        print("Selesai");
        print("Score = ${widget.score}");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => HomePageWidget(title: "Kategori")),
        );
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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Image"),
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
                                  sgambar,
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
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
                                        bing,
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
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
                                            onPressed: () {
                                              _jawaban(pertanyaan[sIndex[1]]
                                                  .toString());
                                            },
                                            child: Text(
                                              pertanyaan[sIndex[1]].toString(),
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
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
                                            onPressed: () {
                                              _jawaban(pertanyaan[sIndex[2]]
                                                  .toString());
                                            },
                                            child: Text(
                                              pertanyaan[sIndex[2]].toString(),
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
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
                                            onPressed: () {
                                              _jawaban(pertanyaan[sIndex[3]]
                                                  .toString());
                                            },
                                            child: Text(
                                              pertanyaan[sIndex[3]].toString(),
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
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
                                            onPressed: () {
                                              _jawaban(pertanyaan[sIndex[0]]
                                                  .toString());
                                            },
                                            child: Text(
                                              pertanyaan[sIndex[0]].toString(),
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
      ),
    );
  }
}
