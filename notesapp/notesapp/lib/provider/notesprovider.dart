import 'package:flutter/material.dart';
import 'package:notesapp/models/notemodel.dart';

class NotesProvider with ChangeNotifier {
List<notemod> notes = [];

void addlist(notemod note)
{

notes.add(note);
notifyListeners();

}
void deletelist(){}
void updatelist(){}
}