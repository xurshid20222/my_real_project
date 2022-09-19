
import 'package:flutter/material.dart';

class IntroView extends StatelessWidget {
  final String image;
  final String title;
  final String content;

  const IntroView({Key? key, required this.image, required this.title, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.bottomCenter,
      height: 551.74,
      width: 255.56,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(20),
      decoration:  BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image,),
          fit: BoxFit.contain,
        ),
      ),
      child: Container(
        alignment: Alignment.center,
        height: 270,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: (
              [
                BoxShadow(color: Colors.white,
                    offset: Offset(0, 0),
                    blurRadius: 30,
                    spreadRadius: 40
                )
              ]
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),),
            const SizedBox(height: 10,),
            Text(content, style: const TextStyle(color: Colors.grey, fontSize: 14),),
          ],
        ),
      ),
    );
  }
}
