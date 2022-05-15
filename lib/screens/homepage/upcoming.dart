import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/firebase_services.dart';
import 'package:flutter_application_1/widgets/singleProduct_widget.dart';

class Upcoming extends StatefulWidget {
  Upcoming({Key? key}) : super(key: key);

  @override
  State<Upcoming> createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>>? dataStream;

  @override
  void initState() {
    dataStream =
        db.collection("seller").where("price", isNull: false).snapshots();

    log(dataStream.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return dataList(dataStream!);
  }
}

Widget dataList(Stream dataStream) {
  return Scaffold(
    body: Container(
      child: StreamBuilder<QuerySnapshot>(
        stream: dataStream as Stream<QuerySnapshot<Object?>>?,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Container(child: CircularProgressIndicator()));
          }
          return snapshot.data == null
              ? Center(
                  child: Container(
                    child: Text("Empty"),
                  ),
                )
              : ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    var data = snapshot.data?.docs[index];
                    return UpcomingProductWidget(
                      productName: data?["name"],
                      productModel: data?["model"],
                      productPrice: double.parse(data?["price"]),
                    );
                    // return Tile(
                    //     snapshot.data.documents[index].data()["Data"]["title"],
                    //     snapshot.data.documents[index].data()["Data"]["id"],
                    //     snapshot.data.documents[index].data()["Data"]["pass"],
                    //     snapshot.data.documents[index].data()["Data"]
                    //         ["dynamicLink"],
                    //     snapshot.data.documents[index].data()["Data"]
                    //         ["tileColor"],
                    //     snapshot.data.documents[index].data()["Data"]["image"]);
                  },
                );
        },
      ),
    ),
  );
}
