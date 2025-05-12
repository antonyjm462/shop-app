import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app/models/shoe_model.dart';
import 'package:shop_app/screens/navigator.dart';
import 'package:shop_app/services/local_db_service.dart';
import 'package:shop_app/theme/custom_theme.dart';
import 'package:shop_app/utils/app_methods.dart';
import 'package:shop_app/utils/constants.dart';

class DetailScreen extends StatelessWidget {
  ShoeModel model;
  bool isComeFromMoreSection;
  DetailScreen({
    super.key,
    required this.model,
    required this.isComeFromMoreSection,
  });

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
            title: Text("Nike", style: AppThemes.detailsAppBar),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: AppConstantsColor.darkTextColor,
              ),
            ),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
            ],
          ),
        ),
        body: DetailsBody(
          model: model,
          isComeFromMoreSection: isComeFromMoreSection,
        ),
      ),
    );
  }
}

class DetailsBody extends StatefulWidget {
  ShoeModel model;
  bool isComeFromMoreSection;
  DetailsBody({
    super.key,
    required this.model,
    required this.isComeFromMoreSection,
  });

  @override
  details createState() => details();
}

class details extends State<DetailsBody> {
  bool _isSelectedCountry = false;
  int _isSelectedSize = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width,
      height: height * 1.1,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            topInformationWidget(width, height),
            middleImgListWidget(width, height),
            SizedBox(
              height: 20,
              width: width / 1.1,
              child: Divider(thickness: 1.4, color: Colors.grey),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  nameAndPrice(),
                  SizedBox(height: 10),
                  shoeInfo(width, height),
                  SizedBox(height: 5),
                  moreDetailsText(width, height),
                  sizeTextAndCountry(width, height),
                  SizedBox(height: 10),
                  endSizesAndButton(width, height),
                  SizedBox(height: 20),
                  materialButton(width, height),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  topInformationWidget(width, height) {
    return SizedBox(
      width: width,
      height: height / 2.3,
      child: Stack(
        children: [
          Positioned(
            left: 50,
            bottom: 20,
            child: Container(
              width: 1000,
              height: height / 2.2,
              decoration: BoxDecoration(
                color: widget.model.modelColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(1500),
                  bottomRight: Radius.circular(100),
                ),
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: 30,
            child: Hero(
              tag:
                  widget.isComeFromMoreSection
                      ? widget.model.model
                      : widget.model.imgAddress,
              child: RotationTransition(
                turns: AlwaysStoppedAnimation(-25 / 360),
                child: SizedBox(
                  width: width / 1.3,
                  height: height / 4.3,
                  child: Image(image: AssetImage(widget.model.imgAddress)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  roundedImage(width, height) {
    return Container(
      padding: EdgeInsets.all(2),
      width: width / 5,
      height: height / 14,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[300],
      ),
      child: Image(image: AssetImage(widget.model.imgAddress)),
    );
  }

  middleImgListWidget(width, height) {
    return Container(
      padding: EdgeInsets.all(2),
      width: width,
      height: height / 11,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          roundedImage(width, height),
          roundedImage(width, height),
          roundedImage(width, height),
          Container(
            padding: EdgeInsets.all(2),
            width: width / 5,
            height: height / 14,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              image: DecorationImage(
                image: AssetImage(widget.model.imgAddress),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.grey.withOpacity(1),
                  BlendMode.darken,
                ),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Icon(
                Icons.play_circle_fill,
                color: AppConstantsColor.lightTextColor,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }

  materialButton(width, height) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      minWidth: width / 1.2,
      height: height / 15,
      color: AppConstantsColor.materialButtonColor,
      onPressed: () {
        AppMethods.addToCart(widget.model, context);
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => MainNavigator(initialIndex: 1),
          ),
          (route) => false,
        );
      },
      child: Text(
        "ADD TO BAG",
        style: TextStyle(color: AppConstantsColor.lightTextColor),
      ),
    );
  }

  endSizesAndButton(width, height) {
    return SizedBox(
      width: width,
      height: height / 14,
      child: Row(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: sizes.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _isSelectedSize = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 5),
                    width: width / 4.4,
                    height: height / 13,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color:
                            _isSelectedSize == index
                                ? Colors.black
                                : Colors.grey,
                        width: 1.5,
                      ),
                      color:
                          _isSelectedSize == index
                              ? Colors.black
                              : AppConstantsColor.backgroundColor,
                    ),
                    child: Center(
                      child: Text(
                        sizes[index].toString(),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color:
                              _isSelectedSize == index
                                  ? Colors.white
                                  : Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  sizeTextAndCountry(width, height) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Size",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppConstantsColor.darkTextColor,
            fontSize: 22,
          ),
        ),
        Expanded(child: Container()),
        SizedBox(
          width: width / 5,
          child: TextButton(
            onPressed: () {
              setState(() {
                _isSelectedCountry = false;
              });
            },
            child: Text(
              "UK",
              style: TextStyle(
                fontWeight:
                    _isSelectedCountry ? FontWeight.w400 : FontWeight.bold,
                color:
                    _isSelectedCountry
                        ? Colors.grey
                        : AppConstantsColor.darkTextColor,
                fontSize: 19,
              ),
            ),
          ),
        ),
        SizedBox(
          width: width / 5,
          child: TextButton(
            onPressed: () {
              setState(() {
                _isSelectedCountry = true;
              });
            },
            child: Text(
              "USA",
              style: TextStyle(
                fontWeight:
                    _isSelectedCountry ? FontWeight.bold : FontWeight.w400,
                color:
                    _isSelectedCountry
                        ? AppConstantsColor.darkTextColor
                        : Colors.grey,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }

  moreDetailsText(width, height) {
    return Container(
      padding: EdgeInsets.only(right: 280),
      height: height / 26,
      child: FittedBox(
        child: Text('MORE DETAILS', style: AppThemes.detailsMoreText),
      ),
    );
  }

  shoeInfo(width, height) {
    return SizedBox(
      width: width,
      height: height / 9,
      child: Text(
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin tincidunt laoreet enim, eget sodales ligula semper at. Sed id aliquet eros, nec vestibulum felis. Nunc maximus aliquet aliquam. Quisque eget sapien at velit cursus tincidunt. Duis tempor lacinia erat eget fermentum.",
        style: AppThemes.detailsProductDescriptions,
      ),
    );
  }

  nameAndPrice() {
    return Row(
      children: [
        Flexible(
          child: Text(
            widget.model.model,
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              color: AppConstantsColor.darkTextColor,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(width: 12),
        Text(
          widget.model.price.toStringAsFixed(2),
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppConstantsColor.materialButtonColor,
          ),
        ),
      ],
    );
  }
}
