class WeatherDetails {
  final CoOrd? coOrd;
  final List<Weather>? weatherList;
  final String? base, name;
  final MainData? main;
  final Wind? wind;
  final Clouds? clouds;
  final Sys? sys;
  final int? visibility, timezone, id, cod, dt;

  WeatherDetails({
    this.coOrd,
    this.weatherList,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  });

  factory WeatherDetails.fromJson(Map<String, dynamic> json) => WeatherDetails(
        coOrd: CoOrd.fromJson(json['coord']),
        weatherList: json['weather'] == null ? [] : List<Weather>.from(json['weather'].map((e) => Weather.fromJson(e))),
        base: json['base'] ?? '',
        main: MainData.fromJson(json['main']),
        visibility: json['visibility'] ?? 0,
        wind: Wind.fromJson(json["wind"]),
        clouds: Clouds.fromJson(json["clouds"]),
        dt: json["dt"],
        sys: Sys.fromJson(json["sys"]),
        timezone: json['timezone'],
        id: json['id'],
        name: json['name'],
        cod: json['cod'],
      );
}

class CoOrd {
  final double? lat, long;

  CoOrd({this.lat, this.long});

  factory CoOrd.fromJson(Map<String, dynamic> json) => CoOrd(lat: json['lat'], long: json['lon']);
}

class Weather {
  final int? id;
  final String? main, description, icon;

  Weather({this.id, this.main, this.description, this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json['id'],
        main: json['main'],
        description: json['description'],
        icon: json['icon'],
      );
}

class MainData {
  final int? pressure, humidity;
  final double? temp, feelsLike, tempMin, tempMax;

  MainData({this.temp, this.feelsLike, this.tempMin, this.tempMax, this.pressure, this.humidity});

  factory MainData.fromJson(Map<String, dynamic> json) => MainData(
        temp: json['temp'],
        feelsLike: json['feels_like'],
        tempMin: json['temp_min'],
        tempMax: json['temp_max'],
        pressure: json['pressure'],
        humidity: json['humidity'],
      );
}

class Wind {
  final int? deg;
  final double? speed;

  Wind({
    this.speed,
    this.deg,
  });

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json['speed'],
        deg: json['deg'],
      );
}

class Clouds {
  final int? all;

  Clouds({this.all});

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(all: json['all']);
}

class Sys {
  final int? type, id, sunrise, sunset;
  final String? country;

  Sys({
    this.type,
    this.id,
    this.country,
    this.sunrise,
    this.sunset,
  });

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        type: json['type'],
        id: json['id'],
        country: json['country'],
        sunrise: json['sunrise'],
        sunset: json['sunset'],
      );
}
