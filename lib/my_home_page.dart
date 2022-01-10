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
  ApiServices apiServices = ApiServices();
  List<CountryInfo> countryList = [];
  bool loading = true;

  Future getCountryList() async {
    var countryResponse = await apiServices.fetchCountry();
    setState(() {
      countryList = countryResponse;
      loading = false;
    });
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
                  child: DropdownButton<String>(
                    value: countryInfo!.country,
                    hint: const Text("Select Country"),
                    underline: const SizedBox(),
                    isExpanded: true,
                    items: countryList.map((CountryInfo item) {
                      return DropdownMenuItem(
                          child: Text(item.country),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        myCountry = newValue;
                      });
                    },
                  ),
                )
              ],
            ),
          ),

          // //Infor
          // Column(
          //   children: [
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       children: [
          //         Container(
          //           width: 160,
          //           height: 160,
          //           decoration: BoxDecoration(
          //               color: Colors.white,
          //               borderRadius: BorderRadius.circular(20),
          //               border: Border.all(
          //                 color: const Color(0xFFE5E5E5),
          //               )
          //           ),
          //         ),
          //
          //         Container(
          //           width: 160,
          //           height: 160,
          //           decoration: BoxDecoration(
          //               color: Colors.white,
          //               borderRadius: BorderRadius.circular(20),
          //               border: Border.all(
          //                 color: const Color(0xFFE5E5E5),
          //               )
          //           ),
          //         )
          //       ],
          //     ),
          //     const SizedBox(height: 15,),
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       children: [
          //         Container(
          //           width: 160,
          //           height: 160,
          //           decoration: BoxDecoration(
          //               color: Colors.white,
          //               borderRadius: BorderRadius.circular(20),
          //               border: Border.all(
          //                 color: const Color(0xFFE5E5E5),
          //               )
          //           ),
          //         ),
          //
          //         Container(
          //           width: 160,
          //           height: 160,
          //           decoration: BoxDecoration(
          //               color: Colors.white,
          //               borderRadius: BorderRadius.circular(20),
          //               border: Border.all(
          //                 color: const Color(0xFFE5E5E5),
          //               )
          //           ),
          //         )
          //       ],
          //     ),
          //   ],
          // )
        ],
      ),
    );
  }
}
