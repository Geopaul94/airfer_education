
import 'package:flutter/material.dart';

class ContainerColorProvider extends ChangeNotifier {
  int _selectedContainerIndex = -1;

  void selectContainer(int index) {
    _selectedContainerIndex = index;
    notifyListeners();
  }

  Color getBackgroundColor(int index) {
    return _selectedContainerIndex == index ? Colors.white : Colors.black;
  }

  Color getTextColor(int index) {
    return _selectedContainerIndex == index ? Colors.black : Colors.white;
  }
}