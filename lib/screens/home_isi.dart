import 'package:flutter/material.dart';

class HomeIsi extends StatefulWidget {
  const HomeIsi({super.key});

  @override
  State<HomeIsi> createState() => _HomeIsiState();
}

class _HomeIsiState extends State<HomeIsi> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/images/wtmk.jpg"),
        Text("welcome to mario kart"),

        Spacer(),

        Padding(
          padding: EdgeInsets.all(16),
          child: SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: Text("boton sumamente importante :v"),
            ),
          ),
        ),
      ],
    );
  }
}
