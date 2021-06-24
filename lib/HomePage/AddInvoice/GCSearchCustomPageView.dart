import 'package:easy_localization/easy_localization.dart';import 'package:flutter/cupertino.dart';import 'package:flutter/material.dart';class GCSearchCustomPageView extends StatefulWidget{  List<GCSearchCustomModel> customList = [    new GCSearchCustomModel(name: "陳曉",phone: "8888 8888"),    new GCSearchCustomModel(name: "陳曉",phone: "8888 8888"),    new GCSearchCustomModel(name: "陳曉",phone: "8888 8888"),    new GCSearchCustomModel(name: "陳曉",phone: "8888 8888"),  ];  @override  State<StatefulWidget> createState() {    // TODO: implement createState    return GCSearchCustomState();  }}class GCSearchCustomState extends State<GCSearchCustomPageView>{  @override  void initState() {    // TODO: implement initState    widget.customList = [      new GCSearchCustomModel(name: "陳曉",phone: "8888 8888"),      new GCSearchCustomModel(name: "陳曉",phone: "8888 8888"),      new GCSearchCustomModel(name: "陳曉",phone: "8888 8888"),      new GCSearchCustomModel(name: "陳曉",phone: "8888 8888"),    ];    super.initState();  }  @override  Widget build(BuildContext context) {    // TODO: implement build    return Container(      color: Colors.white,      child: SafeArea(          top: true,          child:  Container(            color: Colors.white,            child: Column(              children: [                Container(                  height: 44,                  color: Colors.white,                  child: Row(                    children: [                      Container(                        height: 24,width: 24,                        margin: EdgeInsets.only(left: 15,right:10 ),                        decoration: BoxDecoration(                            image:  DecorationImage(                                image: AssetImage("assets/homepage/left_anchor/icon_zuojiantou_H@3x.png")                            )                        ),                      ),                      Expanded(child: Container(                        height: 34,                        decoration: BoxDecoration(                            color: Color(0xFFE4E4E4),                            shape: BoxShape.rectangle,                            borderRadius: BorderRadius.all(Radius.circular(4))                        ),                        child: Row(                          children: [                            Container(                              margin: EdgeInsets.only(left: 11,right: 10),                              height: 16,width: 16,                              decoration: BoxDecoration(                                  image: DecorationImage(                                      image: AssetImage("assets/homepage/searchicon/icon_sousuo_X@3x.png")                                  )                              ),                            ),                            Expanded(child: TextField(                              decoration: InputDecoration(                                  hintText: tr("請輸入搜索內容"),                                  border: InputBorder.none                              ),                              style: TextStyle(                                  color: Color(0xFF333333),                                  fontSize: 12                              ),                            ))                          ],                        ),                      )),                      Container(                        height: 34,                        width: 57,                        margin: EdgeInsets.only(left: 10,right: 15),                        alignment: Alignment.center,                        decoration: BoxDecoration(                            color: Color(0xFFB03725),                            shape: BoxShape.rectangle,                            borderRadius: BorderRadius.all(Radius.circular(4))                        ),                        child: Text(                          tr("搜索"),                          style: TextStyle(                              color: Colors.white,                              fontSize: 12                          ),                        ),                      )                    ],                  ),                ),                ListView.builder(itemBuilder: (context,index){                    GCSearchCustomModel model = widget.customList[index];                    return GCSearchCustomItem(model: model);                  },                  itemCount: widget.customList.length,                  shrinkWrap: true,                )              ],            ),          )      ),    );  }}class GCSearchCustomModel extends Object{  String name = "";  String phone = "";  GCSearchCustomModel({required this.name,required this.phone}):super();}class GCSearchCustomItem extends StatelessWidget{  GCSearchCustomModel model ;  GCSearchCustomItem({required this.model}):super();  @override  Widget build(BuildContext context) {    // TODO: implement build    return Container(      height: 60,      alignment: Alignment.centerLeft,      padding: EdgeInsets.only(left: 15,right: 15),      child: Container(        alignment: Alignment.center,        decoration: BoxDecoration(          border: Border(bottom: BorderSide(color: Color(0xFFE4E4E4)))        ),        child: Row(          mainAxisAlignment: MainAxisAlignment.spaceBetween,          children: [            Text(              model.name,              style: TextStyle(                fontSize: 14,                color: Color(0xFF333333)              ),            ),            Spacer(),            Text(              tr("電話：")+model.phone,              style: TextStyle(                  fontSize: 14,                  color: Color(0xFF333333)              ),            )          ],        ),      )    );  }}