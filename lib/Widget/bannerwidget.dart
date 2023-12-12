import 'package:cached_network_image/cached_network_image.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getwidget/components/shimmer/gf_shimmer.dart';
import 'package:onlineshopapp/firebase_service.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  FirebaseService _service = FirebaseService();
  int scrollPosition = 1;
  List _bannerImage = [];

  var pageViewCtr = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(_bannerImage.length);
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
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
                    print("object ${_bannerImage.length}");
                    return Container(
                      height: 140,
                      color: Colors.grey.shade200,
                      width: MediaQuery.of(context).size.width,
                      // color: Colors.pink.shade100,
                      child: PageView.builder(
                        controller: pageViewCtr,
                        itemCount: _bannerImage.length,
                        itemBuilder: (BuildContext context, int index) {
                          print("banner");
                          print(_bannerImage.length);
                          print(_bannerImage[index]);
                          return CachedNetworkImage(
                            imageUrl: _bannerImage[index],
                            fit: BoxFit.fill,
                            placeholder: (context, url) => GFShimmer(
                              showShimmerEffect: true,
                              mainColor: Colors.grey.shade500,
                              secondaryColor: Colors.grey.shade400,
                              child: Container(
                                color: Colors.grey.shade300,
                                height: 140,
                                width: MediaQuery.of(context).size.width,
                              ),
                            ),
                          );
                        },
                        // onPageChanged: (value) {
                        //   setState(() {
                        //     // scrollPosition = value.toInt();
                        //   });
                        // },
                      ),
                    );
                  }
                },
                future: getAllBanner()),
          ),
        ),
        _bannerImage.isEmpty
            ? Container()
            : Positioned(
                bottom: 10,
                child: DotsindicatorWidget(
                  scrollPosition: scrollPosition,
                  dostcount: _bannerImage.length,
                ),
              ),
      ],
    );
  }

  Future<void> getAllBanner() async {
    QuerySnapshot<dynamic?> imageSnapShot =
        await FirebaseFirestore.instance.collection('homeBanner').get();

    imageSnapShot.docs.forEach((element) {
      _bannerImage.add(element.data()['image']);
    });
    _bannerImage = _bannerImage.toSet().toList();
  }
}

class DotsindicatorWidget extends StatelessWidget {
  const DotsindicatorWidget({
    super.key,
    required this.scrollPosition,
    required this.dostcount,
  });

  final int scrollPosition;
  final int dostcount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DotsIndicator(
            reversed: true,
            dotsCount: dostcount,
            position: scrollPosition,
            decorator: DotsDecorator(
              activeColor: Colors.pink,
              spacing: EdgeInsets.all(2),
              size: Size.square(6),
              activeSize: Size(12, 6),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
