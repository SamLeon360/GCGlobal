import 'package:easy_localization/easy_localization.dart';import 'package:flutter/cupertino.dart';import 'package:flutter/material.dart';import 'package:gcglobal/Widghts/GCButton.dart';import 'package:gcglobal/Widghts/GCNavBar.dart';class GCReportErrorPageView extends StatefulWidget{  @override  State<StatefulWidget> createState() {    // TODO: implement createState    return GCReportErrorState();  }}class GCReportErrorState extends State<GCReportErrorPageView>{  @override  Widget build(BuildContext context) {    // TODO: implement build    return Scaffold(      appBar: GCNavBar(        title:"報告錯誤",leftIcon:Icon(Icons.arrow_back_ios_outlined),rightIcon1: null,rightIcon2: null,        onPressed1:null,        onPressed2: null,      ),      body: ListView(        scrollDirection: Axis.vertical,        children: [          Container(            margin: EdgeInsets.only(left: 15,top: 30),            child: Text(              tr("填寫錯誤內容"),              style: TextStyle(                  color: Color(0xFF333333),                  fontWeight: FontWeight.w500,                  fontSize: 16              ),            ),          ),          Container(            margin: EdgeInsets.only(left: 15,right: 15,top: 10),            height: 194,            decoration: BoxDecoration(                shape: BoxShape.rectangle,                borderRadius: BorderRadius.all(Radius.circular(4)),              border: Border.all(                color: Color(0xFFE4E4E4),                width: 1              )            ),            child:TextField(                style:TextStyle(                    color: Color(0xFF333333),                    fontSize: 12                ),                maxLines: null,                decoration: InputDecoration(                    hintText: tr("請輸入需要報告的內容"),                    border: InputBorder.none,                    // border:  OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFE4E4E4))),                    contentPadding: EdgeInsets.all(10.0)                )            ),          ),          Container(            margin: EdgeInsets.only(left: 15,top: 30),            child: Text(              tr("郵箱地址"),              style: TextStyle(                  color: Color(0xFF333333),                  fontWeight: FontWeight.w500,                  fontSize: 16,              ),            ),          ),          Container(            height: 40,            margin: EdgeInsets.only(left: 15,right: 15,top: 10),            decoration: BoxDecoration(                shape: BoxShape.rectangle,                borderRadius: BorderRadius.all(Radius.circular(4)),                border: Border.all(                    color: Color(0xFFE4E4E4),                    width: 1                )            ),            child:TextField(                style:TextStyle(                    color: Color(0xFF333333),                    fontSize: 12                ),                decoration: InputDecoration(                    hintText: tr("請輸入你的郵箱地址"),                    border:  InputBorder.none,                    contentPadding: EdgeInsets.all(10.0)                )            ),          ),          Container(            margin: EdgeInsets.only(left: 15,top: 30),            child: Text(              tr("電話號碼"),              style: TextStyle(                  color: Color(0xFF333333),                  fontWeight: FontWeight.w500,                  fontSize: 16              ),            ),          ),          Container(            height: 40,            margin: EdgeInsets.only(left: 15,right: 15,top: 10),            decoration: BoxDecoration(                shape: BoxShape.rectangle,                borderRadius: BorderRadius.all(Radius.circular(4)),                border: Border.all(                    color: Color(0xFFE4E4E4),                    width: 1                )            ),            child: TextField(                style:TextStyle(                    color: Color(0xFF333333),                    fontSize: 12                ),                decoration: InputDecoration(                    hintText: tr("請輸入你的電話號碼"),                    border:  InputBorder.none,                    contentPadding: EdgeInsets.all(10.0)                )            ),          ),          GCButton(title: "提交",marginEdg: EdgeInsets.only(left: 65,right: 65,top: 80),onPressed: (){          },)        ],      ),    );  }}