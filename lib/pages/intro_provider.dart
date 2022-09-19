

import 'package:flutter/cupertino.dart';

class IntroProvider extends ChangeNotifier{

  PageController pageController = PageController();
  int currentPage = 0;
  List list = [];

  void onPageChanged(int index){
    currentPage = index;
    pageController.jumpToPage(index);
    notifyListeners();
  }
}