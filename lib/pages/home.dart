import 'package:flutter/material.dart';
import 'package:learn/utils/routes.dart';
import 'package:learn/widgets/drawer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isImageClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(38.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _isImageClicked = !_isImageClicked;
                });
                Future.delayed(const Duration(milliseconds: 300), () {
                  Navigator.pushNamed(context, AllRoutes.atozRoute);
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                height: _isImageClicked ? 300 : 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: Colors.black, width: 2), 
                  boxShadow: [
                    BoxShadow(
                      color:
                          Colors.black.withOpacity(0.2), 
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3), 
                    ),
                  ],
                  image: const DecorationImage(
                    image: AssetImage('assets/images/alphabets.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'ALPHABETS',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text("Learn A to Z with pronunciation and an example"),
          ],
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}