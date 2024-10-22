import 'package:dreamy_project/pages/sleep_directory//dream_diary_page.dart';
import 'package:flutter/material.dart';
import 'package:dreamy_project/classes/style.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class NotesPage extends StatefulWidget{

  final String? noteID;
  final String? title;
  final String? content;
  final String? emotion;

  const NotesPage({super.key,this.noteID, this.title, this.content, this.emotion});

  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage>{

  bool isHappy = false;
  bool isSad = false;
  bool isTerr = false;
  bool isVeryHap = false;
  bool isNeut = false;

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  ScrollController _scrollController = ScrollController();

  void _selectedEmo(String emotion){
    isHappy = (emotion == 'happy');
    isSad = (emotion == 'sad');
    isTerr = (emotion == 'terrified');
    isVeryHap = (emotion == 'veryhappy');
    isNeut = (emotion == 'neutral');
  }

  Future<void> _saveNote() async{
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
          content: Text(
            "User cannot be found",
            style: TextStyles.StyleText),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    String title = titleController.text.trim();
    String content = contentController.text.trim();
    String emotion = _getSelectedEmotion();

    if(title.isEmpty || content.isEmpty || emotion.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Title, content or emoji cannot be empty",
            style: TextStyle(
                fontSize: 15, fontFamily: 'FiraSans_Regular', color: Colors.white),
          ),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    DatabaseReference ref;

    if(widget.noteID != null){
      ref = FirebaseDatabase.instance.ref("users/${user.uid}/notes/${widget.noteID}");
    }else{
      ref = FirebaseDatabase.instance
          .ref("users/${user.uid}/notes")
          .push();
    }

    await ref.set({
      "title": title,
      "content": content,
      "emotion": emotion,
      "timestamp": DateTime.now().toIso8601String(),
    });

    titleController.clear();
    contentController.clear();

    setState(() {
      isHappy = false;
      isSad = false;
      isTerr = false;
      isVeryHap = false;
      isNeut = false;
    });

    Navigator.pop(context);
  }

  String _getSelectedEmotion(){
    if(isHappy) return 'happy';
    if(isSad) return 'sad';
    if(isTerr) return 'terrified';
    if(isVeryHap) return 'veryhappy';
    if(isNeut) return 'neutral';
    return 'none';
  }

  @override
  void dispose(){
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  void initState(){
    super.initState();

    if(widget.title != null){
      titleController.text = widget.title!;
    }
    if(widget.content != null){
      contentController.text = widget.content!;
    }
    if(widget.emotion != null){
      _selectedEmo(widget.emotion!);
    }
  }

  Widget build(BuildContext context){
    return Container(
      decoration: ContainerDecor.BackgroundStyle,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(widget.title != null
              ?'Edit dream'
              :'New dream', style: TextStyles.StyleText.copyWith(
            fontSize: 30,
          )),
          actions: [
            IconButton(
              onPressed: (){
                _saveNote();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Note saved successfully",
                      style: TextStyle(
                          fontSize: 15, fontFamily: 'FiraSans_Regular', color: Colors.white),
                    ),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              icon: Icon(Icons.check, color: Colors.white, size: 30),
            )
          ],
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Container(
                height: 70,
                width:  MediaQuery.of(context).size.width * 0.91,
                child: TextField(
                  maxLength: 13,
                  decoration: TextFields.FieldDec.copyWith(
                    labelText: 'Title',
                  ),
                  cursorColor: Colors.white,
                  style: TextStyles.StyleText,
                  controller: titleController,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed: (){
                    setState(() {
                      _selectedEmo('happy');
                    });
                  }, icon: isHappy
                      ? Emotions().smile_em_full(size: 40)
                      : Emotions().smile_em(size: 40)
                  ),
                  IconButton(onPressed: (){
                    setState(() {
                      _selectedEmo('sad');
                    });
                  }, icon: isSad
                      ? Emotions().sad_em_full(size: 40)
                      : Emotions().sad_em(size: 40)),
                  IconButton(onPressed: (){
                    setState(() {
                      _selectedEmo('terrified');
                    });
                  }, icon: isTerr
                      ? Emotions().dead_em_full(size: 40)
                      : Emotions().dead_em(size: 40)),
                  IconButton(onPressed: (){
                    setState(() {
                      _selectedEmo('veryhappy');
                    });
                  }, icon: isVeryHap
                      ?Emotions().veryhap_em_full(size: 40)
                      : Emotions().veryhap_em(size: 40)),
                  IconButton(onPressed: (){
                    setState(() {
                      _selectedEmo('neutral');
                    });
                  }, icon: isNeut
                      ?Emotions().neutral_em_full(size: 40)
                      : Emotions().neutral_em(size: 40)),
                ],
              ), //IconEmotions
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.91,
                    child: Scrollbar(
                      controller: _scrollController,
                      thumbVisibility: true,
                      thickness: 7,
                      radius: Radius.circular(100),
                      scrollbarOrientation: ScrollbarOrientation.right,

                      child: TextField(
                        scrollController: _scrollController,
                        decoration: TextFields.FieldDec.copyWith(
                            labelText: "Start typing...",
                            alignLabelWithHint: true
                        ),
                        cursorColor: Colors.white,
                        style: TextStyles.StyleText,
                        expands: true,
                        maxLines: null,
                        textAlignVertical: TextAlignVertical.top,
                        controller: contentController,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 50,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.bottomRight,
                colors: [Color.fromRGBO(57, 34, 99, 1), Color.fromRGBO(153, 85, 196, 1)],
              ),
              boxShadow: [BoxShadow(
                  color: Colors.black,
                  spreadRadius: 1,
                  blurRadius: 10
              )]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.image, color: Colors.white, size: 30)),
              IconButton(onPressed: (){}, icon: Icon(Icons.gesture, color: Colors.white, size: 30)),
              IconButton(onPressed: (){}, icon: Icon(Icons.mic, color: Colors.white, size: 30))
            ],
          ),
        ),
      ),
    );
  }
}
