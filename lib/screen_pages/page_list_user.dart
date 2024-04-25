import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:uts_mobile_rpl/models/model_list_mahasiswa.dart';

class PageListUser extends StatefulWidget {
  const PageListUser({super.key});

  @override
  State<PageListUser> createState() => _PageListUserState();
}

class _PageListUserState extends State<PageListUser> {
  bool isLoading = true;
  List<ModelListMahasiswa> listUser = [];

  //kita method untuk get data user
  // Future getUser() async{
  //   try{
  //     //do in background
  //     setState(() {
  //       isLoading = true;
  //     });
  //     http.Response response = await
  //     http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
  //     var data = jsonDecode(response.body);
  //     setState(() {
  //       for(Map<String, dynamic> i in data){
  //         listUser.add(ModelUser.fromJson(i));
  //       }
  //     });
  //
  //   }catch(e){
  //     //ada error
  //     isLoading = false;
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
  //   }
  // }

  //do in  background
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getUser();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('List Data User'),
      ),

      body: Center(
        child: ListView.builder(
            itemCount: listUser.length,
            itemBuilder: (context, index){
              return Padding(
                  padding: EdgeInsets.all(10),
                  child: Card(
                    child: ListTile(
                      // title: Text(
                      //   listUser[index].name ?? "",
                      //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.red),
                      // ),
                      subtitle: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Text(listUser[index].email ?? ""),
                          // Text(listUser[index].address.street ?? ""),
                          // Text('Company:  ${listUser[index].company.name}' ?? ""),
                        ],
                      ),
                    ),
                  ),
              );
            }),
      ),
    );
  }
}
