import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';

import '../userfielf.dart';


class UserSheetsApi{

  static const _credentials = r'''
{
  "type": "service_account",
  "project_id": "gsheet-345508",
  "private_key_id": "b33df33338d434f9cf2243affd07522ab24669df",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCkZP7/tSesv3Pu\nRzYe85qgIyM7JiFfVVqQg2DU8vbdWYZnGJGoljVVuKtcFRhyMaknH/B+F4n54Q5r\nf3jQgzprtgG8p3O9l5tZCpZrXV9a7e5BB9JqSW7hWWRJ7wfWi5zBtg5c/F34Nt9r\ngIwIoj6l1Zv4sle6mI1jEpIM0DLJODO9N7FQy2lv0AUP6i7LpI8+KqXHUpsFlhE9\nfBdEOZIW080rCECqEKwjBX/Xe4rAoaTY7CJFAEaEyRQ0MjA/3HNQS2Pp3xsaSvxI\ny9VMxR5vDZpWJpoMjdzJoJsFRUcUJ7ZnfN5jpMfgavQBPM7KYWTr2ApbofTJ7MuF\nLsmcM5vFAgMBAAECggEANemLOOe7easVxWRkKtVf9blgQfMYya9vsmnrdRqy+9dy\nvNexWRTdq92SkPG4IScJHrQaRffJP4HfnUBiKhuHKrC3NBvEWL5h61sOBmrKLUNP\nOdNrXYD0lIGg4qA5tVH22A4w+qym0pKIRbST9/bhTbhWXMJ8A80ovP9nlz0mEpfN\nqsb3Mi0hcOm4cVD63RUGuK0SAPccdxg1TRpcwAKMb0NK1cFIfC3DgQlIWtYbFHi9\n2F/xmEhulp6MPtqgXtEYmOKiMc91nldr7HcPilKNhyWStmtAMpsC/ND2WTIhZ/Cj\neb6pJVXFK+bKSZFjp+DFaCKdYj8SNkXaW0Rh5AZQ1wKBgQDWnDlDcjOvXav6GzSe\nn7y3sEex+u8j2sy/aaCUAyHdSdBTapHMlq60MCWO15ci6HwwGK9i7xVm0+CCfP2U\nsKP0qIfWkSqftjeck3fjtnCwFYuDDeB/ZBt7OHap8+rn9RjGSY1Vi6UBSnVN5JEA\nv4/EF4lo1L0rINyhDXdABGbD6wKBgQDEGYMYfqmZHLvbm9RMNjjUAJfcx5rXV1N1\n0b3FudH9tgvUgI1YAGrN70GetENQhXqusPU0HBIcT+iWs52mNWxNoRvXqqtspzxy\nPMgPLowItCB5lcGV39lT8t8XFI0oz8oLg5DXpFLcm3+qt6OHp/yzkpZUbYYF9NdL\nbiZC7+8jDwKBgQCj2ZqOt/5mAWpwBZ1jDioTRG84n5E9Gqv/6DFFUC7muJhpV5AB\nV3oC8E98g3VMnZtTTUV6j3cTjuh2N9+TSlmjTZiIZUTZs1E6Jgz+uifHCGv/nvSr\nzk59AVr33taWSjakDTvu+DL+jU6KLdvXamnlGOM8OlBDQU+xVoqZQcMECQKBgFb1\nkULdeEvjiBK8qYoaSV0J3k4TXcC8gtAucF8sJcjCX8CeOQ+bL8GepZTBD1C3wE2T\nP0kaYZWYgeXCRNidvCc4mGYs0tPd3VozRewlkgeSCQyhsjTKDU/C1dcgT/CXJFuy\nvhpCTlRxyE1mHehcQB1JlcxevR4LEyXp9KGeUIdVAoGARL39iAD4hKIcedpm03AA\nwvi4q/OxN0SEWDSE6YXiW3sN/xXuj5oVTkSVGaO8+6Yqp/MT90wbB1HLlYNI/Q4a\n/fU9COgPkS2ObHFP73mFAh2dU4ZP7rP+bwvmPv0s2NQZNmKzp4/YLAypx62X/+va\nGHP0t7j5GDDdBz2EpKb4oUM=\n-----END PRIVATE KEY-----\n",
  "client_email": "details@gsheet-345508.iam.gserviceaccount.com",
  "client_id": "114281552105869632586",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/details%40gsheet-345508.iam.gserviceaccount.com"
}

  ''';


  static final _spreadShetId='1yTgv5wpeZ9W-yjfvB-ugS5Xtp6qeTJ6qiOkQCqJMc_E';
  static final _gsheets= GSheets(_credentials);
static Worksheet _userSheet;
  static  Future  init() async {
    final spreadsheet = await _gsheets.spreadsheet(_spreadShetId);
 _userSheet = await _getWorkSheet(spreadsheet,title:'user2');
 final firstRow= UserFields.getFields();
 _userSheet.values.insertRow(1, firstRow);
  }

  static Future<Worksheet> _getWorkSheet(
      Spreadsheet spreadsheet,{
         String title,
}
      )async{
    try {
      return await spreadsheet.addWorksheet(title);
    }catch(e){
      return await spreadsheet.worksheetByTitle(title);
    }
  }



  static Future insert(List<Map<String,dynamic>> rowList)async{
  if(_userSheet==null)return;
    _userSheet.values.map.appendRows(rowList);
  }

  static Future<int> getRowCount() async {
    if(_userSheet == null) return 0;

    final lastRow = await _userSheet.values.lastRow();
    return lastRow == null ? 0 : int.tryParse(lastRow.first) ?? 0;
  }




  static Future<List<User>> getAll() async {
    if(_userSheet == null) return <User>[];

    final fields = await _userSheet.values.map.allRows();
    return fields == null ? <User>[] : fields.map(User.fromJson).toList();
  }

  static Future update(int id,Map<String,dynamic> user) async {
    if(_userSheet == null) return false;
   return _userSheet.values.map.insertRowByKey(id, user);

  }



  static Future delete(int id,) async {
    if(_userSheet == null) return false;

   final index= await _userSheet.values.rowIndexOf(id);
if(index==-1) return false;
   return _userSheet.deleteRow(index);
    // return fields == null ? <User>[] : fields.map(User.fromJson).toList();
  }






}
