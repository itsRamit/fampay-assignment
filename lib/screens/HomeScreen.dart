import 'package:card_app/models/HcGroupModel.dart';
import 'package:card_app/services/HcGroupsService.dart';
import 'package:card_app/widgets/HC1Card.dart';
import 'package:card_app/widgets/HC3Card.dart';
import 'package:card_app/widgets/HC5Card.dart';
import 'package:card_app/widgets/HC6Card.dart';
import 'package:card_app/widgets/HC9Card.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  late Future<List<HcGroup>> futureHcGroups;

  @override
  void initState() {
    super.initState();
    futureHcGroups = getData();
  }

  Future<List<HcGroup>> getData() async {
    return await HcGroupsService().getHcGroups();
  }

  Future<void> _onRefresh() async {
    setState(() {
      futureHcGroups = getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F6F3),
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16),
        child: RefreshIndicator(
          onRefresh: _onRefresh,
          child: FutureBuilder<List<HcGroup>>(
            future: futureHcGroups,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No data available.'));
              } else {
                List<HcGroup> hcGroups = snapshot.data!;

                return ListView(
                  children: [
                    HC3Card(
                      id: hcGroups[0].cards[0].id,
                      height: hcGroups[0].height,
                      formatText: hcGroups[0].cards[0].formattedTitle!.text,
                      title:
                          hcGroups[0].cards[0].formattedTitle!.entities[0].text,
                      description:
                          hcGroups[0].cards[0].formattedTitle!.entities[1].text,
                      titleFontSize: hcGroups[0]
                          .cards[0]
                          .formattedTitle!
                          .entities[0]
                          .fontSize!,
                      descriptionFontSize: hcGroups[0]
                          .cards[0]
                          .formattedTitle!
                          .entities[1]
                          .fontSize!,
                      titleColor: hcGroups[0]
                          .cards[0]
                          .formattedTitle!
                          .entities[0]
                          .color,
                      descriptionColor: hcGroups[0]
                          .cards[0]
                          .formattedTitle!
                          .entities[1]
                          .color,
                      cta: hcGroups[0].cards[0].cta?[0],
                      bgImage: hcGroups[0].cards[0].bgImage!,
                      url: hcGroups[0].cards[0].url,
                    ),
                    HC6Card(
                      height: hcGroups[1].height,
                      iconSize: hcGroups[1].cards[0].iconSize!,
                      text:
                          hcGroups[1].cards[0].formattedTitle!.entities[0].text,
                      ImgUrl: hcGroups[1].cards[0].icon!.imageUrl,
                      bgColor: hcGroups[1].cards[0].bgColor!,
                      textColor: hcGroups[1]
                          .cards[0]
                          .formattedTitle!
                          .entities[0]
                          .color!,
                    ),
                    HC5Card(
                      imageUrl: hcGroups[2].cards[0].bgImage!.imageUrl,
                    ),
                    SingleChildScrollView(
                      padding: const EdgeInsets.only(top: 16),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          hcGroups[3].cards.length,
                          (index) => Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: HC9Card(
                              imageUrl:
                                  hcGroups[3].cards[index].bgImage!.imageUrl,
                              aspectRatio:
                                  hcGroups[3].cards[index].bgImage!.aspectRatio,
                              hexGradientColors:
                                  hcGroups[3].cards[index].bgGradient!.colors,
                              angle: hcGroups[3].cards[index].bgGradient!.angle,
                              height: hcGroups[3].height,
                            ),
                          ),
                        ),
                      ),
                    ),
                    HC1Card(
                      height: hcGroups[4].height,
                      bgColor: hcGroups[4].cards[0].bgColor!,
                      imageUrl: hcGroups[4].cards[0].icon!.imageUrl,
                      title:
                          hcGroups[4].cards[0].formattedTitle!.entities[0].text,
                      description: hcGroups[4]
                          .cards[0]
                          .formattedDescription!
                          .entities[0]
                          .text,
                      descriptionColor: hcGroups[4]
                          .cards[0]
                          .formattedDescription!
                          .entities[0]
                          .color!,
                      titleColor: hcGroups[4]
                          .cards[0]
                          .formattedTitle!
                          .entities[0]
                          .color!,
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
