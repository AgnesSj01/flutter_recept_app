import 'package:flutter/material.dart';
import '../model/ingridienser.dart';



class IngridenserItem extends StatelessWidget {
    final Ingridiens ingridiens;
    final onIngridensChange;

   IngridenserItem ({Key?key, required this.ingridiens, required this.onIngridensChange}): super (key:key);

  @override
  Widget build (BuildContext context){
    return Container (
      margin: EdgeInsets.only(bottom:20),//Skapar mellanrum mellan boxarna
      child: ListTile(
        onTap: () {
          //print('Clicked on ingredens Item');
          onIngridensChange (ingridiens);
        },
        shape:RoundedRectangleBorder(
          borderRadius:BorderRadius.circular(20),
          ),
          tileColor: Color.fromARGB(255, 255, 255, 255),
          leading: Icon(
           ingridiens.isDone ? 
           Icons.check_box : Icons.check_box_outline_blank,
            color:Color.fromARGB(255, 179, 162, 229)
            ) ,
          title: Text(
            ingridiens.ingridienserText!, 
            style: TextStyle(
              fontSize:16, 
              color:Color.fromARGB(255, 7, 7, 7), 
              decoration:ingridiens.isDone? TextDecoration.lineThrough : null,
              ),
          ),
      ),
      
    );
  }
}