import 'package:flutter/material.dart';
import 'package:itpair20231/screens/home.dart';
import 'package:itpair20231/widgets/card.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
  Size screenSize = MediaQuery.of(context).size;

    return Container(
        width: screenSize.width,
        height: screenSize.height,
        decoration: BoxDecoration(color: Color.fromARGB(255, 48, 50, 154),),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          
          children: [
            Container(
              height: screenSize.height*.35,
              width: screenSize.width*.6,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage("/images/UniversitySealWhite.png"),
                      fit: BoxFit.cover),
                ),
              ),
          Container(
            child: TextButton(onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
            child: Container(
              // width: screenSize.width*.4,
              padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
              decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20)
                
                )
                ),
              child: Text('Login')
              ),
            ),
          )
        ]),
    );
  }
}