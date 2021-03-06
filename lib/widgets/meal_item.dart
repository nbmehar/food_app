import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/model/meals.dart';
import '../screens/meal_details.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageURL;
 final int duration;
  final Complexity complexity;
  final Affordablility affordablility;


 const MealItem({ required this.affordablility,
   required this.id,
   required this.title,
   required this.imageURL,
   required this.duration,
   required this.complexity,

 });

 String get affordablilityText{
   switch(affordablility){
     case Affordablility.Affordable :
       return 'Affordable';
       break;
     case Affordablility.Pricey :
       return 'Pricey';
       break;
     case Affordablility.Luxurious :
       return 'Luxurious' ;
       break;
     default:
       return 'Unknown';
   }
 }
 String get complexityText{
   switch(complexity){
     case Complexity.Simple :
       return 'Simple';
       break;
     case Complexity.Hard :
       return 'Hard';
       break;
     case Complexity.Challenging :
       return 'Challenging' ;
       break;
     default:
       return 'Unknown';
   }
 }
  void selectMeal(BuildContext ctx){
  Navigator.of(ctx).pushNamed(
      MealDetails.routeName,
      arguments: id).then((result) {
        print(result);
        if(result != null){
         // delItem(result);
        }
      }
      );
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:() => selectMeal(context) ,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children:<Widget> [
                ClipRRect(
                  //use any widget as child into a widget where top corners are rounded
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)
                  ),
                  child:Image.network(imageURL,
                    height: 250,width: double.infinity,
                    fit: BoxFit.cover,
               ) ,
                ),
                Positioned(
                  bottom:20 ,
                  right:10 ,
                  child: Container(
                    width: 280,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 25),
                    child: Text(title,style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment:  MainAxisAlignment.spaceAround,
                children:<Widget> [
                Row(
                  children: <Widget>[
                    Icon(Icons.schedule),
                    SizedBox(
                      width: 6,
                    ),
                    Text('$duration min'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.work),
                    SizedBox(
                      width: 6,
                    ),
                    Text(complexityText),
                  ],
                ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 6,
                      ),
                      Text(affordablilityText),
                    ],
                  ),
              ],),
            )
          ],
        ),
      ),
    );
  }
}
