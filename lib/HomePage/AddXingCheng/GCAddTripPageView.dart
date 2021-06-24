import 'package:easy_localization/easy_localization.dart';import 'package:flutter/cupertino.dart';import 'package:flutter/material.dart';class GCAddTripPageView extends StatefulWidget{  @override  State<StatefulWidget> createState() {    // TODO: implement createState    return GCAddTripPageState();  }}class GCAddTripPageState extends State<GCAddTripPageView>{  @override  Widget build(BuildContext context) {    // TODO: implement build    return Scaffold(     appBar: PreferredSize(         preferredSize: Size(MediaQuery.of(context).size.width,45),         child:Container(           child: AppBar(               backgroundColor: Colors.transparent,               elevation: 0,               centerTitle: true,               title: Text(tr("新增行程"),                 style: TextStyle(fontSize: 18,),               ),               leading: IconButton(                 icon: Icon(Icons.arrow_back_ios_outlined),                 onPressed: (){                   Navigator.of(context).pop();                 },               ),               actions: [                 TextButton(onPressed: (){                   setState(() {                   });                 }, child: Text(                   tr("保存"),                   style: TextStyle(                       color: Colors.white,                       fontSize: 14                   ),                 )                 )               ]           ),           decoration: BoxDecoration(               image: DecorationImage(                   image: ExactAssetImage("assets/iOSNavBar/daohanglan.png"),                   fit: BoxFit.cover               )           ),         )),      body:  Container(        margin: EdgeInsets.only(left: 15,right: 15),        width: MediaQuery.of(context).size.width,        child: Column(          children: [            Container(              child:TextField(                style: TextStyle(                    color: Color(0xFF333333),                    fontSize: 14                ),                decoration: InputDecoration(                  hintText: tr("請輸入行程")                ),              ),              decoration: BoxDecoration(                border: Border(                  bottom: BorderSide(color: Color(0xFFE4E4E4),width: 1)                )              ),            ),            GCAddTripItem(title: "開始", content: "2012年1月19日 星期伍 18：00",index: 0,),            GCAddTripItem(title: "結束", content: "18：00",index: 1),            GCAddTripItem(title: "行程標註", content: "工作",index: 2),            GCAddTripItem(title: "行程提醒", content: "開始前30分鐘",index: 3),            Container(              margin: EdgeInsets.only(top: 10),              height: 20,              alignment: Alignment.centerLeft,              child: Text(                tr("行程内容"),                style: TextStyle(                  color: Color(0xFF333333),                  fontSize: 14                ),              ),            ),            Container(              child:TextField(                style: TextStyle(                    color: Color(0xFF333333),                    fontSize: 14                ),                decoration: InputDecoration(                    hintText: tr("請輸入行程")                ),                maxLines: 99,                minLines: 1,                keyboardType:TextInputType.multiline ,              ),              decoration: BoxDecoration(                  border: Border(                      bottom: BorderSide(color: Color(0xFFE4E4E4),width: 1)                  )              ),            ),          ],        ),      ),    );  }  }class GCAddTripItem extends StatefulWidget{  String title="";  String content = "";  int index = 0;  GCAddTripItem({required this.title,required this.content,required this.index}):super();  @override  State<StatefulWidget> createState() {    // TODO: implement createState    return GCAddTripItemState();  }}class GCAddTripItemState extends State<GCAddTripItem>{  @override  Widget build(BuildContext context) {    // TODO: implement build    return Container(      height: 40,      child: Row(        mainAxisAlignment: MainAxisAlignment.spaceBetween,        children: [          Text(            widget.title,            style: TextStyle(              color: Color(0xFF333333),              fontSize: 14            ),          ),          Spacer(),          Container(            margin: EdgeInsets.only(right: 10),            alignment: Alignment.centerRight,            height: 8,width: 8,            decoration: BoxDecoration(              shape: BoxShape.circle,              color: widget.index ==2?Color(0xFF00D0B6):Colors.white            ),          ),          Text(            tr(widget.content),            textAlign: TextAlign.right,            style: TextStyle(                color: Color(0xFF333333),                fontSize: 14            ),          ),          Container(            height: 16,width: 16,            decoration: BoxDecoration(              image: DecorationImage(                image:AssetImage("assets/homepage/right_anchor/icon_youjiantou_X@2x.png")              )            ),          )        ],      ),    );  }}