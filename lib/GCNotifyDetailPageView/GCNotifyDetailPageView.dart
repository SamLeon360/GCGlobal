import 'package:easy_localization/easy_localization.dart';import 'package:flutter/cupertino.dart';import 'package:flutter/gestures.dart';import 'package:flutter/material.dart';import 'package:gcglobal/Widghts/GCNavBar.dart';class GCNotifyDetailPageView extends StatefulWidget{  @override  State<StatefulWidget> createState() {    // TODO: implement createState    return GCNotifyDetailState();  }  }class GCNotifyDetailState extends State<GCNotifyDetailPageView>{  @override  Widget build(BuildContext context) {    // TODO: implement build    return Scaffold(      appBar: GCNavBar(title: tr("計劃通知"),leftIcon:Icon(Icons.arrow_back_ios_outlined),rightIcon1: null,rightIcon2: null,        onPressed1:null,        onPressed2: null,      ),      body: Container(        width: MediaQuery.of(context).size.width,        color: Color(0xFFF4F4F4),        child: Column(          children: [            Container(              margin: EdgeInsets.only(top: 20,bottom: 17),              height: 17,              child: Text("現在",style: TextStyle(fontSize: 12,color: Color(0xFF666666)),textAlign: TextAlign.center,),            ),            Row(              children: [                Container(                  margin: EdgeInsets.only(left: 15),                  width: 46,                  height: 46,                  decoration: BoxDecoration(                    shape: BoxShape.circle,                    color: Color(0xFF007AFF),                  ),                ),                Expanded(child: Container(                  margin: EdgeInsets.only(left: 10,right: 15),                  alignment: Alignment.topLeft,                  padding: EdgeInsets.only(left: 10,right: 10,top: 12,bottom: 12),                  decoration: BoxDecoration(                      shape: BoxShape.rectangle,                      borderRadius: BorderRadius.all(Radius.circular(4)),                      color: Colors.white                  ),                  child:Text.rich( TextSpan(                      children: [                        TextSpan(                          text: "你的計劃將於半小時後開始，請注意安排時間！",                          style: TextStyle(                              color: Color(0xFF666666),                              fontSize: 12                          ),                        ),                        TextSpan(                          text: "立即查看",                          style: TextStyle(                            color: Color(0xFF333333),                            fontWeight: FontWeight.w500,                            fontSize: 12,                            decoration: TextDecoration.underline,                          ),                          ///點擊事件                          recognizer: TapGestureRecognizer()..onTap = (){                          }                        )                      ]                  )),                ))              ],            )          ],        ),      ),    );  }  }