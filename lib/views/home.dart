import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:music_player_app/consts/colors.dart';
import 'package:music_player_app/consts/text_style.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search, color: bgColor,)),
        ],
        leading:Icon(Icons.sort_rounded,color: bgColor,),
        title: Text("Beats",style: ourStyle(
          family: "bold",
          size: 18,
        ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 100,
          itemBuilder: (BuildContext context, int index){
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child:ListTile(
                title:Text("Music name", style: ourStyle(
                  family:bold,size:15
                ),),
                subtitle:Text("Artist name", style: ourStyle(
                  family:regular,size:12
              ),
              ),
              leading:const Icon(
                Icons.music_note,
                color: whiteColor,
                size: 32,
                ),
                trailing:const Icon(Icons.play_arrow,color: whiteColor,size: 26,) ,
              ),);
          }
          ),
      ),
    );
  }
}