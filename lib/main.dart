import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:marquee/marquee.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Li Ador',
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff4352b9),
      appBar: bar(),
      body: SingleChildScrollView(
          child: Expanded(
        child: Column(
          children: [
            Notice(),
            SizedBox(height: 20),
            ImageSlider(),
            SizedBox(height: 20),
            Titile(),
            Services()
          ],
        ),
      )),
    );
  }
}

Titile() {
  return Column(children: [
    Text(
      "সেবা সমূহ",
      style:
          TextStyle(fontSize: 20, color: Colors.white, fontFamily: "Li Ador"),
    ),
    Padding(
        padding: EdgeInsets.only(bottom: 5, left: 15, right: 15, top: 5),
        child: Divider(
          height: 2,
        ))
  ]);
}

Services() {
  return ConstrainedBox(
    constraints: BoxConstraints(
      minHeight: 500
    ),
    child: Container(
      color: Colors.white,
    
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
              top: -1,
              left: 0,
              right: 0,
              child: Container(
                color: Color(0xff4352b9),
                height: 30,
              )),
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 150, childAspectRatio: .95),
            shrinkWrap: true,
            itemCount: 40,
            itemBuilder: (c, index) {
              return InkWell(
                onTap: (){},
                child: Container(
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.only(bottom: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 6,
                          offset: Offset(1, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Image(
                          fit: BoxFit.contain,
                          image: NetworkImage(IconsList[index % IconsList.length]),
                        ),
                      ),
                      Text(titleList[index % titleList.length])
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    ),
  );
}

List titleList = [
  "সংবাদ",
  "হাসপাতাল",
  "রক্ত",
  "অ্যাম্বুলেন্স",
  "ডাক্তার",
  "ফায়ার সার্ভিস",
  "হেল্পলাইন",
  "পুলিশ"
];

List IconsList = [
  "https://cdn-icons-png.flaticon.com/256/6182/6182861.png",
  "https://cdn-icons-png.flaticon.com/256/4861/4861722.png",
  "https://cdn-icons-png.flaticon.com/256/9750/9750626.png",
  "https://cdn-icons-png.flaticon.com/256/7602/7602845.png",
  "https://cdn-icons-png.flaticon.com/256/4497/4497758.png",
  "https://cdn-icons-png.flaticon.com/128/7072/7072045.png",
  "https://cdn-icons-png.flaticon.com/256/9821/9821812.png",
  "https://cdn-icons-png.flaticon.com/256/8284/8284302.png",
];

//Failed--> Codes
// Services() {
//   return Expanded(
//       child: Column(
//     children: [
//       Text(
//         "সেবা সমূহ",
//         style: TextStyle(fontSize: 20, color: Colors.white),
//       ),
//       Padding(
//           padding: EdgeInsets.only(bottom: 30, left: 15, right: 15, top: 5),
//           child: Divider(
//             height: 2,
//           )),
//       Expanded(
//           child: Container(
//         color: Colors.white,
//         child: Stack(
//           clipBehavior: Clip.none,
//           children: [
//             Positioned(
//               top: -30,
//               right: 0,
//               bottom: 0,
//               left: 0,
//               child: Expanded(
//                 child: GridView.builder(
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 3,
//                   ),
//                   itemCount: 20,
//                   itemBuilder: (context, index) {
//                     return Container(
//                       margin:
//                           EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black.withOpacity(0.2),
//                               spreadRadius: 2,
//                               blurRadius: 6,
//                               offset:
//                                   Offset(1, 3), // changes position of shadow
//                             ),
//                           ],
//                           borderRadius: BorderRadius.circular(5)),
//                       child: Column(
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.symmetric(horizontal: 10),
//                             child: Image(

//                               image:
//                                   NetworkImage(CarouselImages[index % CarouselImages.length]),
//                             ),
//                           ),
//                           Text("তোহা ভাই")
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             )
//           ],
//         ),
//       ))
//     ],
//   ));
// }

PreferredSizeWidget bar() {
  return AppBar(
    elevation: 0,
    leading: Icon(
      Icons.menu,
      color: Colors.white,
    ),
    titleTextStyle:
        TextStyle(color: Colors.white, fontSize: 17, fontFamily: "Li Ador"),
    title: Text("আমাদের মোহাম্মাদপুর"),
    backgroundColor: Color(0xff4352b9),
    actions: [
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Color(0xff3846aa),
                borderRadius: BorderRadius.circular(5)),
            alignment: Alignment.center,
            child: Text(
              "May 9,2024",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
      SizedBox(
        width: 20,
      )
    ],
  );
}

Widget Notice() {
  return Row(
    mainAxisSize: MainAxisSize.max,
    children: [
      SizedBox(
        width: 20,
      ),
      Text(
        "নোটিশ",
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      SizedBox(
        width: 20,
      ),
      Expanded(
        child: Container(
          height: 35,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(6), bottomLeft: Radius.circular(6)),
              color: Colors.white),
          child: Marquee(
            text:
                'আসসালামু আলাইকুম প্রিয় মোহাম্মদপুরবাসী, আমাদের অ্যাপে আপনাদের স্বাগতম। আমাদের এই অ্যাপের মাধ্যমে আপনারা মোহাম্মদপুর এলাকার সর্বশেষ সংবাদ, ইভেন্ট এবং জরুরি তথ্য সহজেই জানতে পারবেন। ধন্যবাদ।',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
            scrollAxis: Axis.horizontal,
            accelerationCurve: Curves.linear,
            accelerationDuration: Duration(seconds: 1),
            decelerationDuration: Duration(seconds: 1),
            decelerationCurve: Curves.easeOut,
            blankSpace: 20.0,
            velocity: 100.0,
            pauseAfterRound: Duration(seconds: 1),
            startPadding: 10.0,
          ),
        ),
      )
    ],
  );
}

