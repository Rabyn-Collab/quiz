import 'package:flutter/material.dart';
import 'package:flutter_app_ex/models/questions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    String check = 'true';
    String checks = 'false';
    final question = watch(questionProvider);
    return Scaffold(
        body:question.num < question.questions.length ?  Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/wall.webp'), fit: BoxFit.cover),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.20,),
           Expanded(
             flex: 12,
               child: Container(
                   alignment: Alignment.center,
                   child: Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 50),
                     child: Text(question.getQuestion(), style: TextStyle(color: Colors.white, fontSize: 18),),
                   ))),
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green
                  ),
                    onPressed: (){
                    context.read(questionProvider).nextQuestion();
                    context.read(questionProvider).getTotal(question.getScore());
                    question.ans.toString() == check ? question.add(Icon(Icons.check, color: Colors.green,)) : question.add(Icon(Icons.close, color: Colors.red,));
                    }, child: Text(check.characters.first.toUpperCase() + check.substring(1, check.length))),
              ),
              SizedBox(height: 20,),
              Expanded(
                flex: 2,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red
                    ),
                    onPressed: (){
                      context.read(questionProvider).nextQuestion();
                      context.read(questionProvider).getTotal(question.getScore());
                      question.ans.toString() == checks ? question.add(Icon(Icons.check, color: Colors.green,)) : question.add(Icon(Icons.close, color: Colors.red,));
                    }, child: Text(checks.characters.first.toUpperCase() + checks.substring(1, checks.length))),
              ),
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                   child: Row(
                     children: question.rowItems,
                   ),
                    ),
                  )
            ],
          ),
        ) : Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(50),
                  child: Column(
                    children: [
                      Text(question.total < 1000 ? 'Very good' : 'Excellent', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),),
                      SizedBox(height: 50,),
                      Text('Your score is : ${question.total}', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: Colors.grey)),
                    ],
                  )),
              SizedBox(height: 20,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink[300],
                  minimumSize: Size(150, 50)
                ),
                  onPressed: (){
                    context.read(questionProvider).reset();
                  },
                  child: Text('Reset')),
            ],
          ),
        ),
    );
  }

}
