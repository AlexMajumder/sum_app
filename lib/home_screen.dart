
import 'dart:ffi';
import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';
import 'package:flutter/material.dart';

class HomeScreeen extends StatefulWidget {
  const HomeScreeen({super.key});

  @override
  State<HomeScreeen> createState() => _HomeScreeenState();
}

class _HomeScreeenState extends State<HomeScreeen> {

  final TextEditingController _firstNumberTEcontroller = TextEditingController();
  final TextEditingController _secondNumberTEcontroller = TextEditingController();

  var _result = 0 ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sum Application',style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),body: Padding(
      padding: const EdgeInsets.all(16),
        child: Column(                          
        children: [

          TextField(
            controller: _firstNumberTEcontroller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: 'first Number',
              labelText: 'first Number'
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _secondNumberTEcontroller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                hintText: 'second Number',
                labelText: 'second Number'
            ),
          ),
          const SizedBox(height: 16),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.remove)),
            TextButton(onPressed: () {}, child: const Text('/',style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24
            ),)),
            TextButton(onPressed: () {}, child: const Text('*',style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24
            ),)),
          ],),

          const SizedBox(height: 24,),

          Text('Result : $_result',style: TextStyle(
            fontSize: 18,
          ),)




        ],
            ),
      ),
    );
  }
}
