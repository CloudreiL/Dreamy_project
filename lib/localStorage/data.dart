import 'package:flutter/material.dart';

class Notes{
  int id;
  String title;
  String content;
  final DateTime date;
  final Icon icon;

  Notes(this.id, this.title, this.content, this.date, this.icon);
}

class Emotions{
  final Icon smile_em = Icon(
      Icons.sentiment_satisfied_alt,
      color: Color.fromRGBO(134, 216, 120, 1)
  );
  final Icon sad_em = Icon(
      Icons.sentiment_dissatisfied_outlined,
      color: Color.fromRGBO(140, 248, 255, 1)
  );
  final Icon angry_em = Icon(
      Icons.sentiment_very_dissatisfied_outlined,
      color: Color.fromRGBO(255, 178, 178, 1)
  );
  final Icon veryhap_em = Icon(
      Icons.sentiment_very_satisfied_outlined,
      color: Color.fromRGBO(255, 244, 142, 1)
  );
  final Icon neutral_em = Icon(
      Icons.sentiment_neutral_outlined,
      color: Colors.white
  );

}

var noteDate = DateTime.now();

List<Notes> notes = [
  Notes(1, 'Lorem1', "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
      " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"
      " when an unknown"
      " printer took a galley of type and scrambled it to make a type specimen book",
      noteDate,
      Emotions().smile_em
  ),
  Notes(2, 'Lorem2', "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
      " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"
      " when an unknown"
      " printer took a galley of type and scrambled it to make a type specimen book",
      DateTime.now(),
      Emotions().sad_em
  ),
  Notes(3, 'Lorem3', "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
      " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"
      " when an unknown"
      " printer took a galley of type and scrambled it to make a type specimen book",
      DateTime.now(),
      Emotions().angry_em
  ),
  Notes(4, 'Lorem4', "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
      " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"
      " when an unknown"
      " printer took a galley of type and scrambled it to make a type specimen book",
      DateTime.now(),
      Emotions().veryhap_em
  ),
  Notes(5, 'Lorem5', "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
      " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"
      " when an unknown"
      " printer took a galley of type and scrambled it to make a type specimen book",
      DateTime.now(),
      Emotions().neutral_em
  ),
  Notes(6, 'Lorem6', "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
      " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"
      " when an unknown"
      " printer took a galley of type and scrambled it to make a type specimen book",
      DateTime.now(),
      Emotions().neutral_em
  ),
  Notes(7, 'Lorem7', "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
      " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"
      " when an unknown"
      " printer took a galley of type and scrambled it to make a type specimen book",
      noteDate,
      Emotions().smile_em
  ),
  Notes(8, 'Lorem8', "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
      " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"
      " when an unknown"
      " printer took a galley of type and scrambled it to make a type specimen book",
      DateTime.now(),
      Emotions().sad_em
  ),
  Notes(9, 'Lorem9', "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
      " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"
      " when an unknown"
      " printer took a galley of type and scrambled it to make a type specimen book",
      DateTime.now(),
      Emotions().angry_em
  ),
  Notes(10, 'Lorem10', "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
      " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"
      " when an unknown"
      " printer took a galley of type and scrambled it to make a type specimen book",
      DateTime.now(),
      Emotions().veryhap_em
  ),
  Notes(11, 'Lorem11', "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
      " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"
      " when an unknown"
      " printer took a galley of type and scrambled it to make a type specimen book",
      DateTime.now(),
      Emotions().neutral_em
  ),
  Notes(12, 'Lorem12', "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
      " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"
      " when an unknown"
      " printer took a galley of type and scrambled it to make a type specimen book",
      DateTime.now(),
      Emotions().neutral_em
  )
];