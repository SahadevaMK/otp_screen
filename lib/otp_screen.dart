import 'package:flutter/material.dart';
import 'phoneScreen.dart';
import 'numpad.dart';
class OtpScreen extends StatefulWidget {
  final String phoneNumber;
   OtpScreen({Key? key,  required this.phoneNumber}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String code = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
            'OTP SCREEN',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 35,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      child: Text(
                        // use your keyword
                        "Code is sent  ${widget.phoneNumber}",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          OtpTextFieldBox(code.isNotEmpty ? code.substring(0,1) : " "),
                          OtpTextFieldBox(code.length > 1 ? code.substring(1,2) : " "),
                          OtpTextFieldBox(code.length > 2 ? code.substring(2,3) : " "),
                          OtpTextFieldBox(code.length > 3 ? code.substring(3,4) : " " ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            NumPad(
              onNumberSelected: (value){
                print(value);
                setState(() {
                  if (value != -1){
                    if (code.length < 4){
                      code = code + value.toString();
                      if (code.length == 4){
                        showDialog(context: context, builder: (context)=>AlertDialog(
                          title: Text('Done '),
                          actions: [
                            TextButton(
                              onPressed: ()=>Navigator.pop(context),
                              child: Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: ()=>Navigator.pop(context),
                              child: Text('OK'),
                            ),
                          ],
                        ),);
                      }
                    }
                  }
                  else{
                    code = code.substring(0, code.length - 1);

                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
  Widget OtpTextFieldBox(String codeNum){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        width: 60,
        height: 60,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 25.0,
                  spreadRadius: 1,
                  offset: Offset(0.0, 0.75)
              )
            ],
          ),
          child: Center(
            child: Text(
              codeNum,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
