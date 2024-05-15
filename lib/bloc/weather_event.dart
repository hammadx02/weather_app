part of 'weather_bloc.dart';


sealed class WeatherEvent {
  @override
  List<Object> get props => [];
}

class FetchWeather extends WeatherEvent {
  final Position position;

   FetchWeather( this.position);
   @override
  List<Object> get props => [position];

}