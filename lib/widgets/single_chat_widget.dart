import 'package:XChat/utils/colors.dart';
import 'package:flutter/material.dart';

class SingleChatWidget extends StatefulWidget {
  const SingleChatWidget({Key? key}) : super(key: key);

  @override
  State<SingleChatWidget> createState() => _SingleChatWidgetState();
}

class _SingleChatWidgetState extends State<SingleChatWidget> {
  @override
  Widget build(BuildContext context) {
    return
      Container(

        padding:
        const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
        child: Row(
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://video-images.vice.com/articles/6220167816692d009cc68908/lede/1646270291522-screen-shot-2022-03-03-at-121754-pm.png'),
radius: 22,
            ),
            const SizedBox(width: 16,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    "Patrick",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec suscipit, mi sit amet sodales",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,

                  )
                ],
              ),
            ),
            const SizedBox(width: 16,),
            Column(
              children: [
                const Text(
                  "4:30PM",
                  style: TextStyle(
                      color: primaryColor, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: primaryColor,
                  ),
                  padding: const EdgeInsets.all(5.0),
                  child: const SizedBox(
                    height: 12.0,
                    width: 12.0,
                    child: Center(
                      child: Text(
                        "1",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      )
    ;
  }
}
