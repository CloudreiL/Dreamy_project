import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import 'package:dreamy_project/classes/style.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  @override
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
          title: Text('Home', style: TextStyles.StyleText.copyWith(
            fontSize: 30
          )),
          backgroundColor: Colors.transparent
        ),
        body: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.only(top: 10, left: 15),
                  child: Text('Dream rating', style: TextStyles.StyleText),)
                ],
              ),
              Padding(padding: EdgeInsets.all(10),
                child: Container(
                  height: 226,
                  width: 340,
                  decoration: ContainerDecor.ContainerDec,
                  child: PieChart(
                    PieChartData(
                      sections: dataChart.map((data) => PieChartSectionData(
                        value: data.value,
                        color: data.color,
                        title: data.title,
                        badgeWidget: data.icon
                      )).toList(),
                      sectionsSpace: 3,
                      centerSpaceRadius: 60,
                    ),
                    swapAnimationCurve: Curves.linear,
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(10),
                child: Container(
                    height: 100,
                    width: 340,
                    decoration: ContainerDecor.ContainerDec,
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.only(top: 5),
                        child:  Text('Most of your dreams are: ', style: TextStyles.StyleText),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Neutral', style: TextStyles.StyleText.copyWith(
                            fontSize: 30
                          ),),
                          Icon(Icons.sentiment_neutral_sharp, color: Colors.white, size: 50,)
                        ],
                      )
                    ],
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
