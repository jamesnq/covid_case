import 'package:flutter/material.dart';
import 'data_source/api_services.dart';
import 'country_infor.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? myCountry;
  CountryInfo? countryInfo;
  CountryInfo1? countryInfo1;
  ApiServices apiServices = ApiServices();
  List<CountryInfo> countryList = [];
  bool loading = true;
  String _selectedCountry = 'Vietnam';

  Future getCountryList() async {
    var countryResponse = await apiServices.fetchCountry();
    setState(() {
      countryList = countryResponse;
      loading = false;
    });
  }

  void _runFilter(String value) {
    List<CountryInfo> result = [];
    result = countryList
        .where((country) => country.country!.contains(value))
        .toList();
    if (result.isNotEmpty) {
      countryInfo = CountryInfo(
          cases: result[0].cases,
          deaths: result[0].deaths,
          recovered: result[0].recovered);
      countryInfo1 =
          CountryInfo1(flag: result[0].countryInfo!.flag);
    }
  }

  @override
  void initState() {
    super.initState();

    getCountryList();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          //Banner
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomRight,
                    colors: [
                  Color(0xFF002060),
                  Color(0xFF3300ff),
                ])),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Covid - 19 cases with API",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white,
                      )),
                  Text("All you need is to stay at home",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF959595),
                      ))
                ],
              ),
            ),
          ),

          //Dropdown Button
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: const Color(0xFFE5E5E5),
                )),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 15, right: 10),
                  child: Icon(
                    Icons.place_outlined,
                    color: Colors.blue,
                  ),
                ),
                Expanded(
                  child: DropdownButton(
                    value: _selectedCountry,
                    hint: const Text("Select Country"),
                    underline: const SizedBox(),
                    isExpanded: true,
                    items: countryList.map((CountryInfo item) {
                      return DropdownMenuItem<String>(
                        value: item.country,
                        child: Text(item.country!),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _runFilter(newValue.toString());
                        _selectedCountry = newValue.toString();
                      });
                    },
                  ),
                )
              ],
            ),
          ),

          //Infor
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color(0xFFE5E5E5),
                        )),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Cases",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            countryInfo == null
                                ? "null"
                                : countryInfo!.cases.toString(),
                            style: const TextStyle(fontSize: 28),
                          ),
                        ]),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color(0xFFE5E5E5),
                        )),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Deaths",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            countryInfo == null
                                ? "null"
                                : countryInfo!.deaths.toString(),
                            style: const TextStyle(fontSize: 28),
                          ),
                        ]),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color(0xFFE5E5E5),
                        )),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Recovered",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            countryInfo == null
                                ? "null"
                                : countryInfo!.recovered.toString(),
                            style: const TextStyle(fontSize: 28),
                          ),
                        ]),
                  ),
                  Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color(0xFFE5E5E5),
                        ),
                      image: DecorationImage(
                        image: NetworkImage(countryInfo1 == null
                            ? "https://disease.sh/assets/img/flags/vn.png"
                            : countryInfo1!.flag.toString()),
                        fit: BoxFit.cover,
                      )
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
