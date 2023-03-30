import 'package:flutter/material.dart';
import 'package:otp_screen/numpad.dart';
import 'package:otp_screen/otp_screen.dart';

class PhoneScreen extends StatefulWidget {
  PhoneScreen({Key? key}) : super(key: key);

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  @override
  String phoneNumber = "";
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.close,
          color: Colors.black,
        ),
        title: Text(
          'Hello world',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(

          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Enter Phone Number',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        phoneNumber,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => OtpScreen(phoneNumber: phoneNumber,)),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 150),
                        child: Container(

                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Icon(Icons.keyboard_arrow_right,size: 50,)
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 200,
            ),
            NumPad(
              onNumberSelected: (value){
                setState(() {
                  if (value != -1){
                    phoneNumber = phoneNumber + value.toString();
                  }
                  else {
                    phoneNumber = phoneNumber.substring(0,phoneNumber.length-1);
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
