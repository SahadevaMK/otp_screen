import 'package:flutter/material.dart';
class NumPad extends StatelessWidget {
  final Function(int) onNumberSelected;
   NumPad({Key? key, required this.onNumberSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Numbers(1),
                Numbers(2),
                Numbers(3),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Numbers(4),
                Numbers(5),
                Numbers(6),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Numbers(7),
                Numbers(8),
                Numbers(9),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlankSpace(),
                Numbers(0),
                Backspace(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget Numbers(int num) {
    return Expanded(
      child: GestureDetector(
        onTap: (){
          onNumberSelected(num);
        },
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  num.toString(),
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget BlankSpace() {
    return Expanded(


      child: GestureDetector(
        onTap: (){},
        child: Container(),
      ),
    );
  }

  Widget Backspace() {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onNumberSelected(-1);

        },
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Center(
              child: Icon(
                Icons.backspace,
                size: 28,
                color: Color(0xFF1F1F1F),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
