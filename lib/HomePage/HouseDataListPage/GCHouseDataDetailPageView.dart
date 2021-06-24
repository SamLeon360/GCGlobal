import 'package:easy_localization/easy_localization.dart';import 'package:flutter/cupertino.dart';import 'package:flutter/material.dart';import 'package:tab_indicator_styler/tab_indicator_styler.dart';class GCHouseDataDetailPageView extends StatefulWidget{  @override  State<StatefulWidget> createState() {    // TODO: implement createState    return GCHouseDataDetailState();  }}class GCHouseDataDetailState extends State<GCHouseDataDetailPageView> with TickerProviderStateMixin {  ScrollController _scrollController = new ScrollController();  double opacity = 0.0;  List<Widget> _tabs = <Widget>[    Tab(      child: Column(        children: [          Container(            // child: ,          ),          Container(            height: 500,            color: Colors.red,          )        ],      ),    ),  ];  List<Widget> _tabViews = <Widget>[    Column(      children: [        Container(          height: 500,          color: Colors.blue,        ),        Container(          height: 500,          color: Colors.red,        )      ],    )  ];  TabController? _tabController;  TabController? _tagTabController;  @override  void initState() {    super.initState();    this._tabController = TabController(length: _tabs.length, vsync: this);    this._tagTabController = TabController(length: 5,vsync: this);  }  @override  void dispose() {    // TODO: implement dispose    super.dispose();  }  @override  Widget build(BuildContext context) {    // TODO: implement build    return Scaffold(      body:CustomScrollView(        slivers: [          SliverPersistentHeader(            floating: true,            pinned: true,            delegate: SliverCustomHeaderDelegate(              collapsedHeight:90.0,              expandedHeight: MediaQuery.of(context).size.width*(266.0/375.0),              paddingTop: 43.0,              coverImgUrl:              "http://img1.mukewang.com/5c18cf540001ac8206000338.jpg",              title: "练习",              tagTabController: _tagTabController            ),          ),          SliverList(            delegate: SliverChildBuilderDelegate(                  (BuildContext context, int index) {                return Column(                  children: [                    Container(                      height: 500,                      color: Colors.blue,                    ),                    Container(                      height: 500,                      color: Colors.red,                    )                  ],                );              },              childCount: 1,            ),          )        ],      ),    );  }}class SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {  final double collapsedHeight;  ///折叠的高度  final double expandedHeight;  ///展开的高度  final double paddingTop;  final String coverImgUrl;  final String title;  double opacity = 0.0;  bool isBlackIcon = false;  TabController? tagTabController;  SliverCustomHeaderDelegate({    required this.collapsedHeight,    required this.expandedHeight,    required this.paddingTop,    required this.coverImgUrl,    required this.title,    required this.tagTabController  });  Color makeStickyHeaderBgColor(shrinkOffset) {    final int alpha = (shrinkOffset / (this.maxExtent - this.minExtent) * 255)        .clamp(0, 255)        .toInt();    return Color.fromARGB(alpha, 255, 255, 255);  }  Color makeStickyHeaderTextColor(shrinkOffset, isIcon) {    if (shrinkOffset <= 50) {      return isIcon ? Colors.white : Colors.transparent;    } else {      final int alpha = (shrinkOffset / (this.maxExtent - this.minExtent) * 255)          .clamp(0, 255)          .toInt();      if(alpha > 180){        this.isBlackIcon = true;      }else{        this.isBlackIcon = false;      }      return Color.fromARGB(alpha, 0, 0, 0);    }  }  @override  Widget build(BuildContext context, double shrinkOffset,      bool overlapsContent) {    return Container(      height: this.maxExtent,      width: MediaQuery          .of(context)          .size          .width,      child: Stack(        fit: StackFit.expand,        children: <Widget>[          // 背景图          Container(            decoration: BoxDecoration(              image: DecorationImage(                image: NetworkImage(this.coverImgUrl),                fit: BoxFit.cover              ),            ),            child: Stack(              children: [                Center(                  child: Container(                    height: 50,                    width: 50,                    decoration: BoxDecoration(                        image: DecorationImage(                            image: AssetImage("assets/homepage/play_icon/icon_bofang@2x.png")                        )                    ),                  ),                ),                Positioned(                    child:Align(                      child:Row(                        mainAxisAlignment: MainAxisAlignment.center,                        crossAxisAlignment: CrossAxisAlignment.center,                        children: [                          Container(                            height:20,                            padding: EdgeInsets.only(left: 13,right: 13,top: 2,bottom: 4),                            child: Text(                              tr("視頻"),                              textAlign: TextAlign.center,                              style: TextStyle(                                  color: Colors.white,                                  fontSize: 12                              ),                            ),                            decoration: BoxDecoration(                                color:Color(0xFFB03725),                                shape: BoxShape.rectangle,                                borderRadius: BorderRadius.all(Radius.circular(15))                            ),                          ),                          Container(width: 20,),                          Container(                            height:20,                            padding: EdgeInsets.only(left: 13,right: 13,top: 2,bottom: 4),                            child: Text(                              tr("圖片"),                              textAlign: TextAlign.center,                              style: TextStyle(                                  color: Color(0xFF333333),                                  fontSize: 12                              ),                            ),                            decoration: BoxDecoration(                                color:Colors.white,                                shape: BoxShape.rectangle,                                borderRadius: BorderRadius.all(Radius.circular(15))                            ),                          )                        ],                      ),                      alignment: Alignment.bottomCenter,                    ),                  bottom: 30,                  width: MediaQuery.of(context).size.width,                ),                Positioned(                  child: Container(                    width: MediaQuery.of(context).size.width,                    height: 14,                    decoration: BoxDecoration(                        color: Colors.white,                        shape: BoxShape.rectangle,                        borderRadius: BorderRadius.only(topLeft: Radius.circular(14),topRight: Radius.circular(14))                    ),                  ),                  bottom: 0,                )              ],            ),          ),          // 收起头部          Positioned(            left: 0,            right: 0,            top: 0,            child:Stack(              children: [                Positioned(child: Opacity(                  child: Container(                      height: 136,                      color: makeStickyHeaderBgColor(shrinkOffset),                  ),                  opacity:  (shrinkOffset/(MediaQuery.of(context).size.width*(266.0/375.0) - 58)<=0?0:((shrinkOffset/(MediaQuery.of(context).size.width*(266.0/375.0) - 58)>=1?1:shrinkOffset/(MediaQuery.of(context).size.width*(266.0/375.0) - 58)))),                ),),                SafeArea(                  bottom: false, child: Container(                  height: this.isBlackIcon? this.collapsedHeight+44:this.collapsedHeight,                  child: Column(                    children: [                      Row(                        mainAxisAlignment: MainAxisAlignment.spaceBetween,                        children: <Widget>[                          GestureDetector(                            child: Container(                              margin: EdgeInsets.only(left: 15),                              height: 24,width: 24,                              decoration: BoxDecoration(                                  image: DecorationImage(                                    image: !this.isBlackIcon? AssetImage("assets/homepage/left_anchor/icon_zuojiantou_B@2x.png"): AssetImage("assets/homepage/left_anchor/icon_zuojiantou_H@3x.png"),                                  )                              ),                            ),                            onTap: (){                            },                          ),                          Text(                            "樓盤詳情",                            style: TextStyle(                              fontSize: 20,                              fontWeight: FontWeight.w500,                              color: this.makeStickyHeaderTextColor(                                  shrinkOffset, false), // 标题颜色                            ),                          ),                          GestureDetector(                            child: Container(                              margin: EdgeInsets.only(right: 15),                              height: 24,width: 24,                              decoration: BoxDecoration(                                  image: DecorationImage(                                    image: this.isBlackIcon? AssetImage("assets/homepage/share_icon/icon_share_H@2x.png"): AssetImage("assets/homepage/share_icon/icon_fenxiang@2x.png"),                                  )                              ),                            ),                            onTap: (){                            },                          ),                        ],                      ),                      this.isBlackIcon?Container(                        margin: EdgeInsets.only(top: 10,left: 0,right: 0),                        child: TabBar(                          labelStyle: TextStyle( //up to your taste                              fontWeight: FontWeight.w500,                            color: Color(0xFF333333),                            fontSize: 14                          ),                          unselectedLabelStyle:  TextStyle( //up to your taste                              fontWeight: FontWeight.w400,                              color: Color(0xFF333333),                              fontSize: 14                          ),                          labelPadding: EdgeInsets.zero,                          indicatorPadding: EdgeInsets.only(bottom: 10),                          controller: this.tagTabController,                          indicatorSize: TabBarIndicatorSize.label, //makes it better                          labelColor: Color(0xFF333333), //Google's sweet blue                          unselectedLabelColor: Color(0xFF333333), //niceish grey                          isScrollable: false, //up to your taste                          indicatorColor: Color(0xFF333333),                          indicator: MaterialIndicator(                            height: 2,                            topLeftRadius: 0,                            topRightRadius: 0,                            bottomLeftRadius: 0,                            bottomRightRadius: 0,                            tabPosition: TabPosition.bottom,                            horizontalPadding: 10                          ),                          tabs: <Widget>[                            Tab(                              child: Container(                                child:Text(                                    "樓盤信息"                                )                              ),                            ),                            Tab(                              child: Container(                                  child:Text(                                      "360睇樓"                                  )                              )                            ),                            Tab(                              child: Container(                                  child:Text(                                      "地產文件"                                  )                              )                            ),                            Tab(                              child: Container(                                  child:Text(                                      "戶型介紹"                                  )                              )                            ),                            Tab(                              child: Container(                                  child:Text(                                      "樓盤位置"                                  )                              )                            )                          ],                        ),                      ):Container(),                    ],                  ),                ),),              ],            ),          ),        ],      ),    );  }  @override  double get maxExtent => this.expandedHeight;  @override  double get minExtent => this.collapsedHeight + this.paddingTop;  @override  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {    return true;  }}