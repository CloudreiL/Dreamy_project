import 'package:flutter/material.dart';
import 'package:dreamy_project/classes/style.dart';

class Notes{
  int id;
  String title;
  String content;
  final DateTime date;
  final Icon icon;

  Notes(this.id, this.title, this.content, this.date, this.icon);
}


var noteDate = DateTime.now();

List<Notes> notes = [
  Notes(1, 'Lorem1', "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
      " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"
      " when an unknown"
      " printer took a galley of type and scrambled it to make a type specimen book",
      noteDate,
      Emotions().smile_em_full(size: 30)
  ),
  Notes(2, 'Lorem2', "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
      " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"
      " when an unknown"
      " printer took a galley of type and scrambled it to make a type specimen book",
      DateTime.now(),
      Emotions().sad_em_full(size: 30)
  ),
  Notes(3, 'Lorem3', "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
      " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"
      " when an unknown"
      " printer took a galley of type and scrambled it to make a type specimen book",
      DateTime.now(),
      Emotions().dead_em_full(size: 30)
  ),
  Notes(4, 'Lorem4', "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
      " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"
      " when an unknown"
      " printer took a galley of type and scrambled it to make a type specimen book",
      DateTime.now(),
      Emotions().veryhap_em_full(size: 30)
  ),
  Notes(5, 'Lorem5', "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
      " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"
      " when an unknown"
      " printer took a galley of type and scrambled it to make a type specimen book",
      DateTime.now(),
      Emotions().neutral_em_full(size: 30)
  ),
  Notes(6, 'Lorem6', "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
      " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"
      " when an unknown"
      " printer took a galley of type and scrambled it to make a type specimen book",
      DateTime.now(),
      Emotions().neutral_em_full(size: 30)
  ),
  Notes(7, 'Lorem1', "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
      " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"
      " when an unknown"
      " printer took a galley of type and scrambled it to make a type specimen book",
      noteDate,
      Emotions().smile_em_full(size: 30)
  ),
  Notes(8, 'Lorem2', "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
      " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"
      " when an unknown"
      " printer took a galley of type and scrambled it to make a type specimen book",
      DateTime.now(),
      Emotions().sad_em_full(size: 30)
  ),
  Notes(9, 'Lorem3', "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
      " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"
      " when an unknown"
      " printer took a galley of type and scrambled it to make a type specimen book",
      DateTime.now(),
      Emotions().dead_em_full(size: 30)
  ),
  Notes(10, 'Lorem4', "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
      " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"
      " when an unknown"
      " printer took a galley of type and scrambled it to make a type specimen book",
      DateTime.now(),
      Emotions().veryhap_em_full(size: 30)
  ),
];