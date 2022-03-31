
import 'package:flutter/material.dart';



class Display extends StatefulWidget {

final name;
   Display({this.name,Key key}) : super(key: key);

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("LSiste${widget.name.length}");

    // widget.name.clear();


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 200),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(child:
                      Text(widget.name.toString())
                      ),
                    ],
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
