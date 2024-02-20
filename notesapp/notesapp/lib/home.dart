import 'package:flutter/material.dart';
import 'package:notesapp/models/notemodel.dart';
import 'package:notesapp/provider/notesprovider.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
//import 'package:notesapp/addnote.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
TextEditingController HeadingNote = TextEditingController();
TextEditingController ContentNote = TextEditingController();

void DisplayDialogue(){
  showDialog(context: context, builder: (context){
  //  FloatingActionButton(onPressed: (){}, child: Icon(Icons.check),);
    return AlertDialog(
      backgroundColor: Colors.black
      
      ,
      
      title: Text("Add Note", style: TextStyle(color: Colors.blue , ),),
      
      content: Column(
        
        children: [
          TextField(
            controller: HeadingNote,
  style: TextStyle(color: Colors.blue, fontStyle: FontStyle.italic, fontSize: 30),
  cursorColor: Colors.blue,
  autofocus: true,
  decoration: InputDecoration(
    labelText: "Heading",
    labelStyle : TextStyle(color: Colors.blue , fontStyle: FontStyle.normal),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.green)
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.green)
    )
   
    
  ),
),

          SizedBox(height: 10,),
          
            
             
              TextField(
                controller: ContentNote,
  keyboardType: TextInputType.multiline,
  maxLines: 6,
  style: TextStyle(color: Colors.blue),
  decoration: InputDecoration(
    hintText: "Description",
    hintStyle: TextStyle(color: Colors.blue),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.green, width: 2), 
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.green, width: 2), 
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  ),
),
SizedBox(height: 5,),
    FloatingActionButton(onPressed: (){
      ListMaker();
      setState(() {
        
      });
      Navigator.pop(context);
    }, child: Icon(Icons.check),)       
          
        ],
      ),
    
    
    );
    
  });
  
}
void ListMaker(){
notemod Newnote = notemod(
  id: Uuid().v1(),
  userId: "Pratik@gmail.com",
  name: "Pratik",
  title: HeadingNote.text,
  Description: ContentNote.text,
  CreatedOn:DateTime.now()
);
Provider.of<NotesProvider>(context ,listen: false).addlist(Newnote);
}

  @override
  Widget build(BuildContext context) {
    NotesProvider notespro = Provider.of<NotesProvider>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Notes App", style: TextStyle(color: Colors.green),),
      ),
      body: SafeArea
      
      (
        
        child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
      itemBuilder: (BuildContext context, int index) { 
        notemod currentnote = notespro.notes[index];
        return GestureDetector(
          onTap: (){

            BoxDecoration(
              color: Colors.blueGrey[900],
              border: Border.all(color: Colors.blue ,width: 3 , style: BorderStyle.solid)
            );
          },
          onLongPress: (){
           
           showDialog(context: context, builder: (context){
          
            return AlertDialog(
              alignment: Alignment.bottomCenter,
              
              backgroundColor: Colors.black,
              content: Column(
              
                
                mainAxisSize:MainAxisSize.min,

                children: [
                  ListTile(title: Text("Details", style: TextStyle(color: Colors.green),),trailing: Icon(Icons.info),iconColor: Colors.green, ),
                  ListTile(title: Text("Delete", style: TextStyle(color: Colors.green),),trailing: Icon(Icons.delete),iconColor: Colors.green,)

                ],
              ),
            );
           });
          
          
           
          },
          
          child: Container(
            child: Column(
          
              children: [
              Text(currentnote.title! , style: TextStyle( 
                
                
                color: Colors.blue[500],fontSize: 28 ,
                 fontWeight: FontWeight.w900 ,
                  fontStyle: FontStyle.italic),
                  maxLines: 1, overflow: TextOverflow.ellipsis,
                  ),
              SizedBox(height: 3,),
              Text(currentnote.Description! ,
               style: TextStyle(color: Colors.blue[300] ,fontSize: 16,
               
                fontStyle: FontStyle.normal ), maxLines: 3, overflow: TextOverflow.ellipsis,),
          
              ],
            ),
            margin: EdgeInsets.all(3),
            
            decoration: BoxDecoration(
              color: Colors.blueGrey[900],
              border: Border.all(color: Colors.green ,width: 3 , style: BorderStyle.solid)
            ),
          ),
        );   },
        itemCount: notespro.notes.length,
        )),
       floatingActionButton: FloatingActionButton(onPressed: (){
        return DisplayDialogue();
       }, child: Icon(Icons.add), backgroundColor: Colors.green,),
    );
  }
}