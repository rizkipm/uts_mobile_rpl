import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uts_mobile_rpl/models/model_berita.dart';

class PageDetailBerita extends StatelessWidget {

  //konstruktor penampung data
  final Datum? data;
  const PageDetailBerita(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          data!.judul
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network('http://192.168.1.2:8080/beritaDb/gambar_berita/${data?.gambar}',
                fit: BoxFit.fill,
              ),

            ),
          ),
          ListTile(
            title: Text(data?.judul ?? "",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15
              ),
            ),
            subtitle: Text(DateFormat().format(data?.created ?? DateTime.now())),
            trailing: Icon(Icons.star, color: Colors.orange,),
          ),

          Container(
            margin: EdgeInsets.all(10),
            child: Text(data?.konten ?? "", style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold
            ),),
          )
        ],
      ),
    );
  }
}
