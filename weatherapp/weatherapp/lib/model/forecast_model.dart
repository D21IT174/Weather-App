class ForecastResponse {
  final City? city;
  final String? cod;
  final double? message;
  final int? cnt;
  final List<DailyWeather>? daily;

  ForecastResponse({
    this.city,
    this.cod,
    this.message,
    this.cnt,
    this.daily,
  });

  factory ForecastResponse.fromJson(Map<String, dynamic> json) => ForecastResponse(
        city: json['city'],
        cod: json['cod'],
        message: json['message'],
        cnt: json['cnt'],
        daily: json['daily'] == null ? [] : List<DailyWeather>.from(json['weather'].map((e) => DailyWeather.fromJson(e))),
      );
}

class City {
  final int? id, population, timezone;
  final String? name, country;
  final double? coOrdLat, coOrdLong;

  City({
    this.id,
    this.population,
    this.timezone,
    this.name,
    this.country,
    this.coOrdLat,
    this.coOrdLong,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
    id: json['id'],
    name: json['name'],
    coOrdLat: json['coord']['lat'],
    coOrdLong: json['coord']['lon'],
    country: json['country'],
    population: json['population'],
    timezone: json['timezone'],
  );
}

class CurrentWeather {
  final int? id;
  final String? main, description;

  CurrentWeather({this.id, this.main, this.description});

  factory CurrentWeather.fromJson(Map<String, dynamic> json) => CurrentWeather(
        id: json['id'],
        main: json['main'],
        description: json['description'],
      );
}

class DailyWeather {
  final int? dt, sunrise, sunset, pressure, humidity, clouds, deg;
  final double? speed, gust, pop, rain;
  final List<CurrentWeather>? weather;
  final Temp? temp;
  final FeelsLike? feelsLike;

  DailyWeather({
    this.dt,
    this.sunrise,
    this.sunset,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.weather,
    this.speed,
    this.deg,
    this.gust,
    this.clouds,
    this.pop,
    this.rain,
  });

  factory DailyWeather.fromJson(Map<String, dynamic> json) => DailyWeather(
        dt: json['dt'],
        sunrise: json['sunrise'],
        sunset: json['sunset'],
        temp: Temp.fromJson(json['temp']),
        feelsLike: FeelsLike.fromJson(json['feelsLike']),
        pressure: json['pressure'],
        humidity: json['humidity'],
        weather: json['weather'] == null ? [] : List<CurrentWeather>.from(json['weather'].map((e) => CurrentWeather.fromJson(e))),
        speed: json['speed'],
        deg: json['deg'],
        gust: json['gust'],
        clouds: json['clouds'],
        pop: json['pop'],
        rain: json['rain'],
      );
}

class Temp {
  final double? day, min, max, night, eve, morn;

  Temp({this.day, this.min, this.max, this.night, this.eve, this.morn});

  factory Temp.fromJson(Map<String, dynamic> json) => Temp(
        day: json['day'],
        min: json['min'],
        max: json['max'],
        night: json['night'],
        eve: json['eve'],
        morn: json['morn'],
      );
}

class FeelsLike {
  final double? day, night, eve, morn;

  FeelsLike({this.day, this.night, this.eve, this.morn});

  factory FeelsLike.fromJson(Map<String, dynamic> json) => FeelsLike(
        day: json['day'],
        night: json['night'],
        eve: json['eve'],
        morn: json['morn'],
      );
}

/*
         "dt":1684951200,
         "sunrise":1684926645,
         "sunset":1684977332,
         "moonrise":1684941060,
         "moonset":1684905480,
         "moon_phase":0.16,
         "summary":"Expect a day of partly cloudy with rain",
         "temp":{
            "day":299.03,
            "min":290.69,
            "max":300.35,
            "night":291.45,
            "eve":297.51,
            "morn":292.55
         },
         "feels_like":{
            "day":299.21,
            "night":291.37,
            "eve":297.86,
            "morn":292.87
         },
         "pressure":1016,
         "humidity":59,
         "dew_point":290.48,
         "wind_speed":3.98,
         "wind_deg":76,
         "wind_gust":8.92,
         "weather":[
            {
               "id":500,
               "main":"Rain",
               "description":"light rain",
               "icon":"10d"
            }
         ],
         "clouds":92,
         "pop":0.47,
         "rain":0.15,
         "uvi":9.23
*/
