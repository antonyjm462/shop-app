import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app/screens/detail/detail_screen.dart';
import 'package:shop_app/models/shoe_model.dart';
import 'package:shop_app/services/local_db_service.dart';
import 'package:shop_app/theme/custom_theme.dart';
import 'package:shop_app/utils/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstantsColor.backgroundColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text("Discover", style: AppThemes.homeAppBar),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: IconButton(
                  icon: FaIcon(
                    CupertinoIcons.search,
                    color: AppConstantsColor.darkTextColor,
                    size: 25,
                  ),
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.0, right: 4),
                child: IconButton(
                  icon: FaIcon(
                    CupertinoIcons.bell,
                    color: AppConstantsColor.darkTextColor,
                    size: 25,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
        body: const Body(),
        resizeToAvoidBottomInset: true,
      ),
    );
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int selectedIndexOfCategory = 0;
  int selectedIndexOfFeatured = 1;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        children: [
          topCategoriesWidget(width, height),
          SizedBox(height: 10),
          middleCategoriesWidget(width, height),
          SizedBox(height: 5),
          moreTextWidget(),
          lastCategoriesWidget(width, height),
        ],
      ),
    );
  }

  topCategoriesWidget(width, height) {
    return Container(
      padding: EdgeInsets.all(10),
      width: width,
      height: 80,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndexOfCategory = index;
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              margin: EdgeInsets.symmetric(horizontal: 8),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color:
                    selectedIndexOfCategory == index
                        ? AppConstantsColor.darkTextColor.withOpacity(0.9)
                        : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  categories[index],
                  style: TextStyle(
                    fontSize: selectedIndexOfCategory == index ? 21 : 18,
                    color:
                        selectedIndexOfCategory == index
                            ? Colors.white
                            : AppConstantsColor.unSelectedTextColor,
                    fontWeight:
                        selectedIndexOfCategory == index
                            ? FontWeight.bold
                            : FontWeight.w400,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  middleCategoriesWidget(width, height) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          width: width / 16,
          height: height / 2.7,
          child: RotatedBox(
            quarterTurns: -1,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: featured.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndexOfFeatured = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      featured[index],
                      style: TextStyle(
                        fontSize: selectedIndexOfFeatured == index ? 19 : 17,
                        color:
                            selectedIndexOfFeatured == index
                                ? AppConstantsColor.darkTextColor
                                : AppConstantsColor.unSelectedTextColor,
                        fontWeight:
                            selectedIndexOfFeatured == index
                                ? FontWeight.bold
                                : FontWeight.w400,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(
          width: width / 1.2,
          height: height / 2.4,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: availableShoes.length,
            itemBuilder: (ctx, index) {
              ShoeModel model = availableShoes[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (ctx) => DetailScreen(
                            model: model,
                            isComeFromMoreSection: false,
                          ),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.all(15),
                  width: width / 1.5,
                  child: Stack(
                    children: [
                      Container(
                        width: width / 1.81,
                        constraints: BoxConstraints(
                          minWidth: 180,
                          minHeight: 200,
                        ),
                        decoration: BoxDecoration(
                          color: model.modelColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      Positioned(
                        left: 10,
                        child: Row(
                          children: [
                            Text(model.name, style: AppThemes.homeProductName),
                            SizedBox(width: 120),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 45,
                        left: 10,
                        child: Text(
                          model.model,
                          style: AppThemes.homeProductModel,
                        ),
                      ),
                      Positioned(
                        top: 80,
                        left: 10,
                        child: Text(
                          "\$${model.price.toStringAsFixed(2)}",
                          style: AppThemes.homeProductPrice,
                        ),
                      ),
                      Positioned(
                        left: 20,
                        top: 60,
                        child: Hero(
                          tag: model.imgAddress,
                          child: RotationTransition(
                            turns: AlwaysStoppedAnimation(-30 / 360),
                            child: SizedBox(
                              width: 250,
                              height: 230,
                              child: Image(image: AssetImage(model.imgAddress)),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 170,
                        child: IconButton(
                          onPressed: () {},
                          icon: FaIcon(
                            CupertinoIcons.arrow_right,
                            color: Colors.white,
                            size: 27,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  moreTextWidget() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text("More", style: AppThemes.homeMoreText),
          Expanded(child: Container()),
          IconButton(
            onPressed: () {},
            icon: FaIcon(CupertinoIcons.arrow_right, size: 27),
          ),
        ],
      ),
    );
  }

  lastCategoriesWidget(width, height) {
    int crossAxisCount = (width ~/ 220).clamp(2, 4);
    return SizedBox(
      width: width,
      height: height / 1.8,
      child: GridView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: availableShoes.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: (width / crossAxisCount) / (height / 2.8),
        ),
        itemBuilder: (ctx, index) {
          ShoeModel model = availableShoes[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (ctx) => DetailScreen(
                        model: model,
                        isComeFromMoreSection: true,
                      ),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.all(10),
              width: width / 2.24,
              height: height / 4.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 5,
                    child: Container(
                      width: width / 13,
                      height: height / 10,
                      color: Colors.red,
                      child: RotatedBox(
                        quarterTurns: -1,
                        child: Center(
                          child: Text("NEW", style: AppThemes.homeGridNewText),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 140,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_border,
                        color: AppConstantsColor.darkTextColor,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 26,
                    left: 25,
                    child: RotationTransition(
                      turns: AlwaysStoppedAnimation(-15 / 360),
                      child: SizedBox(
                        width: width / 3,
                        height: height / 9,
                        child: Hero(
                          tag: model.model,
                          child: Image(image: AssetImage(model.imgAddress)),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 124,
                    left: 45,
                    child: SizedBox(
                      width: width / 4,
                      height: height / 42,
                      child: FittedBox(
                        child: Text(
                          "${model.name} ${model.model}",
                          style: AppThemes.homeGridNameAndModel,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 145,
                    left: 45,
                    child: SizedBox(
                      width: width / 4,
                      height: height / 42,
                      child: FittedBox(
                        child: Text(
                          "\$${model.price.toStringAsFixed(2)}",
                          style: AppThemes.homeGridPrice,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
