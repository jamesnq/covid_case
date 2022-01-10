import 'dart:convert';

import 'package:covid_case/country_infor.dart';
import 'package:covid_case/data_source/api_urls.dart';
import 'package:covid_case/resource/strings.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  //fetch country info
  var countryListUrl = ApiUrls.url;
  var response;

  Future<List<CountryInfo1>> fetchCountryInfo() async {
    List<CountryInfo1> countryInfoList = [];

    try {
      response = await http.get(countryListUrl);
    }
    catch(e) {
      print(ERROR_DOWNLOADINGS);
    }

    var body = jsonDecode(response.body);
    List jsonList = body['countryInfo'];
    for(var json in jsonList) {
      CountryInfo1 countryInfo1 = CountryInfo1.fromJson(json);
      countryInfoList.add(countryInfo1);
    }

    return countryInfoList;
  }

  Future<List<CountryInfo>> fetchCountry() async {
    List<CountryInfo> countryList = [];

    try {
      response = await http.get(countryListUrl);
    }
    catch(e) {
      print(ERROR_DOWNLOADINGS);
    }

    var body = jsonDecode(response.body);
    List jsonList = body;
    for(var json in jsonList) {
      CountryInfo countryInfo = CountryInfo.fromJson(json);
      countryList.add(countryInfo);
    }

    return countryList;
  }
}