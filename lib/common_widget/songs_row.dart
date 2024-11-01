import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:music_player_app/common/color_extension.dart';

class SongsRow extends StatelessWidget {
  final Map sObj;
  final VoidCallback onPressedPlay;
  final VoidCallback onPressed;
  const SongsRow({super.key,required this.sObj,required this.onPressed,required this.onPressedPlay,});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize:MainAxisSize.min,
      children: [

        Row(children: [
          IconButton(
            onPressed: onPressedPlay,
             icon: Image.asset(
              "assets/images/play-button-arrowhead.png",
              width: 25,
              height:25,
              ),
              ),

              Expanded(child: Column(

                children: [
                 Image.asset("assets/images/heart.png",width:12,height:12,),
                       const SizedBox(height:4,),
                        IgnorePointer(
                          ignoring: true,
                          child: RatingBar.builder(
                                 initialRating: 4,
                                  minRating: 1,
                                direction: Axis.horizontal,
                                 allowHalfRating: true,
                                 unratedColor: TColor.org.withOpacity(0.2),
                                   itemCount: 5,
                                   itemSize:12,
                                itemPadding:  EdgeInsets.zero,
                                itemBuilder: (context, _) => Icon(
                                     Icons.star,
                                color: TColor.org,
                                          ),
                                          updateOnDrag: false,
                                 onRatingUpdate: (rating) {
                                        print(rating);
                                               },
                                    ),
                        )
              ],))

        ],),
        Divider(color: Colors.white.withOpacity(0.07),
          indent: 50,
          ),
      ],
    );
  }
}