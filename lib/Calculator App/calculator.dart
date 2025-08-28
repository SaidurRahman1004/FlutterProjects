import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'buttonFunctions.dart';

class calculator extends StatefulWidget {
  const calculator({super.key});

  @override
  State<calculator> createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {
  String _output = "0"; //just Result
  String _equation = "0"; //input

  void _buttonClickResult(String btnValue){
    setState(() {
      if(btnValue == "AC"){
        _output = "0";
        _equation = "0";
      }
      else if(btnValue == "⌫"){
        _equation = _equation.length > 1 ? _equation.substring(0, _equation.length-1) : "0";
      }
      else if(btnValue == "="){
        try{
          Parser p = Parser();
          Expression exp = p.parse(_equation.replaceAll('×', '*').replaceAll('÷', '/'));
          ContextModel cm = ContextModel();
          _output = exp.evaluate(EvaluationType.REAL, cm).toString();
        } catch(e){
          _output = "Error";
        }
      }
      else{
        if(_equation == "0"){_equation = btnValue;}
        else{_equation += btnValue;}
      }
    });
 }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black),
      title: "Calculator",
      home: Scaffold(
        appBar: AppBar(
          leading: FlutterLogo(),
          title: Text("Calculator"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        _output,
                        style: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        _equation,
                        style: const TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: calculatorButtons.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1.2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  final btn = calculatorButtons[index];
                  Color bgColor;
                  Color txtColor = Colors.white;
                  if (btn.type == "number") {
                    bgColor = Colors.grey[850]!;
                  } else if (btn.type == "operator") {
                    bgColor = Colors.orange;
                  } else {
                    bgColor = Colors.grey;
                    txtColor = Colors.black;
                  }

                  return TextButton(
                    style: TextButton.styleFrom(
                      shape: CircleBorder(),
                      backgroundColor: bgColor,
                      padding: EdgeInsets.all(20),
                      elevation: 4,
                    ),
                    onPressed: () {
                      _buttonClickResult(calculatorButtons[index].label);
                    },
                    child: Text(
                      calculatorButtons[index].label,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: txtColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
