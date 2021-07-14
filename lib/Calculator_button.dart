import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final String? text;
  final Color? textColor;
  final Color?buttonColor;
  final Function callback;
  const CalcButton({
    this.text,
    this.textColor,
    this.buttonColor,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: SizedBox(
        width: 70,
        height: 68,
        child: ElevatedButton(
          onPressed: () => callback(text),
          child: Text('$text' ,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
              fontSize: 28.0,

            ),
          ),

          style: ElevatedButton.styleFrom(
              elevation: 10.0,
              primary: buttonColor,
              onPrimary: Colors.black,
              padding: EdgeInsets.all(0.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)
              )
          ),

        ),
      ),
    );
  }
}
