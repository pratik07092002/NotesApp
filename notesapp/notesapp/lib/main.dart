import 'package:flutter/material.dart';
import 'package:notesapp/home.dart';
import 'package:notesapp/provider/notesprovider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}



class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context)=> NotesProvider())],
    
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    )
    );
    
   
  }
}