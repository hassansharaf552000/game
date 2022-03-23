import 'package:flutter/material.dart';
import 'dart:math';
void main(List<String> args){
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      )
  );
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String result = "";
  String image = "images/pattern.png";

  List<String> images  = [
    "images/paper.png",
    "images/stone.png",
    "images/scissors.png"
  ];

  void _play(int value){
    result = "";

    setState(() {
      int randomic = Random().nextInt(3);
      String choice = images[randomic];
      image = choice;
      print("${randomic == value}");
      if(randomic == 1 && value == 1){
        result = "Equal!";
      }
      if(randomic == 0 && value == 1){
        result = "Loser!";
      }if(randomic == 2 && value == 1){
        result = "winner!";
      }

      if(randomic == 0 && value == 2){
        result = "winner!";
      }else if(randomic == 1 && value == 2){
        result = "Loser!";
      }else if(randomic ==2 && value == 2){
        result = "Equal!";
      }

      if(randomic == 0 && value == 3){
        result = "Equal!";
      }else if(randomic == 1 && value == 3){
        result = "winner!";
      }else if(randomic == 2 && value == 3){
        result = "Loser!";
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: Text("Hassan "),
        backgroundColor: Colors.indigo,
      ),
      body: Center(


        child: Container(
          padding: EdgeInsets.only(top:32, bottom: 16),
          child: Column(
            children: <Widget>[
              Text(
                "stone paper scissors",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.indigo),
              ),

              Image.asset(image),
              Text("\n $result \n",style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),),

              Center(
                child: Text(
                  "Choose one of the options below:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.indigo),
                ),
              ),
              Text("\n"),

              Row(

                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: (){
                      _play(1);
                    },
                    child:Image.asset("images/stone.png", height: 95,),
                  ),

                  GestureDetector(
                    onTap: (){
                      _play(2);
                    },
                    child: Image.asset("images/scissors.png", height: 95),
                  ),

                  GestureDetector(
                    onTap: (){
                      _play(3);
                    },
                    child: Image.asset("images/paper.png", height: 95),
                  )
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}