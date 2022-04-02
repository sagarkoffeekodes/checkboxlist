
import 'package:checkboxlist/MyHomePage.dart';
import 'package:checkboxlist/betterplayer.dart';
import 'package:checkboxlist/displaydata.dart';
import 'package:checkboxlist/userfielf.dart';
import 'package:checkboxlist/videoplayer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_to_mobilepay/flutter_to_mobilepay.dart';
import 'button.dart';
import 'callApi/usersheet_api.dart';

class GoogleSheet_file extends StatefulWidget {
 GoogleSheet_file({Key key,this.id,this.user}) : super(key: key);
   int id;
   User user;
   @override
   State<GoogleSheet_file> createState() => _GoogleSheet_fileState();
}

class _GoogleSheet_fileState extends State<GoogleSheet_file> {
  List<User> data=[];

  bool isloaded=false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController  contact = TextEditingController();




  @override
  void initState() {
    if (widget.id != null) {
      name = TextEditingController(text: widget.user.name);
      contact = TextEditingController(text: widget.user.contact);
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Googlesheet"),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 30),
                child: Container(
                  child: TextField(
                    controller: name,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'name',
                        hintText: 'Enter Your name'
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 30),
                child: Container(
                  child: TextField(
                    controller: contact,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'contact',
                        hintText: 'Enter Your contact'
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 60),
                child: Row(
                  children: [
                    widget.id == null
                      ?
                    Container(
                    alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(32),
                          child:  ElevatedButton(
                            child: widget.id!=null?Text("Update"): Text("Click"),
                            onPressed:() async {
                              var id = await UserSheetsApi.getRowCount() + 1 ;
                              var user={
                                UserFields.id:id.toString(),
                                UserFields.name:name.text.toString(),
                                UserFields.contact:contact.text.toString(),
                              };
                              await UserSheetsApi.insert([user]);
                            },
                          )
                        ),
                    )
                      :
                    Container(
                      alignment: Alignment.center,
                      child: Padding(
                          padding: const EdgeInsets.all(32),
                          child:  ElevatedButton(
                            child: widget.id!=null?Text("Update"): Text("Click"),
                            onPressed:() async {
                              // var id = await UserSheetsApi.getRowCount() + 1 ;
                              var user={
                                UserFields.id:widget.id.toString(),
                                UserFields.name:name.text.toString(),
                                UserFields.contact:contact.text.toString(),
                              };
                              await UserSheetsApi.update(widget.id, user);
                            },
                          )
                      ),
                    ),


                    Container(child: ElevatedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Display_list_info()));
                      },
                      child:Text("Next"),
                    ),)
                  ],
                ),
              ),

              Container(
                alignment: Alignment.center,
                child: Padding(
                    padding: const EdgeInsets.all(32),
                    child:  ElevatedButton(
                      child:  Text(" Static data"),
                      onPressed:() async {
                        var id = await UserSheetsApi.getRowCount() + 1 ;
                        var user={
                           UserFields.id:data.toString(),
                          UserFields.name:data.toString(),
                          UserFields.contact:data.toString(),
                        };
                        await UserSheetsApi.insert([user]);
                      },
                    )
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Padding(
                    padding: const EdgeInsets.all(32),
                    child:  ElevatedButton(
                      child:  Text("Checkbox from api"),
                      onPressed:() async {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(),));
                      },
                    )
                ),
              ),


              Container(
                alignment: Alignment.center,
                child: Padding(
                    padding: const EdgeInsets.all(32),
                    child:  ElevatedButton(
                      child:  Text("BetterVideo"),
                      onPressed:() async {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Betterplaer_video()));
                      },
                    )
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Padding(
                    padding: const EdgeInsets.all(32),
                    child:  ElevatedButton(
                      child:  Text("pay"),
                      onPressed:() async {

pay();
},
                    )
                ),
              ),


/*
              // Container(
              //   alignment: Alignment.center,
              //   child: Padding(
              //       padding: const EdgeInsets.all(32),
              //       child:  ElevatedButton(
              //         child:  Text("video"),
              //         onPressed:() async {
              //           Navigator.push(context, MaterialPageRoute(builder: (context) => VideoPlayerPlugin()));
              //         },
              //       )
              //   ),
              // ),
*/
//
            ],
          ),
        ),
      ),
    );
  }
  pay() async {
    await MobilePay.initialize(
      merchantID: TestMerchantID.denmark,
      country: Country.denmark,
      urlScheme: "myapp", // iOS only, see installation
    );
  }
}


