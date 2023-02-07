import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SpecialityCard extends StatelessWidget {
  final String specialityIcon;
  final String specialityName;

  SpecialityCard({
    required this.specialityIcon,
    required this.specialityName,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Container(
        padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.deepPurple[100],
              borderRadius: BorderRadius.circular(10),
            ),
              child: Column(
                children: [
                  // speciality icon
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      specialityIcon,
                      height: 100,),
              ),
          SizedBox(height: 10,),
          //speciality name
          Text(
            specialityName,
              style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18
          ),),

          ],
              ),

      ),



          );


  }
}
