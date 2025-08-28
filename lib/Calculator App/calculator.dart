import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class calculator extends StatefulWidget {
  const calculator({super.key});

  @override
  State<calculator> createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {

  final List<String> calculatorButtons = [
    'C', '()', '%', '/',
    '7', '8', '9', 'x',
    '4', '5', '6', '-',
    '1', '2', '3', '+',
    '0', '.', '<', '=',
  ];

  String _output = "0"; // ডিসপ্লেতে দেখানোর জন্য
  String _equation = "0"; // ইনপুটের জন্য

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey, // একটি থিম কালার সেট করতে পারেন
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
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(_output,                style: const TextStyle(
                          fontSize: 48.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),),
                        SizedBox(height: 10,),
                        Text(_equation,                style: const TextStyle(
                          fontSize: 48.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),),
                      ],
                    ),
                  ),

                ),
            ),
            const Divider(height: 1),
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
                  itemBuilder: (context,index){

                    return TextButton(
                        onPressed: (){},
                        child: Text(calculatorButtons[index],              style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w300,
                        ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,),
                      );


                  },
                ),
            )
          ],
        ),

      ),
    );
  }
}
