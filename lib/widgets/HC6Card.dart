import 'package:card_app/utils/utils.dart';
import 'package:flutter/material.dart';

class HC6Card extends StatelessWidget {
  final int height;
  final int iconSize;
  final String text;
  final String textColor;
  final String ImgUrl;
  final String bgColor;

  const HC6Card(
      {super.key,
      required this.ImgUrl,
      required this.height,
      required this.iconSize,
      required this.text,
      required this.bgColor,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Container(
        height: height + 16, //16 more for padding
        width: width,
        decoration: BoxDecoration(
            color: Utils().convertHexToColor(bgColor),
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.network(
                    ImgUrl,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return Center(
                            child: Icon(
                          Icons.person_2_rounded,
                          size: iconSize.toDouble(),
                        ));
                      }
                    },
                    errorBuilder: (BuildContext context, Object error,
                        StackTrace? stackTrace) {
                      return const Center(child: Icon(Icons.person));
                    },
                    height: iconSize.toDouble(),
                    width: iconSize.toDouble(),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    text,
                    style: TextStyle(
                        color: Utils().convertHexToColor(textColor),
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: iconSize.toDouble(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
