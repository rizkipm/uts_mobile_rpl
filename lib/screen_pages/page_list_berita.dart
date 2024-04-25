import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uts_mobile_rpl/screen_pages/page_detail_berita.dart';
import 'package:uts_mobile_rpl/screen_pages/page_login.dart';
import 'package:uts_mobile_rpl/utils/cek_session.dart';

import '../models/model_berita.dart';

class PageListBerita extends StatefulWidget {
  const PageListBerita({super.key});

  @override
  State<PageListBerita> createState() => _PageListBeritaState();
}

class _PageListBeritaState extends State<PageListBerita> {

   String? id, username;
  //  id = session.getSesiIdUser();
  //fungsion untuk get data berita
  Future<List<Datum>?> getBerita() async {
    try {
      http.Response res = await http
          .get(Uri.parse('http://192.168.100.252:8080/uts_mobile/berita.php'));
      return modelBeritaFromJson(res.body).data;
    } catch (e) {
      setState(() {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      });
    }
  }

  Future getSession() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      id = pref.getString("id") ?? '';
      username = pref.getString("username") ?? '';
      print('id $id');
    });

   }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBerita();
    getSession();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Berita'),
        backgroundColor: Colors.orange,
        actions: [

          Text('Hi.. ${username}' ),
          IconButton(onPressed: (){
            //sesi logout
            setState(() {
              session.clearSession();
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:

              (context)=> PageLogin()), (route) => false);
            });
          },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: FutureBuilder(
        future: getBerita(),
        builder: (BuildContext context, AsyncSnapshot<List<Datum>?> snapshot) {
          //cek apabila ada data
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                Datum? data = snapshot.data?[index];
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {
                      //ketika item di klik pindah ke detail
                      Navigator.push(context, MaterialPageRoute(builder: (context)
                        => PageDetailBerita(data)
                      ));
                    },
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                'http://192.168.100.252:8080/uts_mobile/image/${data?.gambar}',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              '${data?.judul}',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              '${data?.konten}',
                              maxLines: 2,
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            return Center(
                child: CircularProgressIndicator(
              color: Colors.orange,
            ));
          }
        },
      ),
    );
  }
}