//  CarouselImages = [];

List<String> CarouselImages = [
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTPqf3K0Y3cVmzpwZxLL9ONPI-8x0egCY9xl-2x4v9HA&s',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjYT_oLnYSczD6gazDRikUwEsi2GEb5Mdg3UUrVShU7A&s',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRB43NRUijJ3LKZW-rMpAezP--5m6MrtQEfcYnaT_eDkw&s',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeLtp2JuLiJY_xkVyzWJF-fYSI8HLkf5JjAjmccCLapw&s',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuWvlL6taxhkbzDCLMxLenh0ecGmQXZq-56T_DIdEXjA&s'
];

class ImageSlider extends StatefulWidget {
  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  // List<String> CarouselImages = [];

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 400, maxWidth: 400),
      child: Stack(
        children: [
          CarouselSlider(

            items: CarouselImages.map((item) => Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Stack(
                    children: [
                      Center(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.network(item,
                                fit: BoxFit.cover, width: 1000)),
                      ),
                      Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: CarouselImages.map((e) {
                return GestureDetector(
                    onTap: () {
                      _controller.animateToPage(CarouselImages.indexOf(e),
                      curve: Curves.easeIn,
                          duration: Duration(milliseconds: 500));
                    },
                    child: Container(
                      margin: EdgeInsets.all(5),
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                          color: Colors.white70.withOpacity(
                              _current == CarouselImages.indexOf(e) ? .9 : .6),
                          shape: BoxShape.circle),
                    ));
              }).toList(),
            ),
          ),
                    ],
                  ),
                )).toList(),
            carouselController: _controller,
            options: CarouselOptions(
              autoPlay: true,
              viewportFraction: 1,
              // enlargeFactor: false,
              enlargeCenterPage: true,
              aspectRatio: 2,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
          ),

          // Positioned(
          //   bottom: 0,
          //   right: 0,
          //   left: 0,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: CarouselImages.map((e) {
          //       return GestureDetector(
          //           onTap: () {
          //             _controller.animateToPage(CarouselImages.indexOf(e),
          //                 duration: Duration(milliseconds: 500));
          //           },
          //           child: Container(
          //             margin: EdgeInsets.all(5),
          //             height: 10,
          //             width: 10,
          //             decoration: BoxDecoration(
          //                 color: Colors.white70.withOpacity(
          //                     _current == CarouselImages.indexOf(e) ? .9 : .6),
          //                 shape: BoxShape.circle),
          //           ));
          //     }).toList(),
          //   ),
          // ),
          //GPT's IDEA
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: CarouselImages.asMap().entries.map((entry) {
          //     return GestureDetector(
          //       onTap: () => _controller.animateToPage(entry.key),
          //       child: Container(
          //         width: 12.0,
          //         height: 12.0,
          //         margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
          //         decoration: BoxDecoration(
          //           shape: BoxShape.circle,
          //           color: Colors.black
          //               .withOpacity(_current == entry.key ? 0.9 : 0.4),
          //         ),
          //       ),
          //     );
          //   }).toList(),
          // ),
        ],
      ),
    );
  }
}
