import 'dart:ui';

import 'package:flutter/material.dart';

import 'cards.dart';
import 'cardsBuilder.dart';

 void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      scrollBehavior: MyCustomScrollBehavior(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Cards>> cards;
  Future<List<Cards>> _dataInit() async {
    setState(() {
      cards = CardsBuilder.instance.readJson();
    });
    return cards;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder<List<Cards>>(
            future: _dataInit(),
            builder: (BuildContext context,
                AsyncSnapshot<List<Cards>> snapshot) {
              if (!snapshot.hasData) {
                return const Card(child: Text('loading...'));
              }
                return ListView(
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  children: snapshot.data!.map((cards) {
                    return SizedBox(
                                child: Card(
                                    child: Text(cards.name.toString() +'\n\n' + cards.meaning_rev.toString()
                                    , style: const TextStyle(fontSize: 18)
                                    , textAlign: TextAlign.left
                                   )
                                )
                                    ,width: 300,
                    );
                  }).toList(),
                );
              } )
            ),
      );
  }
}
