import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class Questions{
  final String questions;
  final bool answers;
  final int scores;
  Questions({@required this.answers,@required this.questions, @required this.scores});
}

final questionProvider = ChangeNotifierProvider((ref) => Question());
class Question with ChangeNotifier{

  int num = 0;
  List<Questions> get questions {
    return [..._questions];
  }

  List<Widget>   _rowItems = [];
  List<Widget> get rowItems {
    return [..._rowItems];
}
  void add(Widget widget){
    _rowItems.add(widget);
    notifyListeners();
  }


 List<Questions> _questions = [
 Questions(answers: true, questions: 'The unicorn is the national animal of Scotland.', scores: 100),
 Questions(answers: false, questions: 'There are two parts of the body that can\'t heal themselves.', scores: 200),
 Questions(answers: true, questions: 'Gin is typically included in a Long Island Iced Tea.', scores: 500),
 Questions(answers: false, questions: 'There are five different blood groups .', scores: 200),
 Questions(answers: false, questions: 'Cinderella was the first Disney princess .', scores: 100),
 Questions(answers: true, questions: 'Bananas are curved because they grow upwards towards the sun.', scores: 800),
 Questions(answers: false, questions: 'Ariana Grande is 25 or under.', scores: 200),
 Questions(answers: true, questions: 'Venus is the hottest planet in the solar system', scores: 900),
 ];



 String getQuestion(){
   return _questions[num].questions;
 }

  bool getAnswer(){
    return _questions[num].answers;
  }

int getScore(){
   return _questions[num].scores;
}

void nextQuestion(){
   num++;
   notifyListeners();
}


bool get ans{
   if(_questions[num- 1].answers == true ){
     return true;
   }else{
     return false;
   }
}


  void reset(){
   num = 0;
   _rowItems = [];
    notifyListeners();
  }


  int total = 0;

  void getTotal(int score, String check){

    if(_questions[num- 1].answers.toString() == check ){
      total += score;
    }else{
      total -= score;
    }
   notifyListeners();

  }

}