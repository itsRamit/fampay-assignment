import 'package:card_app/models/HcGroupModel.dart';
import 'package:card_app/services/HcGroupsService.dart';
import 'package:card_app/widgets/HC3Card.dart';
import 'package:card_app/widgets/HC5Card.dart';
import 'package:card_app/widgets/HC6Card.dart';
import 'package:card_app/widgets/HC9Card.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<HcGroup> HcGroups = [];
  bool isLoading = false;

  getData() async {
    setState(() {
      isLoading = true;
    });
    HcGroups = await HcGroupsService().getHcGroups();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F6F3),
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              HC3Card(
                height: HcGroups[0].height,
                formatText: HcGroups[0].cards[0].formattedTitle!.text,
                title: HcGroups[0].cards[0].formattedTitle!.entities[0].text,
                description:
                    HcGroups[0].cards[0].formattedTitle!.entities[1].text,
                titleFontSize:
                    HcGroups[0].cards[0].formattedTitle!.entities[0].fontSize!,
                descriptionFontSize:
                    HcGroups[0].cards[0].formattedTitle!.entities[1].fontSize!,
                titleColor:
                    HcGroups[0].cards[0].formattedTitle!.entities[0].color,
                descriptionColor:
                    HcGroups[0].cards[0].formattedTitle!.entities[1].color,
                cta: HcGroups[0].cards[0].cta?[0],
                bgImage: HcGroups[0].cards[0].bgImage!,
                url: HcGroups[0].cards[0].url,
              ),
              HC6Card(
                height: HcGroups[1].height,
                iconSize: HcGroups[1].cards[0].iconSize!,
                text: HcGroups[1].cards[0].formattedTitle!.entities[0].text,
                ImgUrl: HcGroups[1].cards[0].icon!.imageUrl,
                bgColor: HcGroups[1].cards[0].bgColor!,
                textColor:
                    HcGroups[1].cards[0].formattedTitle!.entities[0].color!,
              ),
              HC5Card(
                imageUrl: HcGroups[2].cards[0].bgImage!.imageUrl,
              ),
              SingleChildScrollView(
                padding: EdgeInsets.only(top: 16),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    HcGroups[3].cards.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(
                          right: 16.0),
                      child: HC9Card(
                        imageUrl: HcGroups[3].cards[index].bgImage!.imageUrl,
                        aspectRatio:
                            HcGroups[3].cards[index].bgImage!.aspectRatio,
                        hexGradientColors:
                            HcGroups[3].cards[index].bgGradient!.colors,
                        angle: HcGroups[3].cards[index].bgGradient!.angle,
                        height: HcGroups[3].height,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
