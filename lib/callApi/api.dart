import 'dart:convert';
import 'package:http/http.dart' as http;




class CallApi{

  final String _url='https://console.colorsoul.co/';

  postData(data,apiUrl) async {
    var fullUrl = _url + apiUrl;
    var mainUrl = Uri.parse(fullUrl);


    return await http.post(
      mainUrl,
      headers: _setHeaders(),
      body: jsonEncode(data),

    );
  }

  getData(apiUrl) async {

    var fullUrl = _url + apiUrl ;// await _getToken();
    var mainUrl = Uri.parse(fullUrl);

    return await http.get(
        mainUrl,
        headers: _setHeaders()
    );
  }



  // patchData(apiUrl,data) async {
  //
  //   var mainUrl = Uri.http("122.160.143.10:8080", "$apiUrl");
  //   print("main url :${mainUrl}");
  //   return await http.patch(
  //     mainUrl,
  //     body: jsonEncode(data),
  //   );
  // }






  _setHeaders()=>{
  "Authorization" : "4ccda7514adc0f13595a585205fb9761",
    'Content-type' : 'application/json',
  };
}