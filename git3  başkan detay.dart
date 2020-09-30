import 'package:flutter/material.dart';
import 'package:benboyleisin/baskan.dart';
import 'package:benboyleisin/baskan_listesi.dart';

// ignore: must_be_immutable
class BaskanDetay extends StatelessWidget {
  int gelenIndex;
  Baskan secilenBaskan;
  BaskanDetay(this.gelenIndex);


   @override
  Widget build(BuildContext context) {
    secilenBaskan = BaskanListesi.tumBaskanlar[gelenIndex];

    return Scaffold(
      primary: false,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            centerTitle: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "images/" + secilenBaskan.baskanBuyukResim,
                fit: BoxFit.cover,
              ),
            ),
            floating: false,
            expandedHeight: 250.0,
            primary: false,
            pinned: true,
            backgroundColor: Colors.lightBlue,
            title: Text(secilenBaskan.baskanAdi),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.all(8.0),
              color: Colors.yellow.shade100,
              child: SingleChildScrollView(
                child: Text(
                  secilenBaskan.baskanOzellikleri,
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
