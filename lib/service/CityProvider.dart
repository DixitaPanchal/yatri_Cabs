
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interview_yatri_cabs/model/citymodel.dart';

class CityProvider with ChangeNotifier {
  cityModel? _selectedCity;

  cityModel? get selectedCity => _selectedCity;

  void selectCity(cityModel city) {

    if(_selectedCity!= city) {
      _selectedCity = city;
      notifyListeners();
    }
  }
}

  class DropCityProvider with ChangeNotifier {
  cityModel? _selectedCity;

  cityModel? get selectedCity => _selectedCity;

  void selectCity(cityModel city) {
    if(_selectedCity!= city) {
      _selectedCity = city;
      notifyListeners();
    }

  }

}

class DateProvider with ChangeNotifier {
  DateTime _selectedDate = DateTime.now();

  DateTime get selectedDate => _selectedDate;

  void updateDate(DateTime newDate){
    if(_selectedDate!= newDate) {
      _selectedDate = newDate;
      notifyListeners();
    }
  }

}

class TimeProvider with ChangeNotifier {
  TimeOfDay _selectedTime = TimeOfDay.now();

  TimeOfDay get selectedTime => _selectedTime;

  void updateTime(TimeOfDay newTime) {
    if(_selectedTime!= newTime) {
      _selectedTime = newTime;
      notifyListeners();
    }
  }
}

class TextFieldState with ChangeNotifier {
  String _textField1 = '';
  String _textField2 = '';

  String get textField1 => _textField1;
  String get textField2 => _textField2;

  void updateText1(String newText){
    _textField1 = newText;
    notifyListeners();
  }

  void updateText2(String newText) {
    _textField2 = newText;
    notifyListeners();
  }
}
