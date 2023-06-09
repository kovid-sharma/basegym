import 'dart:convert';
import 'package:http/http.dart' as http;

import 'dart:developer' show log;
import 'dart:math' hide log;

import '../motivation_model.dart';
class Api {
  static Future<Quotes?> getQuotes() async {
    log('inside');
    Uri url = Uri.parse('http://api.quotable.io/random');
    http.Response response = await http.get(url);
    log('ejfne');
    if (response.statusCode == 200) {
      log('frjn');
      return Quotes.fromJson(jsonDecode(response.body));
      log('dbf');
    } else {
      print("error in getting data");
    }
  }
  static Future<List<String>> getQuotesLimitTopic(String _topicName,String _limit) async {
    log('oneauthor');
    String x= 'http://api.quotable.io/quotes?query=${_topicName}&limit=${_limit}';
    log(x);
    Uri url = Uri.parse(x);
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {

      Map<String,dynamic>json= jsonDecode(response.body);
      if(json["results"].isEmpty)return ['!NO QUOTES FROM THIS TOPIC AVAILABLE!'];
      int numQuotes= json["count"];
      var myInt = int.parse(_limit);
      List<String>ans=[];
      for(int i=0;i<min(myInt,numQuotes);i++)
      {
        ans.add(json["results"][i]["content"]);
      }

      return ans;
    } else {
      log('errror in recieving http response!Check Internet connection');
      return ['errror in recieving http response!Check Internet connection'];
    }
  }
  static Future<String> getQuotesOneAuthor(String _authorName) async {
    log('oneauthor');
    String x= 'http://api.quotable.io/quotes?author=${_authorName}';

    Uri url = Uri.parse(x);
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {

      Map<String,dynamic>json= jsonDecode(response.body);
      if(json["results"].isEmpty)return '!NO QUOTES FROM THIS AUTHOR AVAILABLE!';
      int numQuotes= json["count"];
      var random = new Random();
      int randomNumber = random.nextInt(numQuotes-1);
      return json["results"][randomNumber]["content"];
    } else {
      log('errror in recieving http response!Check Internet connection');
      return 'errror in recieving http response!Check Internet connection';
    }
  }









  static Future<List<dynamic>> exercise(String query) async{
    Uri url = Uri.parse('https://api.api-ninjas.com/v1/recipe?query=$query');

    http.Response response = await http.get(url,headers: {'X-Api-Key': 'Q7ajSyy7P4DxznWf+R+QCA==iSMJT1Rx7yFZVHqo'});
    log('ejfne');
    if (response.statusCode == 200) {
      log('frjn');
      List<dynamic>json= jsonDecode(response.body);
      return json;
      log('dbf');
    } else {
      List<dynamic>emp=[];
      print("error in getting data");
      return emp;

    }
  }



  static Future<List<dynamic>> exercise2(String query) async{
    Uri url = Uri.parse('https://api.api-ninjas.com/v1/caloriesburned?activity=$query');

    http.Response response = await http.get(url,headers: {'X-Api-Key': 'Q7ajSyy7P4DxznWf+R+QCA==iSMJT1Rx7yFZVHqo'});
    log('ejfne');
    if (response.statusCode == 200) {
      log('frjn');

      List<dynamic>json= jsonDecode(response.body);
      return json;
      log('dbf');
    } else {
      List<dynamic>emp=[];
      print("error in getting data");
      return emp;

    }
  }





  static Future<List<dynamic>> exercise3(String query) async{
    Uri url = Uri.parse('https://api.api-ninjas.com/v1/nutrition?query=$query');

    http.Response response = await http.get(url,headers: {'X-Api-Key': 'Q7ajSyy7P4DxznWf+R+QCA==iSMJT1Rx7yFZVHqo'});
    log('ejfne');
    if (response.statusCode == 200) {
      log('frjn');
      List<dynamic>json= jsonDecode(response.body);
      return json;
      log('dbf');
    } else {
      List<dynamic>emp=[];
      print("error in getting data");
      return emp;

    }
  }
}




