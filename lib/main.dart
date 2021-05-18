import 'package:flutter/material.dart';
import 'package:onboarding_ui/data/data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Onboarding',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<SliderModel> slides = new List<SliderModel>();
  int currentindex = 0;
  PageController pageController = new PageController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    slides = getSlides();
  }

  Widget Pageindex(bool iscur) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3),
      height: iscur ? 10.0 : 6.0,
      width: iscur ? 10 : 6.0,
      decoration: BoxDecoration(
        color: iscur ? Colors.grey : Colors.indigo[400],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: PageView.builder(
            controller: pageController,
            itemCount: slides.length,
            onPageChanged: (val) {
              setState(() {
                currentindex = val;
              });
            },
            itemBuilder: (_, index) {
              return SliderTile(
                imageurl: slides[index].getImageulr(),
                title: slides[index].getTitle(),
                description: slides[index].getDescription(),
              );
            }),
        bottomSheet: currentindex != slides.length - 1
            ? SafeArea(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            pageController.animateToPage(slides.length - 1,
                                duration: Duration(microseconds: 400),
                                curve: Curves.linear);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("SKIP"),
                          )),
                      Row(
                        children: [
                          for (int i = 0; i < slides.length; i++)
                            currentindex == i
                                ? Pageindex(true)
                                : Pageindex(false)
                        ],
                      ),
                      InkWell(
                          onTap: () {
                            pageController.animateToPage(currentindex + 1,
                                duration: Duration(milliseconds: 400),
                                curve: Curves.linear);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("NEXT"),
                          )),
                    ],
                  ),
                ),
              )
            : InkWell(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: Colors.indigo[400]),
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ));
  }
}

class SliderTile extends StatelessWidget {
  final String imageurl, title, description;
  SliderTile(
      {@required this.imageurl,
      @required this.title,
      @required this.description});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imageurl),
          SizedBox(
            height: 20,
          ),
          Text(
            "$title",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text("$description")
        ],
      ),
    );
  }
}
