import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/data/my_data.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherLoading());
      try {
        WeatherFactory wf =
            WeatherFactory(API_KEY, language: Language.ENGLISH);
       
        Weather weather = await wf.currentWeatherByLocation(
          event.position.latitude, event.position.longitude);
        emit(WeatherSuccess(weather: weather));
      } catch (e) {
        emit(WeatherError());
      }
    });
  }
}
