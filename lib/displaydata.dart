import 'dart:ffi';

import 'package:checkboxlist/callApi/usersheet_api.dart';
import 'package:checkboxlist/googlesheet.dart';
import 'package:checkboxlist/userfielf.dart';
import 'package:flutter/material.dart';

class Display_list_info extends StatefulWidget {
  const Display_list_info({Key key}) : super(key: key);

  @override
  State<Display_list_info> createState() => _Display_list_infoState();
}

class _Display_list_infoState extends State<Display_list_info> {
  bool isloaded=false;
  List<User> users=[];
  int index=0;
  Future getData()async{

    setState(() {
      isloaded=true;
    });

    final userss= await UserSheetsApi.getAll();
    setState(() {
      users=userss.cast<User>();
      isloaded=false;
    });
  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();


}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Padding(
      padding: const EdgeInsets.only(left: 20,top: 20,bottom: 10),
      child: Row(children: const [
        SizedBox(width:10),

        Text("Id"),
        SizedBox(width:40),

        Text("NAME"),
        SizedBox(width:40),

        Text("CONTACT"),
        SizedBox(width:40),

      ],),
    ),

    Center(
      child:isloaded==false?
      Container(
        height: 300,
        child: ListView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: users.length,
            itemBuilder: (BuildContext context,int ind){
              return
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20,top: 20,bottom: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(users[ind].id,
                            style: TextStyle(
                                color: Colors.green,fontSize: 15),),
                          SizedBox(width:40),

                          Text(users[ind].name,
                            style: TextStyle(
                                color: Colors.green,fontSize: 15),),
                          SizedBox(width:20),
                          Text(users[ind].contact,
                            style: TextStyle(
                                color: Colors.green,fontSize: 15),),

                          Expanded(child: SizedBox(width:40)),

                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Column(
                              children: [
                                Container(
                                  width:40,
                                  child: InkWell(
                                      onTap: (){

                                     final del =  deleteById(int.parse(users[ind].id));
                                     setState(() {
                                       getData();

                                     });

                                     },
                                      child: Icon(Icons.delete_forever)),
                                ),
                              ],
                            ),
                          ),
                          // icon
                          SizedBox(width:40),

                          Container(

                            child: InkWell(
                                onTap: (){
                                 var a= Navigator.push(context, MaterialPageRoute(builder: (context)=>GoogleSheet_file(id: int.parse(users[ind].id), user: users[ind])));
                                 setState(() {
                                   getData();

                                 });
                                 },
                                child: Icon(Icons.edit)),
                          ), // icon



                        ],
                      ),
                    ),
                  ],
                );
            }
        ),
      ):Container(child:CircularProgressIndicator(),
      ),

    ),
  ],
),
    );
  }


  Future<bool> deleteById(int id) async {
    return await UserSheetsApi.delete(id) ;

  }

  // Future<bool> delete(User user) => deleteById(int.parse(user.id));

}

