import'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text("Event Hub"),
                backgroundColor: const Color.fromARGB(255,203,65,228),
                elevation : 10.0,
                shadowColor:Colors.red,
            ),
            body: Center(
                child: Column(
                    children: [
                        const SizedBox(
                            height: 20,
                        ),
                        const Text(
                            "Hello World",
                            style:TextStyle(fontWeight: FontWeight.bold, fontSize:50),
                        ),
                        Image.asset(
                                "images/abc.png",
                                height: 200,
                                width: 200,
                            ),
                            const SizedBox(
                                height: 20,
                            ),
                            const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [Text("Text 1"),Text("Text 2"), Text("Text 3")],

                            )
                    ],
                ),
            ));
    }
}