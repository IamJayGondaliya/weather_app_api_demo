class Weather {
  String cityName;
  String countryCode;
  double lon;
  String timezone;
  double lat;
  List<Datum> data = [];
  String stateCode;

  Weather({
    required this.cityName,
    required this.countryCode,
    required this.lon,
    required this.timezone,
    required this.lat,
    required this.data,
    required this.stateCode,
  });

  Weather.dummy({
    this.cityName = "",
    this.countryCode = "",
    this.lon = 0,
    this.timezone = "",
    this.lat = 0,
    this.stateCode = "",
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        cityName: json["city_name"],
        countryCode: json["country_code"],
        lon: json["lon"]?.toDouble(),
        timezone: json["timezone"],
        lat: json["lat"]?.toDouble(),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        stateCode: json["state_code"],
      );

  Map<String, dynamic> toJson() => {
        "city_name": cityName,
        "country_code": countryCode,
        "lon": lon,
        "timezone": timezone,
        "lat": lat,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "state_code": stateCode,
      };
}

class Datum {
  WindCdir windCdir;
  int rh;
  Pod pod;
  double pres;
  int pop;
  int clouds;
  double vis;
  double windSpd;
  WindCdirFull windCdirFull;
  double slp;
  String datetime;
  int ts;
  DateTime timestampUtc;
  double dewpt;
  double uv;
  DateTime timestampLocal;
  int windDir;
  double ghi;
  int snow;
  int precip;
  double solarRad;
  WeatherClass weather;
  double temp;
  double appTemp;
  double ozone;
  double windGustSpd;
  int cloudsHi;
  int cloudsLow;
  int cloudsMid;
  int snowDepth;
  double dni;
  double dhi;

  Datum({
    required this.windCdir,
    required this.rh,
    required this.pod,
    required this.pres,
    required this.pop,
    required this.clouds,
    required this.vis,
    required this.windSpd,
    required this.windCdirFull,
    required this.slp,
    required this.datetime,
    required this.ts,
    required this.timestampUtc,
    required this.dewpt,
    required this.uv,
    required this.timestampLocal,
    required this.windDir,
    required this.ghi,
    required this.snow,
    required this.precip,
    required this.solarRad,
    required this.weather,
    required this.temp,
    required this.appTemp,
    required this.ozone,
    required this.windGustSpd,
    required this.cloudsHi,
    required this.cloudsLow,
    required this.cloudsMid,
    required this.snowDepth,
    required this.dni,
    required this.dhi,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        windCdir: windCdirValues.map[json["wind_cdir"]] ?? WindCdir.S,
        rh: json["rh"],
        pod: podValues.map[json["pod"]]!,
        pres: json["pres"]?.toDouble(),
        pop: json["pop"],
        clouds: json["clouds"],
        vis: json["vis"]?.toDouble(),
        windSpd: json["wind_spd"]?.toDouble(),
        windCdirFull: windCdirFullValues.map[json["wind_cdir_full"]] ??
            WindCdirFull.SOUTH,
        slp: json["slp"]?.toDouble(),
        datetime: json["datetime"],
        ts: json["ts"],
        timestampUtc: DateTime.parse(json["timestamp_utc"]),
        dewpt: json["dewpt"]?.toDouble(),
        uv: json["uv"]?.toDouble(),
        timestampLocal: DateTime.parse(json["timestamp_local"]),
        windDir: json["wind_dir"],
        ghi: json["ghi"]?.toDouble(),
        snow: json["snow"],
        precip: json["precip"],
        solarRad: json["solar_rad"]?.toDouble(),
        weather: WeatherClass.fromJson(json["weather"]),
        temp: json["temp"]?.toDouble(),
        appTemp: json["app_temp"]?.toDouble(),
        ozone: json["ozone"]?.toDouble(),
        windGustSpd: json["wind_gust_spd"]?.toDouble(),
        cloudsHi: json["clouds_hi"],
        cloudsLow: json["clouds_low"],
        cloudsMid: json["clouds_mid"],
        snowDepth: json["snow_depth"],
        dni: json["dni"]?.toDouble(),
        dhi: json["dhi"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "wind_cdir": windCdirValues.reverse[windCdir],
        "rh": rh,
        "pod": podValues.reverse[pod],
        "pres": pres,
        "pop": pop,
        "clouds": clouds,
        "vis": vis,
        "wind_spd": windSpd,
        "wind_cdir_full": windCdirFullValues.reverse[windCdirFull],
        "slp": slp,
        "datetime": datetime,
        "ts": ts,
        "timestamp_utc": timestampUtc.toIso8601String(),
        "dewpt": dewpt,
        "uv": uv,
        "timestamp_local": timestampLocal.toIso8601String(),
        "wind_dir": windDir,
        "ghi": ghi,
        "snow": snow,
        "precip": precip,
        "solar_rad": solarRad,
        "weather": weather.toJson(),
        "temp": temp,
        "app_temp": appTemp,
        "ozone": ozone,
        "wind_gust_spd": windGustSpd,
        "clouds_hi": cloudsHi,
        "clouds_low": cloudsLow,
        "clouds_mid": cloudsMid,
        "snow_depth": snowDepth,
        "dni": dni,
        "dhi": dhi,
      };
}

enum Pod { D, N }

final podValues = EnumValues({"d": Pod.D, "n": Pod.N});

class WeatherClass {
  int code;
  Icon icon;
  Description description;

  WeatherClass({
    required this.code,
    required this.icon,
    required this.description,
  });

  factory WeatherClass.fromJson(Map<String, dynamic> json) => WeatherClass(
        code: json["code"],
        icon: iconValues.map[json["icon"]] ?? Icon.C01_D,
        description: descriptionValues.map[json["description"]]!,
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "icon": iconValues.reverse[icon],
        "description": descriptionValues.reverse[description],
      };
}

enum Description { CLEAR_SKY, FEW_CLOUDS, OVERCAST_CLOUDS, SCATTERED_CLOUDS }

final descriptionValues = EnumValues({
  "Clear Sky": Description.CLEAR_SKY,
  "Few clouds": Description.FEW_CLOUDS,
  "Overcast clouds": Description.OVERCAST_CLOUDS,
  "Scattered clouds": Description.SCATTERED_CLOUDS
});

enum Icon { C01_D, C01_N, C02_D, C02_N, C04_N }

final iconValues = EnumValues({
  "c01d": Icon.C01_D,
  "c01n": Icon.C01_N,
  "c02d": Icon.C02_D,
  "c02n": Icon.C02_N,
  "c04n": Icon.C04_N
});

enum WindCdir { S, SSW, SW, W, WSW }

final windCdirValues = EnumValues({
  "S": WindCdir.S,
  "SSW": WindCdir.SSW,
  "SW": WindCdir.SW,
  "W": WindCdir.W,
  "WSW": WindCdir.WSW
});

enum WindCdirFull { SOUTH, SOUTHWEST, SOUTH_SOUTHWEST, WEST, WEST_SOUTHWEST }

final windCdirFullValues = EnumValues({
  "south": WindCdirFull.SOUTH,
  "southwest": WindCdirFull.SOUTHWEST,
  "south-southwest": WindCdirFull.SOUTH_SOUTHWEST,
  "west": WindCdirFull.WEST,
  "west-southwest": WindCdirFull.WEST_SOUTHWEST
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
