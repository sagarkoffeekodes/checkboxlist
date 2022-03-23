import 'dart:convert';

import 'package:checkboxlist/display.dart';
import 'package:checkboxlist/name_id.dart';
import 'package:flutter/material.dart';

import 'callApi/api.dart';
import 'model/checkbox.dart';


class MyHomePage extends StatefulWidget {
   // MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool value=false;
  List selectedIds=[];
  List selectedname=[];
String controller1;
  TextEditingController controller = new TextEditingController();

  List<Datum> clist = List();



  List<TypeModel> Drop = <TypeModel>[];



  TypeModel ListDropp;

  dropdown_list()async{
    print("data ");

    var data={
      "search_term":"",
      "group_id":"2"
    };
    print("data ${data}");

    var response = await CallApi().postData(data,"admin/Api/searchProductByKeyword");
   print("respnse1 ${response}");

    List<Datum> list;
  print("respnse ${response}");

    var body = json.decode(response.body);
   print(body);
    if (response.statusCode == 200) {
     // print("Response${response.statusCode}");

      List prodlist = body['data'];
   //   print("prodlist ${prodlist}");

      list = prodlist.map<Datum>((json) => Datum.fromJson(json)).toList();
    //  print(list);
      setState(() {
        clist.addAll(list);
         print("singe data ${clist[0].value}");

      });

    } else {
      setState(() {
        isLoading = false;
      });

    }
  }



  bool check=false;
  bool isLoading = false;
  drop_list()async{
    print("data ");

    var data={
      "search_term":"",
      "group_id":"2"
    };
    var response = await CallApi().postData(data,"admin/Api/searchProductByKeyword");

    var body = json.decode(response.body);
    if (response.statusCode == 200) {

      var result  = body['data'] as List;

      var send;
      for (var abc in result) {
        send = TypeModel(abc['cl_product_shortname'],abc['acc_id']);
        setState(() {
          Drop.add(send);
        });
      }
    } else {
      setState(() {
        isLoading = false;
      });

    }
  }




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dropdown_list();
    drop_list();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List of Items"),
         centerTitle: true,
      ),

      body:
      SingleChildScrollView(

        child: Column(
          children: [
            // Container(
            //   height: 200,
            //   child: ListView.builder(
            //     padding: EdgeInsets.only(top: 0),
            //     itemCount: clist.length,
            //     itemBuilder: (context,i){
            //       return Card(child: Text(
            //         clist[i].clProductShortname,
            //         style: TextStyle(
            //             fontSize: 14,
            //             fontWeight: FontWeight.w600,
            //             letterSpacing: 0.5),
            //       ),);
            //  },),
            // ),


  Container(
    child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12)
          )
        ),


          onChanged: (controller){
          setState(() {
            controller1=controller;
          });
        },
          //     (val){
          //
          // if(controller==selectedname){
          //   selectedname=val;
          // }
          // },
),
    ),
  ),


            Container(
              height: 500,
              child: ListView.builder(
                padding: EdgeInsets.only(top: 0),
                itemCount: clist.length,
                itemBuilder: (context,i){
                  if(controller1==clist[i].clProductShortname) {
                    return
                      CheckboxListTile(

                          dense: true,
                          //font change
                          title: new Text(
                            clist[i].clProductShortname,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.5),
                          ),



                          value: value==true?value:clist[i].value  ,
                          //value:value ,
                          onChanged: (bool val) {


                            if( clist[i].value==false){
                              selectedIds.add(clist[i].accId);
                              selectedname.add(clist[i].clProductShortname);

                              print("ID:${selectedIds}");
                              print("name:${selectedname}");
                            }else{
                              selectedname.remove(clist[i].clProductShortname);

                            }

                            if(   clist[i].value==true){
                              selectedIds.remove(clist[i].accId);
                            }

                            setState(() {
                              clist[i].value=val;
                              // value=val;
                            });






                          });
                  }

              else if(controller1==clist[i].clProductShortname.substring(0,clist[i].clProductShortname.length-controller1.length) ) {
                return
                  CheckboxListTile(

                      dense: true,
                      //font change
                      title: new Text(
                        clist[i].clProductShortname,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5),
                      ),



                      value: value==true?value:clist[i].value  ,
                      //value:value ,
                      onChanged: (bool val) {


                        if( clist[i].value==false){
                          selectedIds.add(clist[i].accId);
                          selectedname.add(clist[i].clProductShortname);

                          print("ID:${selectedIds}");
                          print("name:${selectedname}");
                        }else{
                          selectedname.remove(clist[i].clProductShortname);

                        }

                        if(   clist[i].value==true){
                          selectedIds.remove(clist[i].accId);
                        }

                        setState(() {
                          clist[i].value=val;
                          // value=val;
                        });






                      });
              }
              if(controller.text== "") {
                return
                  CheckboxListTile(

                      dense: true,
                      //font change
                      title: new Text(
                        clist[i].clProductShortname,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5),
                      ),



                      value: value==true?value:clist[i].value  ,
                      //value:value ,
                      onChanged: (bool val) {


                        if( clist[i].value==false){
                          selectedIds.add(clist[i].accId);
                          selectedname.add(clist[i].clProductShortname);

                          print("ID:${selectedIds}");
                          print("name:${selectedname}");
                        }else{
                          selectedname.remove(clist[i].clProductShortname);

                        }

                        if(   clist[i].value==true){
                          selectedIds.remove(clist[i].accId);
                        }

                        setState(() {
                          clist[i].value=val;
                          // value=val;
                        });






                      });
              }

                },),
            ),
SizedBox(height:30),
    ElevatedButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Display(name:selectedname)));
        },
    child: Text("Next"),
    )







            // ListView.builder(
            //   physics: NeverScrollableScrollPhysics(),
            //   shrinkWrap: true,
            //
            //   itemCount: clist.length,
            //   itemBuilder: (context, i) {
            //     return Card(
            //       child: Text(clist[i].clProductShortname),
            //     );
            //   },
            // ),


          ],
        ),
      ),

    );
  }

  void onSearchTextChanged(String value) {
    clist.forEach((userDetail) {
      if(controller==clist.length){
       clist.add(userDetail);
      }
    });
  }
}
