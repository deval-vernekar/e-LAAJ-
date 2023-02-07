import 'package:elaaj/home/article_page_body.dart';
import 'package:elaaj/utility/config.dart';
import 'package:elaaj/utility/dimensions.dart';
import 'package:elaaj/utility/speciality_card.dart';
import 'package:flutter/material.dart';

import '../utility/category_card.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: SafeArea( // Safe area prevents from notch or cam cutout
        child: Column(
          children: [
            //app bar

             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 10.0),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:
                [
                  Column(  //greetings and name
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hello,",
                      style: TextStyle(
                        fontSize: Dimensions.font20,
                        fontWeight: FontWeight.w400,

                      ),
                      ),
                      SizedBox(height: 3,),
                      Text("Welcome !",
                        style: TextStyle(
                          fontSize: Dimensions.font20,
                          fontWeight: FontWeight.w400,

                        ),
                      ),
                    ],
                  ),
                  //profile picture
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Color(0xFFffd28d),
                      borderRadius: BorderRadius.circular(Dimensions.radius10),
                    ),
                    height: Dimensions.height40,
                    width: Dimensions.width40,
                    child: Image.asset("asset/icons/Emergency.png",color: Colors.white,),
                  )
                 // Icon(Icons.person),
]
                  ),
             ),
            SizedBox(height: Dimensions.height20,),
            //showing article section
            Expanded(child: SingleChildScrollView(
              child: ArticlePageBody(),
            )
            ),

          ],
      ),

        ),
      );

  }
}

