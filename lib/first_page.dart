import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pixabay/pixabay_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://tubuya.co/wp-content/uploads/2019/12/3C250D51-10D0-492E-BE4D-7FBF076B5519.jpeg'),
            fit: BoxFit.cover,
        )),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 176),
                child: Text(
                  'ふぉとなげっと',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent
                    ),
                  ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size.fromHeight(56),
                ),
                onPressed: (){
                  //ボタンを押したときの挙動
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => PixabayPage()),
                    (_) => false
                  );
                },
                child: const Text(
                  'Start',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                  
                  ),
               ),
            ],
          ),
          ),
      ),
    );
  }
}