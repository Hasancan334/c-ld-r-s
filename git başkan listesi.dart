import 'package:flutter/material.dart';
import 'package:benboyleisin/baskan.dart';
import 'package:benboyleisin/Strings.dart';
import 'package:benboyleisin/resim_adlari_listesi.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'admob.dart';

import 'drawer.dart';




// ignore: must_be_immutable
class BaskanListesi extends StatelessWidget {
  static List<Baskan> tumBaskanlar;


  @override
  Widget build(BuildContext context) {
    tumBaskanlar = veriKaynaginiHazirla();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cumhurbaşkanlarının Bilinmeyen Yönleri",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.0),
        ),
        backgroundColor: Colors.blue.shade500,
      ),
      drawer: MyDrawer(),
      body: listeyiHazirla(),
    );
  }

  List veriKaynaginiHazirla() {
    List<Baskan> baskanlar = [];

    for (int i = 0; i < 17; i++) {
      String kucukResim =
          ResimAdlari.BASKAN_ADLARI[i].toLowerCase() + "${i + 1}.jpg";
      String buyukResim = ResimAdlari.BASKAN_ADLARI[i].toLowerCase() +
          "_kucuk" +
          "${i + 1}.jpg";

      Baskan eklenecekBaskan = Baskan(
          Strings.BASKAN_ADLARI[i],
          Strings.GOREV_TARIHLERI[i],
          Strings.BASKAN_OZELLIKLERI[i],
          kucukResim,
          buyukResim);

      baskanlar.add(eklenecekBaskan);
    }
    return baskanlar;
  }

  Widget listeyiHazirla() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return tekSatirBaskan(context, index);
      },
      itemCount: tumBaskanlar.length,
    );
  }

  Widget tekSatirBaskan(BuildContext context, int index) {
    Baskan oAnListeyeEklenenBaskan = tumBaskanlar[index];

    return Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: () => Navigator.pushNamed(context, "/baskanDetay/$index"),
            leading: Image.asset(
              "images/" + oAnListeyeEklenenBaskan.baskanKucukResim,
              height: 64,
              width: 64,
            ),
            title: Text(
              oAnListeyeEklenenBaskan.baskanAdi,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.lightBlue.shade400),
            ),
            subtitle: Text(
              oAnListeyeEklenenBaskan.baskanTarihi,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.indigo.shade400),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ));
  }
}
