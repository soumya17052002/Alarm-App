import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundClock extends StatefulWidget {

  final double size;

  const RoundClock({Key key, this.size}) : super(key: key);
  @override
  _RoundClockState createState() => _RoundClockState();
}

class _RoundClockState extends State<RoundClock> {

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer){
      setState((){});
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      height: widget.size,
      child: Transform.rotate(
        angle: -pi / 2,
        child: CustomPaint(
          painter: ClockPainter(),
        ),
      ),
    );
  }
}
 class ClockPainter extends CustomPainter{

  var dateTime = DateTime.now();



  @override
   void paint(Canvas canvas,Size size){
    var centerX = size.width/2;
    var centerY = size.height/2;
    var center = Offset(centerX, centerY);
    var radius = min(centerY,centerX);


    var fillBrush = Paint()
    ..color= Color(0xFF4444974);

    var outlineBrush = Paint()
      ..color= Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
    ..strokeWidth = size.width/20;


    var canterFillBrush = Paint()
      ..color= Color(0xFFEAECFF);

    var secondHandBrush = Paint()
    ..style = PaintingStyle.stroke
      ..strokeWidth=size.width/60
      ..strokeCap=StrokeCap.round
    ..color=Colors.orange[300];

    var minuteHandBrush = Paint()
    ..shader = RadialGradient(colors: [Color(0xFF748EF6),Color(0XFF77DDFF)])
        .createShader(Rect.fromCircle(center: center,radius: radius))
      ..strokeCap=StrokeCap.round
      ..strokeWidth=size.width/30
      ..style = PaintingStyle.stroke
      ..color=Color(0xFFEAECFF);

    var hourHandBrush = Paint()
      ..shader = RadialGradient(colors: [Color(0xFF7EA74AB),Color(0XFFC279FB)])
          .createShader(Rect.fromCircle(center: center,radius: radius))
      ..strokeCap=StrokeCap.round
      ..strokeWidth=size.width/24
      ..style = PaintingStyle.stroke
      ..color=Color(0xFFEAECFF);


    var dashBrush = Paint()
      ..color = Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1;
    var outerCircleRadius = radius;
    var innerCircleRadius = radius *.9;
    for (double i = 0; i < 360; i += 12) {
      var x1 = centerX + outerCircleRadius * cos(i * pi / 180);
      var y1 = centerY + outerCircleRadius * sin(i * pi / 180);

      var x2 = centerX + innerCircleRadius * cos(i * pi / 180);
      var y2 = centerY + innerCircleRadius * sin(i * pi / 180);
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    }

    canvas.drawCircle(center, radius*.75, fillBrush);
    canvas.drawCircle(center, radius*.75, outlineBrush);


    var hourHandX = centerX +radius*.4*cos((dateTime.hour*30+dateTime.minute*0.5)*pi/180);
    var hourHandY = centerY +radius*.4* sin((dateTime.hour*30+dateTime.minute*0.5)*pi/180);
    canvas.drawLine(center, Offset(hourHandX,hourHandY), hourHandBrush);

    var minHandX = centerX +radius*.57*cos((dateTime.minute*6+dateTime.second*1/60)*pi/180);
    var minHandY = centerY + radius*.57* sin((dateTime.minute*6+dateTime.second*1/60)*pi/180);
    canvas.drawLine(center, Offset(minHandX,minHandY), minuteHandBrush);


    var secHandX = centerX + radius*.65*cos(dateTime.second*6*pi/180);
    var secHandY = centerY + radius*.65* sin(dateTime.second*6*pi/180);
    canvas.drawLine(center, Offset(secHandX,secHandY ), secondHandBrush);

    canvas.drawCircle(center, radius*.12, canterFillBrush);




  }
  @override
   bool shouldRepaint (CustomPainter oldDelegate){
    return true;
  }
 }

