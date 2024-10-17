import 'package:dreamy_project/pages/sleep_directory//dream_diary_page.dart';
import 'package:flutter/material.dart';
import 'package:dreamy_project/classes/style.dart';
import 'package:flutter/services.dart';

class NotesPage extends StatefulWidget{
  const NotesPage({super.key});

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

  @override
  void dispose(){
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context){
    return Container(
      decoration: ContainerDecor.BackgroundStyle,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('New dream', style: TextStyles.StyleText.copyWith(
            fontSize: 30,
          )),
          actions: [
            IconButton(
              onPressed: (){
                Navigator.pop(context);
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
                height: 50,
                width:  MediaQuery.of(context).size.width * 0.91,
                child: TextField(
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
