
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interview_yatri_cabs/model/citymodel.dart';

class CityProvider with ChangeNotifier {
  cityModel? _selectedCity;

  cityModel? get selectedCity => _selectedCity;

  void selectCity(cityModel city) {
    _selectedCity = city;
    notifyListeners();
  }
}

  class DropCityProvider with ChangeNotifier {
  cityModel? _selectedCity;

  cityModel? get selectedCity => _selectedCity;

  void selectCity(cityModel city) {
  _selectedCity = city;
  notifyListeners();

  }

}

class DateProvider with ChangeNotifier {
  DateTime _selectedDate = DateTime.now();

  DateTime get selectedDate => _selectedDate;

  void updateDate(DateTime newDate){
    _selectedDate = newDate;
    notifyListeners();
  }

}

class TimeProvider with ChangeNotifier {
  TimeOfDay _selectedTime = TimeOfDay.now();

  TimeOfDay get selectedTime => _selectedTime;

  void updateTime(TimeOfDay newTime) {
    _selectedTime = newTime;
    notifyListeners();
  }
}