import 'package:flutter/material.dart';
import 'package:flutter_app_ex/models/questions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class Result extends StatelessWidget {
  final Question question;
  Result(this.question);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
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
              Consumer(
                builder: (context, watch, child) => ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.pink[300],
                        minimumSize: Size(150, 50)
                    ),
                    onPressed: (){
                      context.read(questionProvider).reset();
                    },
                    child: Text('Reset')),
              ),
            ],
          ),
        ),
    );
  }
}
