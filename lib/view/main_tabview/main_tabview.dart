import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:music_player_app/common/color_extension.dart';
import 'package:music_player_app/view/home/home_view.dart';
 
class MainTabView extends StatefulWidget {
  const MainTabView({super.key});


@override
State<MainTabView> createState() => _MainTabViewState();}

class _MainTabViewState extends State<MainTabView> with SingleTickerProviderStateMixin {

TabController? controller;
int selectTab=0;

@override
   void initState() {
    // TODO: implement == initState
    super.initState();
    controller=TabController(length:3,vsync: this);

    controller?.addListener((){
      selectTab=controller?.index??0;
      setState((){

      }
      );
  });
}

@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller?.dispose();
  }
   
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:TabBarView(controller:controller,children: [
        const HomeView(),
        Container(child:Center(child: Text("Songs")),
        
        ),
         Container(child:Center(child: Text("Settings")),
         ),
        
      ],),
      bottomNavigationBar: Container(
        decoration:BoxDecoration(color:TColor.bg,boxShadow:const[
          BoxShadow(
            color:Colors.black38,
            blurRadius: 5,
            offset: Offset(0, -3),
          )
        ]),
        child: BottomAppBar(
          color: Colors.transparent,
          elevation:1,
          child: TabBar(
        controller:controller,
        indicatorColor: Colors.transparent,
        indicatorWeight: 1,
        labelColor:TColor.primary ,
        labelStyle: const TextStyle(fontSize: 10),
        unselectedLabelColor:TColor.primaryText28 ,
        unselectedLabelStyle: const TextStyle(fontSize: 10),
        
          tabs: [
          Tab(text: "Home",icon:Image.asset(selectTab==0 ? "assets/images/home.png":"assets/images/home.png",width:20,height:20,),),
        
          Tab(text: "Songs",icon:Image.asset(selectTab==1 ? "assets/images/musical-note.png":"assets/images/musical-note.png",width:20,height:20,),),
        
         Tab(text: "Settings",icon:Image.asset(selectTab==2 ? "assets/images/setting.png":"assets/images/setting.png",width:20,height:20,),)
        ],)),
      ),
    );
}
}