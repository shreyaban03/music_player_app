
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player_app/common/color_extension.dart';
import 'package:music_player_app/common_widget/playlist_cell.dart';
import 'package:music_player_app/common_widget/recommended_cell.dart';
import 'package:music_player_app/common_widget/songs_row.dart';
import 'package:music_player_app/common_widget/title_section.dart';
import 'package:music_player_app/common_widget/view_all_sections.dart';
import 'package:music_player_app/view_model/home_view_model.dart';

class HomeView extends StatefulWidget {
    const HomeView({super.key});

    @override
    State<HomeView> createState() =>_HomeViewState();
  }

  class _HomeViewState extends State<HomeView>{

    final HomeVM=Get.put(HomeViewMode());
    @override
    Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
          backgroundColor:TColor.bg,
          elevation:0,
          leading: IconButton(onPressed: (){}, icon: Image.asset("assets/images/bars-sort.png",
        width:25,
        height:25,
        fit: BoxFit.contain,
        )),
        title: Row(children: [
          Expanded(
            child: Container(
              height:38,
              width:double.maxFinite ,
              decoration:BoxDecoration(
                color:const Color(0xff292E4B),
                borderRadius: BorderRadius.circular(19)
              ),
            child: TextField(
              controller:HomeVM.txtSearch.value,
              decoration: InputDecoration(
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical:10,horizontal:20),
                prefixIcon: Container(
                  margin:const EdgeInsets.only(left: 20),
                  alignment:Alignment.centerLeft,
                  width:30,
                
                  child: Image.asset("assets/images/search-interface-symbol.png",
                  width:20,
                  height: 20,
                  fit:BoxFit.contain,
                  ),
                ),
                hintText: "Search Album Song",
                hintStyle: TextStyle(
                  color:TColor.primaryText,
                  fontSize: 13,
                  )
              ),
            ),
            ),
          )
        ],),
        ),
        body:SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

           const TitleSection(title:"Hot Recommended"),

           SizedBox(
            height:180,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal:10,vertical: 10),
              scrollDirection: Axis.horizontal,
              itemCount: HomeVM.hostRecommendedArr.length,
              itemBuilder: (context,index){

                var mObj=HomeVM.hostRecommendedArr[index];
               return RecommendedCell(mObj: mObj);
              },
            ),
           ),
          Divider(color: Colors.white.withOpacity(0.07),
          indent: 20,
          endIndent: 20,
          ),
          ViewAllSection(title: "Recently Played", onPressed: (){}),

           SizedBox(
            height:160,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics()
              ,shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal:10,vertical: 0),
              
              itemCount: HomeVM.recentlyPlayedArr.length,
              itemBuilder: (context,index){

                var mObj=HomeVM.recentlyPlayedArr[index];
               return PlayListCell(mObj: mObj);
              },
            ),
           ),

          Divider(color: Colors.white.withOpacity(0.07),
          indent: 20,
          endIndent: 20,
          ),
           ListView.builder(
              padding: EdgeInsets.symmetric(horizontal:10,vertical: 0),
              scrollDirection: Axis.horizontal,
              itemCount: HomeVM.playListArr.length,
              itemBuilder: (context,index){

                var sObj=HomeVM.playListArr[index];
               return SongsRow(
                sObj: sObj, 
                onPressed: () {},
                 
               onPressedPlay: () {},
               );
              },
            ),


        
          ]),
        )
      );
    }
  }