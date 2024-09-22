import 'package:flutter/material.dart';
import 'dart:core';

class HomeScreeen extends StatefulWidget {
  const HomeScreeen({super.key});

  @override
  State<HomeScreeen> createState() => _HomeScreeenState();
}

class _HomeScreeenState extends State<HomeScreeen> {
  final TextEditingController _firstNumberTEcontroller =
      TextEditingController();
  final TextEditingController _secondNumberTEcontroller =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  double _result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sum Application',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _firstNumberTEcontroller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    hintText: 'first Number', labelText: 'first Number'),
                validator: (String? value){
                  if(value== null || value.isEmpty){
                    return 'Enter a value';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _secondNumberTEcontroller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    hintText: 'second Number', labelText: 'second Number'),
                validator: (String? value){

                  if(value?.isEmpty ?? true){
                    return 'Enter a value';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              _buildButtonBar(),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Result : ${_result.toStringAsFixed(4)}', // to define how many word limit... like 5.00 or 5.0000
                style: TextStyle(
                  fontSize: 18,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

//Widget Method Extraction********
  Widget _buildButtonBar() {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: [
        IconButton(onPressed: _onTapAddButton, icon: const Icon(Icons.add)),
        IconButton(
            onPressed: _onTapSubtractButton, icon: const Icon(Icons.remove)),
        TextButton(
            onPressed: _onTapDivideButton,
            child: const Text(
              '/',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            )),
        TextButton(
            onPressed: _onTapMultiplyButton,
            child: const Text(
              '*',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            )),
      ],
    );
  }

  void _onTapAddButton() {

    if (_formKey.currentState!.validate()) {// Get force to Enter value and give warning
      double firstNum = double.tryParse(_firstNumberTEcontroller.text) ?? 0;
      double secondNum = double.tryParse(_secondNumberTEcontroller.text) ?? 0;
      _result = firstNum + secondNum;
      setState(() {});
    }
  }

  void _onTapSubtractButton() {
    if (_formKey.currentState!.validate() == false) {
      return; // return warning
    }
    double firstNum = double.tryParse(_firstNumberTEcontroller.text) ?? 0;
    double secondNum = double.tryParse(_secondNumberTEcontroller.text) ?? 0;

    _result = firstNum - secondNum;
    setState(() {});
  }

  void _onTapDivideButton() {
    if (_formKey.currentState!.validate() == false) {
      return;
    }
    double firstNum = double.tryParse(_firstNumberTEcontroller.text) ?? 0;
    double secondNum = double.tryParse(_secondNumberTEcontroller.text) ?? 0;

    _result = firstNum / secondNum;
    setState(() {});
  }

  void _onTapMultiplyButton() {

    if (_formKey.currentState!.validate() == false) {
      return;
    }

    double firstNum = double.tryParse(_firstNumberTEcontroller.text) ?? 0;
    double secondNum = double.tryParse(_secondNumberTEcontroller.text) ?? 0;

    _result = firstNum * secondNum;
    setState(() {});
  }

  bool _validateTextField() {
    if (_firstNumberTEcontroller.text.isEmpty) {
      return false;
    }
    if (_secondNumberTEcontroller.text.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  void dispose() {
    _firstNumberTEcontroller.dispose();
    _secondNumberTEcontroller.dispose();
    super.dispose();
  }

}
