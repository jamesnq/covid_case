class CountryInfo {
  int? updated;
  String? country;
  CountryInfo1? countryInfo;
  int? cases;
  int? todayCases;
  int? deaths;
  int? todayDeaths;
  int? recovered;
  int? todayRecovered;
  int? active;
  int? critical;
  int? casesPerOneMillion;
  int? deathsPerOneMillion;
  int? tests;
  int? testsPerOneMillion;
  int? population;
  String? continent;
  int? oneCasePerPeople;
  int? oneDeathPerPeople;
  int? oneTestPerPeople;
  double? activePerOneMillion;
  double? recoveredPerOneMillion;
  double? criticalPerOneMillion;

  CountryInfo({this.updated, this.country, this.countryInfo, this.cases, this.todayCases, this.deaths, this.todayDeaths, this.recovered, this.todayRecovered, this.active, this.critical, this.casesPerOneMillion, this.deathsPerOneMillion, this.tests, this.testsPerOneMillion, this.population, this.continent, this.oneCasePerPeople, this.oneDeathPerPeople, this.oneTestPerPeople, this.activePerOneMillion, this.recoveredPerOneMillion, this.criticalPerOneMillion});

  CountryInfo.fromJson(Map<String, dynamic> json) {
    if(json["updated"] is int) {
      updated = json["updated"];
    }
    if(json["country"] is String) {
      country = json["country"];
    }
    if(json["countryInfo"] is Map) {
      countryInfo = json["countryInfo"] == null ? null : CountryInfo1.fromJson(json["countryInfo"]);
    }
    if(json["cases"] is int) {
      cases = json["cases"];
    }
    if(json["todayCases"] is int) {
      todayCases = json["todayCases"];
    }
    if(json["deaths"] is int) {
      deaths = json["deaths"];
    }
    if(json["todayDeaths"] is int) {
      todayDeaths = json["todayDeaths"];
    }
    if(json["recovered"] is int) {
      recovered = json["recovered"];
    }
    if(json["todayRecovered"] is int) {
      todayRecovered = json["todayRecovered"];
    }
    if(json["active"] is int) {
      active = json["active"];
    }
    if(json["critical"] is int) {
      critical = json["critical"];
    }
    if(json["casesPerOneMillion"] is int) {
      casesPerOneMillion = json["casesPerOneMillion"];
    }
    if(json["deathsPerOneMillion"] is int) {
      deathsPerOneMillion = json["deathsPerOneMillion"];
    }
    if(json["tests"] is int) {
      tests = json["tests"];
    }
    if(json["testsPerOneMillion"] is int) {
      testsPerOneMillion = json["testsPerOneMillion"];
    }
    if(json["population"] is int) {
      population = json["population"];
    }
    if(json["continent"] is String) {
      continent = json["continent"];
    }
    if(json["oneCasePerPeople"] is int) {
      oneCasePerPeople = json["oneCasePerPeople"];
    }
    if(json["oneDeathPerPeople"] is int) {
      oneDeathPerPeople = json["oneDeathPerPeople"];
    }
    if(json["oneTestPerPeople"] is int) {
      oneTestPerPeople = json["oneTestPerPeople"];
    }
    if(json["activePerOneMillion"] is double) {
      activePerOneMillion = json["activePerOneMillion"];
    }
    if(json["recoveredPerOneMillion"] is double) {
      recoveredPerOneMillion = json["recoveredPerOneMillion"];
    }
    if(json["criticalPerOneMillion"] is double) {
      criticalPerOneMillion = json["criticalPerOneMillion"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["updated"] = updated;
    data["country"] = country;
    if(countryInfo != null) {
      data["countryInfo"] = countryInfo?.toJson();
    }
    data["cases"] = cases;
    data["todayCases"] = todayCases;
    data["deaths"] = deaths;
    data["todayDeaths"] = todayDeaths;
    data["recovered"] = recovered;
    data["todayRecovered"] = todayRecovered;
    data["active"] = active;
    data["critical"] = critical;
    data["casesPerOneMillion"] = casesPerOneMillion;
    data["deathsPerOneMillion"] = deathsPerOneMillion;
    data["tests"] = tests;
    data["testsPerOneMillion"] = testsPerOneMillion;
    data["population"] = population;
    data["continent"] = continent;
    data["oneCasePerPeople"] = oneCasePerPeople;
    data["oneDeathPerPeople"] = oneDeathPerPeople;
    data["oneTestPerPeople"] = oneTestPerPeople;
    data["activePerOneMillion"] = activePerOneMillion;
    data["recoveredPerOneMillion"] = recoveredPerOneMillion;
    data["criticalPerOneMillion"] = criticalPerOneMillion;
    return data;
  }
}

class CountryInfo1 {
  int? id;
  String? iso2;
  String? iso3;
  int? lat;
  int? long;
  String? flag;

  CountryInfo1({this.id, this.iso2, this.iso3, this.lat, this.long, this.flag});

  CountryInfo1.fromJson(Map<String, dynamic> json) {
    if(json["_id"] is int) {
      id = json["_id"];
    }
    if(json["iso2"] is String) {
      iso2 = json["iso2"];
    }
    if(json["iso3"] is String) {
      iso3 = json["iso3"];
    }
    if(json["lat"] is int) {
      lat = json["lat"];
    }
    if(json["long"] is int) {
      long = json["long"];
    }
    if(json["flag"] is String) {
      flag = json["flag"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["_id"] = id;
    data["iso2"] = iso2;
    data["iso3"] = iso3;
    data["lat"] = lat;
    data["long"] = long;
    data["flag"] = flag;
    return data;
  }
}