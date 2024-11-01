

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';


class HomeViewMode extends GetxController{
  final txtSearch=TextEditingController().obs;

      final hostRecommendedArr=[
        {
          "image":"assets/images/craiyon_174557_song_cover_art__pale_colours__non_figurative__include_sand__wind__colours__red__purpl.png",
          "name":"Sound Of Sky",
          "artists":"Dilon Bruce"
        },
        {
           "image":"assets/images/alicia_keys___girl_on_fire_by_loudtalk_d5flpd2.png",
          "name":"Girl On Fire",
          "artists":"Alecia Keys"

        }
      ].obs;
      final playListArr=[
        {
           "image":"assets/images/Jubilee ❣️ on X.jpeg",
          "name":"Classic Playlist",
          "artists":"Piano Guys"

        },
        {
           "image":"assets/images/2019's Songs Of The Summer Will Bring Some Much-Needed Fire To Your Playlist.jpeg",
          "name":"Summer Playlist",
          "artists":"Dilon Bruce"

        },
        {
           "image":"assets/images/Wallpaper vaporwave aesthetic.jpeg",
          "name":"Pop Music",
          "artists":"Micheal Jackson"

        }

      ];
      final recentlyPlayedArr=[
        {
           "rate":4,
          "name":"Billie Jean",
          "artists":"Micheal Jackson"
        },
        {
           "rate":4,
          "name":"Earth Song",
          "artists":"Micheal Jackson"
        },
        {
           "rate":4,
          "name":"Mirror",
          "artists":"Justin Timberlake"
        },
        {
           "rate":4,
          "name":"Remember The Time",
          "artists":"Micheal Jackson"
        }
      ].obs;
}
