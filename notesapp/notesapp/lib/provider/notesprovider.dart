import 'package:flutter/material.dart';
import 'package:notesapp/models/notemodel.dart';

class NotesProvider with ChangeNotifier {
List<notemod> notes = [];

void addlist(notemod note)
{

notes.add(note);
notifyListeners();

}
void deletelist(notemod note){
  int indexofnote = notes.indexOf(notes.firstWhere((element) => element.id == note.id));
  notes.removeAt(indexofnote);
  notifyListeners();
}
void updatelist(notemod note){
  int indexofnote = notes.indexOf(notes.firstWhere((element) => element.id == note.id));
  notes[indexofnote] = note;
  notifyListeners();
}
}