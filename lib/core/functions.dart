
import 'package:flutter/material.dart';
void snackBarMessage({ required context, required text, required color}){

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(backgroundColor: color, content: Center(child: Text(text)))
    );
}
navigateTo (context, widget){
  Navigator.push(context, MaterialPageRoute(builder: (context)=>widget));
}

navigateToAndReplace(context,widget){
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>widget));
}