

import 'package:get/get.dart';
import 'package:music_player_app/view/main_tabview/main_tabview.dart';

class SplashViewMode extends GetxController{

  void loadView() async{
    await Future.delayed(const Duration(seconds:3) );
    Get.to( () => const MainTabView() );
  }
}
