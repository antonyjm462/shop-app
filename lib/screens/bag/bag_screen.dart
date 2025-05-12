import 'package:flutter/material.dart';

import 'package:shop_app/models/shoe_model.dart';
import 'package:shop_app/services/local_db_service.dart';
import 'package:shop_app/theme/custom_theme.dart';
import 'package:shop_app/utils/constants.dart';
import 'package:shop_app/screens/navigator.dart';

class MyBagScreen extends StatelessWidget {
  final VoidCallback? onBack;
  const MyBagScreen({super.key, this.onBack});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: AppConstantsColor.backgroundColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: const Text(
              'My Bag',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: AppConstantsColor.darkTextColor,
              ),
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => MainNavigator(initialIndex: 0),
                  ),
                  (route) => false,
                );
              },
            ),
          ),
        ),
        resizeToAvoidBottomInset: true,
        body: const BodyBagView(),
      ),
    );
  }
}

class EmptyList extends StatelessWidget {
  const EmptyList({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: SizedBox(
        width: width,
        height: height / 1.4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("No shoes added!", style: AppThemes.bagEmptyListTitle),
            Text(
              "Once you have added, come back:)",
              style: AppThemes.bagEmptyListSubTitle,
            ),
          ],
        ),
      ),
    );
  }
}

class BodyBagView extends StatefulWidget {
  const BodyBagView({super.key});

  @override
  _BodyBagViewState createState() => _BodyBagViewState();
}

class _BodyBagViewState extends State<BodyBagView>
    with SingleTickerProviderStateMixin {
  int lengthsOfItemsOnBag = itemsOnBag.length;

  int get totalItems => itemsOnBag.fold(0, (sum, item) => sum + item.quantity);
  double get totalCost =>
      itemsOnBag.fold(0, (sum, item) => sum + item.price * item.quantity);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        width: width,
        child: Column(
          children: [
            topText(width, height),
            Divider(color: Colors.grey),
            itemsOnBag.isEmpty
                ? EmptyList()
                : Column(
                  children: [
                    mainListView(width, height),
                    SizedBox(height: 12),
                    bottomInfo(width, height),
                  ],
                ),
          ],
        ),
      ),
    );
  }

  topText(width, height) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("Total $totalItems Items", style: AppThemes.bagTotalPrice),
        ],
      ),
    );
  }

  materialButton(width, height) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      minWidth: width / 1.2,
      height: height / 15,
      color: AppConstantsColor.materialButtonColor,
      onPressed: () {},
      child: Text(
        "NEXT",
        style: TextStyle(color: AppConstantsColor.lightTextColor),
      ),
    );
  }

  mainListView(width, height) {
    return SizedBox(
      width: width,
      height: height / 1.6,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: itemsOnBag.length,
        itemBuilder: (ctx, index) {
          ShoeModel currentBagItem = itemsOnBag[index];

          return Container(
            margin: EdgeInsets.symmetric(vertical: 1),
            width: width,
            height: height / 5.2,
            child: Row(
              children: [
                SizedBox(
                  width: width / 2.8,
                  height: height / 5.7,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 20,
                        left: 10,
                        child: Container(
                          width: width / 3.6,
                          height: height / 7.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.grey[350],
                          ),
                        ),
                      ),
                      Positioned(
                        right: 2,
                        bottom: 15,
                        child: RotationTransition(
                          turns: AlwaysStoppedAnimation(-40 / 360),
                          child: SizedBox(
                            width: 140,
                            height: 140,
                            child: Image(
                              image: AssetImage(currentBagItem.imgAddress),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        currentBagItem.model,
                        style: AppThemes.bagProductModel,
                      ),
                      SizedBox(height: 4),
                      Text(
                        "\$${currentBagItem.price}",
                        style: AppThemes.bagProductPrice,
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                currentBagItem.quantity--;
                                if (currentBagItem.quantity <= 0) {
                                  itemsOnBag.remove(currentBagItem);
                                }
                              });
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[300],
                              ),
                              child: Center(
                                child: Icon(Icons.remove, size: 15),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            currentBagItem.quantity.toString(),
                            style: AppThemes.bagProductNumOfShoe,
                          ),
                          SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                currentBagItem.quantity++;
                              });
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[300],
                              ),
                              child: Center(child: Icon(Icons.add, size: 15)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  bottomInfo(width, height) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      width: width,
      height: height / 7,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("TOTAL", style: AppThemes.bagTotalPrice),
              Text(
                "\$${totalCost.toStringAsFixed(2)}",
                style: AppThemes.bagSumOfItemOnBag,
              ),
            ],
          ),
          SizedBox(height: 30),
          materialButton(width, height),
        ],
      ),
    );
  }
}
