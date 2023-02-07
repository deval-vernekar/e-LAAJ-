import 'package:dots_indicator/dots_indicator.dart';
import 'package:elaaj/utility/big_text.dart';
import 'package:elaaj/utility/colors.dart';
import 'package:elaaj/utility/dimensions.dart';
import 'package:elaaj/utility/icon_and_widget.dart';
import 'package:elaaj/utility/small_text.dart';
import 'package:flutter/material.dart';

import '../utility/category_card.dart';
class ArticlePageBody extends StatefulWidget {
  const ArticlePageBody({Key? key}) : super(key: key);

  @override
  State<ArticlePageBody> createState() => _ArticlePageBodyState();
}

class _ArticlePageBodyState extends State<ArticlePageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //article slider section
        Container(
      height: Dimensions.pageViewContainer,
      child: PageView.builder(
          controller: pageController,
          itemCount: 5,
          itemBuilder: (context, position) {
            return _buildPageItem(
                position, _currPageValue, _scaleFactor, _height);
          }), // PageView. builder
    ),
        //dots
        new DotsIndicator(
    dotsCount: 5,
    position: _currPageValue,
    decorator: DotsDecorator(
      activeColor: AppColors.mainColor,
    size: const Size.square(9.0),
    activeSize: const Size(18.0, 9.0),
    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
    ),
    ),
        SizedBox(height: Dimensions.height25,),
        //search bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(Dimensions.radius20),
            ),
            child: TextField(
              onTap: () async{},
              //textAlign: TextAlign.center,
              decoration: InputDecoration(
                prefixIcon:Icon(Icons.search,color: Color(0xff5a4fcf), size:Dimensions.iconSize24),                  // for custom icon try Image.asset("asset/icons/search.png",height: 1,width: 1,),
                border: InputBorder.none,
                hintText: 'How can we help you?',
              ),
            ),
          ),
        ),
        SizedBox(height: Dimensions.height25,),
        //CategoryText
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30,),
          child: Row(
            children:
            [
              Column(  //greetings and name
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Category",
                    style: TextStyle(
                      fontSize: Dimensions.font20,
                      fontWeight: FontWeight.w400,

                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
        SizedBox(height: Dimensions.height25,),
        //Categories
        Container(
          height: Dimensions.height70,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CategoryCard(categoryName:'Dentist',iconImagePath: 'asset/icons/tooth.png'),
              CategoryCard(categoryName: 'Physician', iconImagePath:'asset/icons/doctor.png',),
              CategoryCard(categoryName: 'Cardiology', iconImagePath: 'asset/icons/heartbeat.png',),
              CategoryCard(categoryName: 'ENT', iconImagePath: 'asset/icons/sore-throat.png',),

            ],
          ),
        ),
        SizedBox(height: Dimensions.height25,),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            children: [
              BigText(text: "Available Doctor's",)
            ],
          ),
        ),
        SizedBox(height: Dimensions.height25,),

        //list of doctors and details
        ListView.builder(
             physics: NeverScrollableScrollPhysics(),
             shrinkWrap: true,
               itemCount:10,
               itemBuilder: (context,index)
            {
              return Container(
                //creating doctor tiles
                margin: EdgeInsets.only(left:Dimensions.width20,right: Dimensions.width20,bottom: Dimensions.height10),
                child: Row(
                  children: [
                    //doctor image section
                    Container(
                      width:Dimensions.listViewImgSize,
                      height: Dimensions.listViewImgSize,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white38,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              "asset/images/doc1.png"
                          ),
                        ),
                      ),
                    ),
                    //text doctor details container
                    Expanded(
                      child: Container(
                        height: Dimensions.listViewTextContSize,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(Dimensions.radius20),
                              bottomRight: Radius.circular(Dimensions.radius20)),
                          color:Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //doctor name
                              BigText(text:"Dr. Doc1"),
                              //SizedBox(height: Dimensions.width10,),
                              SmallText(text: "Physician"),
                             // SizedBox(height: Dimensions.height10,),
                              Row(
                                children: [
                                  Wrap(
                                    children: List.generate(5, (index) => Icon(Icons.star,color:AppColors.mainColor,size:15)),
                                  ),
                                  SizedBox(height: Dimensions.width10,),
                                  SmallText(text: "4.5"),
                                  // SizedBox(width: Dimensions.width10,),
                                  // SmallText(text: "1287"),
                                  // SizedBox(width: Dimensions.width10,),
                                  // SmallText(text: "comments"),



                                ],
                              ),
                             SizedBox(height: Dimensions.height10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconAndTextWidget(icon: Icons.location_on, text: "Goa", iconColor: AppColors.newColor),
                                  IconAndTextWidget(icon: Icons.access_time_rounded, text: "10AM-7PM",  iconColor: AppColors.iconColor2),

                                ],
                              ),
                            ],
                          ),
                        ),


                      ),

                    ),
                  ],
                ),

              );
            }),
      ],
    );
  }

  Widget _buildPageItem(int index, _currPageValue, _scaleFactor, _height) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale.toDouble(), 1)
        ..setTranslationRaw(0, currTrans, 0);
    }
    else if (index == _currPageValue.floor() + 1) {
      var currScale = _scaleFactor +
          (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale.toDouble(), 1)
        ..setTranslationRaw(0, currTrans, 0);
    }
    else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale.toDouble(), 1);
      matrix = Matrix4.diagonal3Values(1, currScale.toDouble(), 1)
        ..setTranslationRaw(0, currTrans, 0);
    }
    else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: index.isEven ? Color(0xff5a4fcf) : Color(0xFFffd28d),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("asset/images/ambulance.png"),
                )
            ),
          ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Container(
          //     height: Dimensions.pageViewTextContainer,
          //     margin: EdgeInsets.only(left: 5, right: 5, bottom: 20),
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(15),
          //       color: Colors.white,
          //     ),
          //     child: Container(
          //       padding: EdgeInsets.only(top: 10, right: 15, left: 15),
          //       child: Column(
          //         children: [
          //           BigText(text: "Learn More")
          //         ],
          //
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}