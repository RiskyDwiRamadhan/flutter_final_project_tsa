import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_final_project_tsa/model/kata.dart';
import 'package:flutter_final_project_tsa/network/network_request.dart';

import '../cell/grid_cell.dart';

class KosaKataWidget extends StatefulWidget {
  const KosaKataWidget({Key? key, required this.kategori}) : super(key: key);
  final String kategori;

  @override
  State<KosaKataWidget> createState() => _KosaKataWidgetState();
}

class _KosaKataWidgetState extends State<KosaKataWidget> {
  gridView(AsyncSnapshot<List<Kata>> snapshot) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: snapshot.data!.map((kata) {
          return GestureDetector(
            child: GridTile(
              child: KataCell(kata),
            ),
            onTap: () {
              gotoDetailpage(context, kata);
            },
          );
        }).toList(),
      ),
    );
  }

  gotoDetailpage(BuildContext context, Kata kata) {}

  circularProfress() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Vocabulary')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
              child: FutureBuilder<List<Kata>>(
                  future: NetworkRequest.fetchKatas(widget.kategori),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text("Error ${snapshot.error}");
                    } else if (snapshot.hasData) {
                      return gridView(snapshot);
                    }
                    return circularProfress();
                  }))
        ],
      ),
    );
  }
}
