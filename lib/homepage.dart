import 'package:flutter/material.dart';
import 'package:new_proj/clock_round.dart';
import 'package:intl/intl.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {


    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE, d MMM').format(now);
    var timeZoneString1 = now.timeZoneOffset.toString().split('.').first.split(':').first;
    var timeZoneString =  now.timeZoneOffset.toString().split('.').first.split(':')[1];

    var offsetSign = '';
    if(!timeZoneString.startsWith('-')){
      offsetSign = '+';
    }

    return Scaffold(
      backgroundColor:  Color(0xFF2D2F41),
      body: Row(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(onPressed: (){}, child:
              Column(
                children: <Widget>[
                  FlutterLogo(),
                ],
              )
              )
            ],
          ),
          VerticalDivider(
            color: Colors.white54,width: 1,
          ),
          Expanded(
            child: Container(

              padding: EdgeInsets.symmetric(horizontal: 32,vertical: 64),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Clock",
                  style: TextStyle(color: Colors.white,fontSize: 22),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*.042,
                  ),
                  Text(formattedTime,
                    style: TextStyle(color: Colors.white,fontSize: 54),
                  ),
                  Text(formattedDate,
                    style: TextStyle(color: Colors.white,fontSize: 18),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*.025,
                  ),
                  RoundClock(),
                  SizedBox(height: MediaQuery.of(context).size.height*.03,),
                  Text("Timezone",
                    style: TextStyle(color: Colors.white,fontSize: 18),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.015,),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.language,color: Colors.white,size: 17,

                      ),
                      SizedBox(width: MediaQuery.of(context).size.width*.05,),
                      Text("UTC"+offsetSign+timeZoneString1+":"+timeZoneString,
                        style: TextStyle(color: Colors.white,fontSize: 17),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}