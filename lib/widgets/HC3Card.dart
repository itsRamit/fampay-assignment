import 'package:card_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import shared_preferences
import 'package:url_launcher/url_launcher.dart';
import 'package:card_app/models/BgImageModel.dart';
import 'package:card_app/models/CtaModel.dart';

class HC3Card extends StatefulWidget {
  final int id;
  final int height;
  final String formatText;
  final String title;
  final int titleFontSize;
  final String? titleColor;
  final String? description;
  final int descriptionFontSize;
  final String? descriptionColor;
  final Cta? cta;
  final BgImage bgImage;
  final String? url;

  HC3Card({
    required this.id,
    required this.height,
    required this.title,
    required this.description,
    required this.formatText,
    required this.titleFontSize,
    required this.descriptionFontSize,
    required this.titleColor,
    required this.descriptionColor,
    required this.cta,
    required this.bgImage,
    required this.url,
  });

  @override
  _HC3CardState createState() => _HC3CardState();
}

class _HC3CardState extends State<HC3Card> {
  bool _longPressed = false;

  Future<void> _dismissCard() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> dismissedIds = prefs.getStringList('dismissedCards') ?? [];
    if (!dismissedIds.contains(widget.id.toString())) {
      dismissedIds.add(widget.id.toString());
    }
    await prefs.setStringList('dismissedCards', dismissedIds);
    Utils().toastmessage("Card removed");
    setState(() {});
  }

  Future<bool> _isCardDismissed() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> dismissedIds = prefs.getStringList('dismissedCards') ?? [];
    return dismissedIds.contains(widget.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    String subtitle = widget.formatText.replaceAll(RegExp(r'[\{\}\n]'), '');

    return FutureBuilder<bool>(
      future: _isCardDismissed(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        if (snapshot.data == true) {
          return const SizedBox();
        }

        return GestureDetector(
          onLongPress: () {
            setState(() {
              _longPressed = !_longPressed;
            });
          },
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Row(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: widget.height.toDouble(),
                    width: _longPressed ? constraints.maxWidth / 3 : 0,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15))),
                    child: Column(
                      spacing: 16,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _dismissCard();
                          },
                          child: Container(
                            width: constraints.maxWidth / 4,
                            height: constraints.maxWidth / 4,
                            decoration: BoxDecoration(
                              color: Color(0xffF7F6F3),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.notifications,
                                    color: Colors.amberAccent,
                                    size: constraints.maxWidth / 8,
                                  ),
                                  Text(
                                    "Remind later",
                                    style: TextStyle(
                                        fontSize: constraints.maxWidth / 30),
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.fade,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _dismissCard();
                          },
                          child: Container(
                            width: constraints.maxWidth / 4,
                            height: constraints.maxWidth / 4,
                            decoration: BoxDecoration(
                              color: Color(0xffF7F6F3),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.disabled_by_default_rounded,
                                  color: Colors.amberAccent,
                                  size: constraints.maxWidth / 8,
                                ),
                                Text(
                                  "Dismiss now",
                                  style: TextStyle(
                                      fontSize: constraints.maxWidth / 30),
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.fade,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: widget.height.toDouble(),
                      width: _longPressed
                          ? constraints.maxWidth / 2
                          : constraints.maxWidth,
                      decoration: BoxDecoration(
                        color: const Color(0xff454AA6),
                        image: DecorationImage(
                          image: NetworkImage(widget.bgImage.imageUrl),
                          alignment: Alignment.topCenter,
                          fit: BoxFit.fitWidth,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: widget.height.toDouble() / 4,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.title,
                                  style: TextStyle(
                                    color: Utils()
                                        .convertHexToColor(widget.titleColor!),
                                    fontSize: widget.titleFontSize.toDouble(),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  subtitle,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: widget.titleFontSize.toDouble(),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              widget.description != ''
                                  ? widget.description!
                                  : "This is a sample text for the subtitle that you can add to contextual cards",
                              style: TextStyle(
                                color: Utils().convertHexToColor(
                                    widget.descriptionColor!),
                                fontSize: widget.descriptionFontSize.toDouble(),
                              ),
                            ),
                            // Call-to-Action Button
                            ElevatedButton(
                              onPressed: () async {
                                try {
                                  await launch(widget.url!);
                                } catch (e) {
                                  Utils().toastmessage('Could not launch URL');
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Utils()
                                    .convertHexToColor(widget.cta!.bgColor),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 12),
                              ),
                              child: Text(
                                widget.cta!.text.isEmpty
                                    ? 'Action'
                                    : widget.cta!.text,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
