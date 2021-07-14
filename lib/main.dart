import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Calculator_button.dart';

void main() => runApp(Calculator());



class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}
class _CalculatorState extends State<Calculator> {
  int firstNum = 0;
  int secondNum = 0;
  String history = '0';
  String res = '';
  String display = '';
  String opr = '';
  //function for logic of calc

  void buttonOnClick(String buttonVal){
    if(buttonVal == 'C'){
      res = '';
      display = '';
      //firstNum = 0;
      secondNum = 0;
      //history = '';
    }else if(buttonVal == 'AC'){
      res = '';
      display = '';
      firstNum = 0;
      secondNum = 0;
      history = '';

    }else if(buttonVal == '<'){
          res = display.substring(0,display.length-1);
    }else if(buttonVal == '+/-'){
        if(display[0] != '-')
          res = '-' + display;
        else
          res = display.substring(1);

    } else if(buttonVal == '+' || buttonVal == '-' || buttonVal == 'X' || buttonVal == '/'){


      firstNum = int.parse(display);
      res = '';
      opr = buttonVal;
      history = firstNum.toString() + buttonVal;



    }else if(buttonVal == '=') {
      secondNum = int.parse(display);
      if(opr == '+') {
        res = (firstNum + secondNum).toString();
        history = firstNum.toString() + opr + secondNum.toString();
      }else if(opr == '-') {
        res = (firstNum - secondNum).toString();
        history = firstNum.toString() + opr + secondNum.toString();
      }else if(opr == 'X') {
        res = (firstNum * secondNum).toString();
        history = firstNum.toString() + opr + secondNum.toString();
      }else if(opr == '/') {
        res = (firstNum / secondNum).toString();
        history = firstNum.toString() + opr + secondNum.toString();
      }
    }else{
        res = (display + buttonVal);
      }
      setState(() {
        display = res;
      });










  }//end of function


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: Center(
                child: Text('Calculator')),
            backgroundColor: Colors.teal,
          ) ,
          body: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
               children: <Widget>[
                 Container(
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Text(history ,
                     textAlign: TextAlign.end,
                     style: TextStyle(
                       fontSize: 30.0,
                       color: Colors.teal[500],
                     ) ,
                     ),
                   ),
                   alignment: Alignment.centerRight,
                 ),
                 Container(
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Text(display,
                       style: TextStyle(
                           fontSize: 60.0,
                           color: Colors.white,
                       ) ,
                     ),
                   ),
                     alignment: Alignment.centerRight,
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalcButton(text:'AC',buttonColor: Colors.orangeAccent, textColor: Colors.black , callback: buttonOnClick,),
                      CalcButton(text:'C',buttonColor: Colors.yellowAccent, textColor: Colors.black, callback: buttonOnClick),
                      CalcButton(text:'<',buttonColor: Colors.yellowAccent, textColor: Colors.black, callback: buttonOnClick),
                      CalcButton(text:'/',buttonColor: Colors.yellowAccent, textColor: Colors.black, callback: buttonOnClick)

                   ],
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [

                     CalcButton(text:'9',buttonColor: Colors.blue[100], textColor: Colors.black, callback: buttonOnClick),
                     CalcButton(text:'8',buttonColor: Colors.blue[100], textColor: Colors.black, callback: buttonOnClick),
                     CalcButton(text:'7',buttonColor: Colors.blue[100], textColor: Colors.black, callback: buttonOnClick),
                     CalcButton(text:'X',buttonColor: Colors.yellowAccent, textColor: Colors.black, callback: buttonOnClick)
                   ],
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [

                     CalcButton(text:'6',buttonColor: Colors.blue[100], textColor: Colors.black, callback: buttonOnClick),
                     CalcButton(text:'5',buttonColor: Colors.blue[100], textColor: Colors.black, callback: buttonOnClick),
                     CalcButton(text:'4',buttonColor: Colors.blue[100], textColor: Colors.black, callback: buttonOnClick),
                     CalcButton(text:'-',buttonColor: Colors.yellowAccent, textColor: Colors.black, callback: buttonOnClick)
                   ],
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [

                     CalcButton(text:'3',buttonColor: Colors.blue[100], textColor: Colors.black, callback: buttonOnClick),
                     CalcButton(text:'2',buttonColor: Colors.blue[100], textColor: Colors.black, callback: buttonOnClick),
                     CalcButton(text:'1',buttonColor: Colors.blue[100], textColor: Colors.black, callback: buttonOnClick),
                     CalcButton(text:'+',buttonColor: Colors.yellowAccent, textColor: Colors.black, callback: buttonOnClick)
                   ],
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [

                     CalcButton(text:'+/-',buttonColor: Colors.blue[100], textColor: Colors.black, callback: buttonOnClick),
                     CalcButton(text:'0',buttonColor: Colors.blue[100], textColor: Colors.black, callback: buttonOnClick),
                     CalcButton(text:'00',buttonColor: Colors.blue[100], textColor: Colors.black, callback: buttonOnClick),
                     CalcButton(text:'=',buttonColor: Colors.greenAccent, textColor: Colors.black, callback: buttonOnClick)
                   ],
                 ),
               ] ,
             ),
          ),
       )
        );
  }
}

//Logic




