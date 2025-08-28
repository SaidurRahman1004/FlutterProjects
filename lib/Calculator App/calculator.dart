import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'buttonFunctions.dart';
class calculator extends StatefulWidget {
  const calculator({super.key});

  @override
  State<calculator> createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {


  String _output = "1061"; // ডিসপ্লেতে দেখানোর জন্য
  String _equation = "2122 ÷ 2"; // ইনপুটের জন্য

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
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
                        _equation,
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        _output,
                        style: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
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
                  if(btn.type == "number"){
                    bgColor = Colors.grey[850]!;
                  }else if(btn.type == "operator"){
                    bgColor = Colors.orange;
                  }else{
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
                    onPressed: () {},
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
