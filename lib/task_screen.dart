
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
      itemCount: 5,
    itemBuilder: (BuildContext context, int index) {
    return ListTile(
    leading: const Icon(Icons.list),
    trailing: const Text(
    "GFG",
    style: TextStyle(color: Colors.green, fontSize: 15),
    ),
      ),
    
  }
}
