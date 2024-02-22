
//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:notesapp/models/notemodel.dart';
import 'package:notesapp/provider/notesprovider.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
//import 'package:intl/intl.dart';
//import 'package:notesapp/newnote.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool isUpdate;
  TextEditingController HeadingController = TextEditingController();
  TextEditingController DescriptionController = TextEditingController();
void addNote(){

    notemod newnote = notemod(
      CreatedOn: DateTime.now(),
       Description: DescriptionController.text.trim().toString(), 
       id: Uuid().v1() ,
        name: "Pratik" ,
         title: HeadingController.text.trim().toString() , 
         userId: "Pratik.pdg7@gmail.com" );
        Provider.of<NotesProvider>(context, listen: false).addlist(newnote);
        Navigator.pop(context);
  }

void DisplayDialogue(){
    showDialog(context: context
    , builder: (context){
return  Dialog(child: Container(
  
  
  padding: EdgeInsets.all(10),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    color: Colors.black, 
    boxShadow: [
      BoxShadow(blurStyle: BlurStyle.inner , blurRadius: 5, spreadRadius: 10 , color: Colors.grey)
    ]
    ),
  child: Column(
    
    children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      
      children: [
      Title(color: Colors.white, child: Text("Add Note" , style: TextStyle(color: Colors.green,fontSize: 25),)),
      SizedBox(width: 125),
      IconButton(onPressed: (){
        addNote();
      }, icon: Icon(Icons.done , color: Colors.green,size: 28,))
    ],),
    TextField(
controller: HeadingController,
      cursorColor: Colors.green,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: "Add title",
        labelStyle: TextStyle(color: Colors.white) ,
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)),
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)),
        
        
        
      ),
    ),
    SizedBox(height: 28,),
    TextField(
      controller: DescriptionController,
      style: TextStyle(color: Colors.white),
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
  NotesProvider notesProvider =  Provider.of<NotesProvider>(context);
    return  Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: const Row(
        children: [
          Text("Notes",style: TextStyle(color: Colors.blueGrey),),
          Text("App",style: TextStyle(color: Colors.green),)
        ],
      ),),
      body: SafeArea(child: GridView.builder(

                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisExtent: 150
                                    ),
       itemBuilder: (context,index){
        notemod currentnote = notesProvider.notes[index];
        return GestureDetector(
          onLongPress: () {
            HeadingController.text = currentnote.title!;
            DescriptionController.text = currentnote.Description!;
            showBottomSheet(context: context, builder: (context){
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text("Update"), 
                onTap: () {
  notesProvider.updatelist(currentnote);

  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.black,
            boxShadow: [
              BoxShadow(blurStyle: BlurStyle.inner, blurRadius: 5, spreadRadius: 10, color: Colors.grey),
            ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Title(
                    color: Colors.white,
                    child: Text("UpdateNote", style: TextStyle(color: Colors.green, fontSize: 20)),
                  ),
                  IconButton(
                    onPressed: () {
                      // Update the title in the currentnote with the new value
                      currentnote.title = HeadingController.text.trim().toString();

                      // Update the note in the provider
                      Provider.of<NotesProvider>(context, listen: false).updatelist(currentnote);
                      
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.done, color: Colors.green, size: 28),
                  ),
                ],
              ),
              TextField(
                controller: HeadingController,
                cursorColor: Colors.green,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: "Add title",
                  labelStyle: TextStyle(color: Colors.white),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)),
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)),
                ),
              ),
              SizedBox(height: 28,),
              TextField(
                controller: DescriptionController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Description",
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                ),
                maxLines: 5,
              ),
            ],
          ),
        ),
      );
    },
  );
},

              ),
              ListTile(
                title: Text("Delete"),
                onTap: (){
                  notesProvider.deletelist(currentnote);
                },
              )
            ],
          ),
        );
      });
          },
          child: Container(
            height: 300,
            
            child: Column(
              children: [
                
                
                Text(currentnote.title! ,style: TextStyle(fontSize: 28 , color: Colors.white), overflow: TextOverflow.ellipsis,maxLines: 2,),
                SizedBox(height: 7,),
              
                
              ],
            ),
            margin: const EdgeInsets.all(10),
            color: Colors.blueGrey,
          ),
        );
       },
       itemCount : notesProvider.notes.length
       
       )),
      floatingActionButton: FloatingActionButton(onPressed: (){
        DisplayDialogue();
      }, child: Icon(Icons.add),),
    );
  }
}