import 'package:flutter/material.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key});

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(child: Column(
        
        children: [
          SizedBox(height: 10,),
          Container(
            color: Colors.amber[400],
            
            child: TextField(
              
              style: TextStyle(fontSize: 35)
              ,
              decoration: InputDecoration(
                labelText: "Title",
               
              ),
            ),
          ),
          SizedBox(height: 20,),
          Container(
            color: Colors.red,
            height: 150,
            
            child: TextField(
              maxLines: null,
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                labelText: "Description",
                // border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))
                border: InputBorder.none
                 
                 ),
            ),
          )
        ],
      )),
    );
  }
}