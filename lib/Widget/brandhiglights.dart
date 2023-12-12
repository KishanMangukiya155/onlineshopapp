import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/shimmer/gf_shimmer.dart';
import 'package:onlineshopapp/Widget/bannerwidget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class BrandHighlights extends StatefulWidget {
  const BrandHighlights({super.key});

  @override
  State<BrandHighlights> createState() => _BrandHighlightsState();
}

class _BrandHighlightsState extends State<BrandHighlights> {
  int _scrollPosition = 1;
  List _brandAd = [];

  var pageViewCtr = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Brand Highlights",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1),
              ),
            ),
          ),
          Container(
            height: 170,
            width: MediaQuery.of(context).size.width,
            color: Colors.teal,
            child: FutureBuilder(
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return GFShimmer(
                    showShimmerEffect: true,
                    mainColor: Colors.grey.shade500,
                    secondaryColor: Colors.grey.shade400,
                    child: Container(
                      color: Colors.grey.shade300,
                      height: 140,
                      width: MediaQuery.of(context).size.width,
                    ),
                  );
                } else {
                  print("brand:${_brandAd.length}");
                  return Container(
                    height: 140,
                    color: Colors.grey.shade200,
                    width: MediaQuery.of(context).size.width,
                    child: PageView.builder(
                      controller: pageViewCtr,
                      itemCount: _brandAd.length,
                      onPageChanged: (value) {
                        setState(() {
                          _scrollPosition = value.toInt();
                        });
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 0, 4, 8),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: Container(
                                        height: 100,
                                        color: Colors.pink.shade500,
                                        child: Center(
                                            child: YoutubePlayer(
                                          controller: YoutubePlayerController(
                                            initialVideoId: 'xqyUdNxWazA',
                                            flags: YoutubePlayerFlags(
                                              autoPlay: false,
                                              mute: true,
                                              loop: true,
                                            ),
                                          ),
                                        )),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 1,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                8, 0, 4, 8),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              child: Container(
                                                height: 50,
                                                color: Colors.lime,
                                                child: Center(
                                                  child: CachedNetworkImage(
                                                    imageUrl: _brandAd[index],
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )),
                                      Expanded(
                                          flex: 1,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                4, 0, 8, 8),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              child: Container(
                                                height: 50,
                                                color: Colors.lime,
                                                child: Center(
                                                  child: CachedNetworkImage(
                                                    imageUrl: _brandAd[index],
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(4, 0, 8, 8),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: Container(
                                    height: 160,
                                    color: Colors.blue,
                                    child: Center(
                                      child: CachedNetworkImage(
                                        imageUrl: _brandAd[index],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                }
              },
              future: getAddBanner(),
            ),
          ),
          _brandAd.isEmpty
              ? Container()
              : DotsindicatorWidget(
                  scrollPosition: _scrollPosition,
                  dostcount: _brandAd.length,
                ),
        ],
      ),
    );
  }

  Future<void> getAddBanner() async {
    QuerySnapshot<dynamic?> imageSnapShot =
        await FirebaseFirestore.instance.collection('brandAd').get();

    imageSnapShot.docs.forEach((element) {
      _brandAd.add(element.data()['image2']);
    });
    _brandAd = _brandAd.toSet().toList();
  }
}
