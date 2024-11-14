import 'package:adstack/common/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 191, 189, 189),
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        title: SizedBox(
            height: 36,
            width: 290,
            child: ReusableTextFormField(
              controller: _searchcontroller,
              labelText: 'Search',
              labelTextColor: Colors.white,
              suffix: Icon(
                Icons.search,
                color: Colors.white,
              ),
            )),
        actions: [
          Stack(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_outlined,
                    size: 30,
                  )),
              Positioned(
                  right: 15,
                  top: 14,
                  child: Container(
                    height: 6,
                    width: 6,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.amber),
                  ))
            ],
          )
        ],
      ),
      body: Column(
        
      )
    );
  }
}
