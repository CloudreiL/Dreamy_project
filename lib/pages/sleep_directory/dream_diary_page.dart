import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dreamy_project/classes/style.dart';
import 'package:intl/intl.dart';
import 'package:gradient_icon/gradient_icon.dart';
import 'package:dreamy_project/pages/sleep_directory/notes_page.dart';

class DreamDiary extends StatefulWidget{
  const DreamDiary({super.key});

  @override
  _DreamDiaryState createState() => _DreamDiaryState();

}

class Notes{
  String id;
  String title;
  String content;
  final DateTime date;
  final Icon icon;
  final String emotion;

  Notes(this.id, this.title, this.content, this.date, this.icon, this.emotion);
}

class _DreamDiaryState extends State<DreamDiary>{

  List<String> choice = ["date", "emotions"];
  bool dropdownMenu0 = false;
  String? dropdownValue0;

  List<Notes> notes = [];
  bool isLoading = true;

  final count = 2;

  @override
  void initState(){
    super.initState();
    loadNotesFromFirebase();
  }

  Future<void> loadNotesFromFirebase() async{
    User? user = FirebaseAuth.instance.currentUser;

    if(user == null){
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
          content: Text(
            "User not found",
            style: TextStyles.StyleText),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    DatabaseReference ref = FirebaseDatabase.instance
        .ref("users/${user.uid}/notes");
    final snapshot = await ref.get();

    if(snapshot.exists){
      List<Notes> loadedNotes =[];
      Map<dynamic, dynamic> notesMap = snapshot.value as Map<dynamic, dynamic>;

      notesMap.forEach((key, value){
        Icon emotionIcon = getEmotionIcon(value['emotion']);

        loadedNotes.add(
          Notes(
            key,
            value['title'],
            value['content'],
            DateTime.parse(value['timestamp']),
            emotionIcon,
            value['emotion'],
          )
        );
      });
      setState(() {
        notes = loadedNotes;
        isLoading = false;
      });

    }
  }

  Icon getEmotionIcon(String emotion) {
    switch (emotion) {
      case 'happy':
        return Emotions().smile_em_full(size: 30);
      case 'sad':
        return Emotions().sad_em_full(size: 30);
      case 'terrified':
        return Emotions().dead_em_full(size: 30);
      case 'veryhappy':
        return Emotions().veryhap_em_full(size: 30);
      case 'neutral':
        return Emotions().neutral_em_full(size: 30);
      default:
        return Emotions().neutral_em(size: 30);
    }
  }


  Widget build(BuildContext context){

    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black, Color.fromRGBO(57, 34, 99, 1)],
            )
        ),

        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text('Your Dream Diary', style: TextStyles.StyleText.copyWith(
              fontSize: 30,
            )),
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,

          ),
          body: Stack(
            children: [
              Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.01,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: Text(
                            "Sort by",
                            style: TextStyles.StyleText,
                          ),
                        ),

                        Container(
                          width: 160,
                          decoration: ContainerDecor.DownMenuBox,
                          child: DropdownMenu(
                            width: 160,
                            dropdownMenuEntries: choice
                                .map<DropdownMenuEntry<String>>((String value) {
                              return DropdownMenuEntry<String>(
                                  value: value, label: value);
                            }).toList(),
                            textStyle: TextStyles.StyleText.copyWith(
                                color: Colors.white, fontSize: 17),
                            textAlign: TextAlign.center,
                            trailingIcon: Icon(Icons.arrow_drop_down_rounded,color: Colors.white,),
                            selectedTrailingIcon: Icon(Icons.arrow_drop_up_rounded,color: Colors.white,),
                            inputDecorationTheme: DropDownMenuDec.MenuDec,
                            initialSelection: dropdownValue0,
                            onSelected: (String? newValue0) {
                              setState(() {
                                dropdownValue0 = newValue0;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    isLoading
                        ? Center(child: CircularProgressIndicator())
                        : notes.isEmpty
                        ? Center(
                      child: Text(
                        'No notes available',
                        style: TextStyles.StyleText,
                      ),
                    )
                        : Expanded(
                      child: RefreshIndicator(
                        onRefresh: loadNotesFromFirebase,
                        child: GridView.builder(
                          itemCount: notes.length,
                          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 250,
                              childAspectRatio: MediaQuery.of(context).size.width * 0.0021,
                              crossAxisSpacing: MediaQuery.of(context).size.width * 0.07,
                              mainAxisSpacing: 3),
                          itemBuilder: (context, index){
                            return Wrap(
                              children: [
                                InkWell(
                                  onTap: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => NotesPage(
                                            noteID: notes[index].id,
                                            title: notes[index].title,
                                            content: notes[index].content,
                                            emotion: notes[index].emotion
                                          )
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: 200,
                                    decoration: ContainerDecor.ContainerDec.copyWith(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Color.fromRGBO(103, 58, 183, 1),
                                          Color.fromRGBO(195, 66, 218, 1)
                                        ],
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children:[
                                              Padding(
                                                padding: const EdgeInsets.only(left: 3.0, top: 3),
                                                child: Text(notes[index].title, style: TextStyles.StyleText),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(right: 3.0, top: 3),
                                                child: notes[index].icon ,
                                              )
                                            ]
                                        ),
                                        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 3.0),
                                          child: Text(notes[index].content, style: TextStyles.StyleText.copyWith(fontSize: 15),
                                              overflow: TextOverflow.ellipsis, maxLines: 5),
                                        ),
                                        Spacer(),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            SizedBox(height: MediaQuery.of(context).size.height * 0.06,),
                                            Padding(
                                              padding: const EdgeInsets.only(right:3.0),
                                              child: Text(DateFormat('yyyy-MM-dd').format(notes[index].date),
                                                  style: TextStyles.StyleText.copyWith(fontSize: 15)),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ]),
              Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        spreadRadius: 1,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: IconButton(
                    padding: EdgeInsets.only(left: 1, bottom: 13),
                    icon: GradientIcon(
                      icon: Icons.add,
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(195, 66, 218, 1),
                          Color.fromRGBO(103, 58, 183, 1)
                        ],
                      ),
                      size: 40,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NotesPage())
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
