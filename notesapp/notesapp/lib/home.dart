
import 'package:flutter/material.dart';
import 'package:notesapp/newnote.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void DisplayDialogue(){
    showDialog(context: context
    , builder: (context){
return  Dialog(child: Container(
  
  margin: EdgeInsets.only(left: 10, top: 20, right: 10, bottom: 20),
  decoration: BoxDecoration(
    color: Colors.red, 
    
    ),
  child: Column(children: [
    
    TextField(
      decoration: InputDecoration(
        labelText: "Add title",
        labelStyle: TextStyle(color: Colors.white)
        
      ),
    ),
    SizedBox(height: 28,),
    TextField(
      decoration: InputDecoration(
        hintText: "Description",
        hintStyle: TextStyle(color: Colors.white),
        border: InputBorder.none
        
        
      ),
      maxLines: 5,
    ),

  ],),),);
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: const Row(
        children: [
          Text("Notes",style: TextStyle(color: Colors.white),),
          Text("App",style: TextStyle(color: Colors.green),)
        ],
      ),),
      body: SafeArea(child: GridView.builder(
                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2
                                    ),
       itemBuilder: (context,index){
        return Container(
          margin: const EdgeInsets.all(10),
          color: Colors.amber,
        );
       },
       itemCount : 5
       
       )),
      floatingActionButton: FloatingActionButton(onPressed: (){
        DisplayDialogue();
      }),
    );
  }
}