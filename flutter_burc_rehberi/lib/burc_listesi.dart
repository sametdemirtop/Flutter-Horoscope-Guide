import 'package:flutter/material.dart';

import 'burc_detay.dart';
import 'models/burc.dart';
import 'utils/strings.dart';

class BurcListesi extends StatelessWidget {
  static List<Burc> tumBurclar;
  @override
  Widget build(BuildContext context) {
    tumBurclar = veriKaynaginiHazirla();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BURÇ REHBERİ",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
      body: listeyiHazirla(),
      backgroundColor: Colors.white10,
    );
  }

  List<Burc> veriKaynaginiHazirla() {
    List<Burc> Burclar = [];
    for (int i = 0; i < 12; i++) {
      String kucukResim = Strings.BURC_ADLARI[i].toLowerCase() + "${i + 1}.png";
      String buyukResim =
          Strings.BURC_ADLARI[i].toLowerCase() + "_buyuk" + "${i + 1}.png";
      Burc eklenecekburc = Burc(
          Strings.BURC_ADLARI[i],
          Strings.BURC_TARIHLERI[i],
          Strings.BURC_GENEL_OZELLIKLERI[i],
          kucukResim,
          buyukResim);
      Burclar.add(eklenecekburc);
    }
    return Burclar;
  }

  Widget listeyiHazirla() {
    return ListView.builder(
      itemBuilder: (context, int index) {
        return tekSatirBurc(context, index);
      },
      itemCount: tumBurclar.length,
    );
  }

  Widget tekSatirBurc(context, int index) {
    Burc oanListeyeEklenenBurc = tumBurclar[index];
    return Card(
      color: Colors.yellow,
      margin: EdgeInsets.all(5),
      shadowColor: Colors.black12,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => BurcDetay(index))),
          title: Text(
            oanListeyeEklenenBurc.burcAdi,
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.w400, color: Colors.black),
          ),
          leading:
              Image.asset("images/" + oanListeyeEklenenBurc.burcKucukResim),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              oanListeyeEklenenBurc.burcTarihi,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black38),
            ),
          ),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
