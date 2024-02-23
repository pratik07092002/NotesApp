
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

// ignore: non_constant_identifier_names
void DisplayDialogue(){
    showDialog(context: context
    , builder: (context){
return  Dialog(child: Container(
  
  
  padding: const EdgeInsets.all(10),
  decoration: const BoxDecoration(
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
      Title(color: Colors.white, child: const Text("Add Note" , style: TextStyle(color: Colors.green,fontSize: 25),)),
      const SizedBox(width: 125),
      IconButton(onPressed: (){
        addNote();
      }, icon: const Icon(Icons.done , color: Colors.green,size: 28,))
    ],),
    TextField(
controller: HeadingController,
      cursorColor: Colors.green,
      style: const TextStyle(color: Colors.white),
      
      // ignore: prefer_const_constructors
      decoration: InputDecoration(
        labelText:  "Add title",
        labelStyle: const TextStyle(color: Colors.white) ,
        focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)),
        enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)),
        
        
        
      ),
    ),
    
    const SizedBox(height: 28,),
    TextField(
      controller: DescriptionController,

      style: const TextStyle(color: Colors.white),
      decoration: const InputDecoration(
        hintText: "Description",
        hintStyle: TextStyle(color: Colors.white),
        border: InputBorder.none
        
        
      ),
      maxLines: 5,
      
    ),


  ],),),);
    });
    HeadingController.clear();
    DescriptionController.clear();
  }




  
  
  @override
  Widget build(BuildContext context) {
  NotesProvider notesProvider =  Provider.of<NotesProvider>(context);
    return  Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        
        backgroundColor: Colors.black45,
        iconTheme: IconThemeData(color: Colors.blueGrey),
        title: const Row(
        children: [
          Text("Notes",style: TextStyle(color: Colors.blueGrey),),
          Text("App",style: TextStyle(color: Colors.green),)
        ],
      ),),
      body: SafeArea(child: GridView.builder(

                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisExtent: 100
                                    ),
       itemBuilder: (context,index){
        notemod currentnote = notesProvider.notes[index];
        return GestureDetector(
          onLongPress: () {
            HeadingController.text = currentnote.title!;
            DescriptionController.text = currentnote.Description!;
            showBottomSheet(context: context, builder: (context){
              
        return Container(
          decoration: BoxDecoration(
            color: Colors.black
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            
            children: [
              
              ListTile(
                title: Text("Update" , style: TextStyle(color: Colors.green),), 
                onTap: () {
            notesProvider.updatelist(currentnote);
          Navigator.pop(context);
            showDialog(
              context: context,
              builder: (context) {
                return GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Dialog(
                    child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
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
                      child: const Text("UpdateNote", style: TextStyle(color: Colors.green, fontSize: 20)),
                    ),
                    IconButton(
                      onPressed: () {
                        
                        currentnote.title = HeadingController.text.trim().toString();
                            
                        
                        Provider.of<NotesProvider>(context, listen: false).updatelist(currentnote);
                        
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.done, color: Colors.green, size: 28),
                    ),
                  ],
                                ),
                                TextField(
                  controller: HeadingController,
                  cursorColor: Colors.green,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: "Add title",
                    labelStyle: TextStyle(color: Colors.white),
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)),
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)),
                  ),
                                ),
                                const SizedBox(height: 28,),
                                TextField(
                  controller: DescriptionController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: "Description",
                    hintStyle: TextStyle(color: Colors.white),
                    border: InputBorder.none,
                  ),
                  maxLines: 5,
                                ),
                              ],
                            ),
                    ),
                  ),
                );
              },
            );
          },
          
              ),
              ListTile(
                title: Text("Delete", style: TextStyle(color: Colors.green),),
                onTap: (){
                  notesProvider.deletelist(currentnote);
                  Navigator.pop(context);
                },
              )
            ],
          ),
        );
      });
          },
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueGrey),
              boxShadow: [
                BoxShadow(
                  blurRadius: 2,
                  spreadRadius: 2,
                  blurStyle: BlurStyle.outer,
                  color: Colors.blueGrey
                )
              ]
            ),
            margin: const EdgeInsets.all(10),
            
            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              
              children: [
               
                
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(currentnote.title! ,style: const TextStyle(fontSize: 28 , color: Color.fromARGB(255, 149, 176, 188)),
                   overflow: TextOverflow.ellipsis,maxLines: 2),
                ),
                const SizedBox(height: 7,),
              
                
              ],
            ),
          ),
        );
       },
       itemCount : notesProvider.notes.length
       
       )),
      floatingActionButton: FloatingActionButton(onPressed: (){
        
        
        DisplayDialogue();
      }, child:  Icon(Icons.add  ), backgroundColor: Colors.green,),  
    );
  }
}