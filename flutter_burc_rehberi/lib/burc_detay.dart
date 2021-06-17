import 'package:flutter/material.dart';
import 'package:flutter_burc_rehberi/burc_listesi.dart';

import 'models/burc.dart';

class BurcDetay extends StatelessWidget {
  int gelenindex;
  Burc secilenburc;
  BurcDetay(this.gelenindex);
  @override
  Widget build(BuildContext context) {
    secilenburc = BurcListesi.tumBurclar[gelenindex];

    return Scaffold(
      body: CustomScrollView(
        primary: false,
        slivers: [
          SliverAppBar(
            expandedHeight: 250.0,
            pinned: true,
            backgroundColor: Colors.yellow,
            centerTitle: true,
            title: Text(
              secilenburc.burcAdi + " " + "Burcu ve Özellikleri",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "images/" + secilenburc.burcBuyukResim,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.black,
              child: Card(
                color: Colors.yellow,
                child: SingleChildScrollView(
                  child: Text(
                    secilenburc.burcDetay,
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
