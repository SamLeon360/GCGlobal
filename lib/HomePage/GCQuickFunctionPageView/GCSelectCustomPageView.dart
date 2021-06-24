import 'package:azlistview/azlistview.dart';import 'package:contacts_service/contacts_service.dart';import 'package:easy_localization/easy_localization.dart';import 'package:flutter/cupertino.dart';import 'package:flutter/material.dart';import 'package:gcglobal/Widghts/GCNavBar.dart';import 'package:lpinyin/lpinyin.dart';import 'package:permission_handler/permission_handler.dart';class GCSelectCustomPageView extends StatefulWidget{  @override  State<StatefulWidget> createState() {    // TODO: implement createState    return GCSelectCustomState();  }}class GCSelectCustomState extends State<GCSelectCustomPageView>{  int _suspensionHeight = 30;  int _itemHeight = 60;  final Permission _permission =  Permission.contacts ;  PermissionStatus _permissionStatus = PermissionStatus.denied;  List<String> tagList = [];  List<ContactInfoModel> dataList = [    new ContactInfoModel(name: "輝1", phone: "87654321",namePinyin: '',tagIndex:""),    new ContactInfoModel(name: "輝2", phone: "87654321",namePinyin: '',tagIndex:""),    new ContactInfoModel(name: "輝", phone: "87654321",namePinyin: '',tagIndex:""),    new ContactInfoModel(name: "聰", phone: "87654321",namePinyin: '',tagIndex:""),    new ContactInfoModel(name: "庭", phone: "87654321",namePinyin: '',tagIndex:""),    new ContactInfoModel(name: "傑", phone: "87654321",namePinyin: '',tagIndex:""),    new ContactInfoModel(name: "玲", phone: "87654321",namePinyin: '',tagIndex:""),  ];  _openContactBook() async{    if(await Permission.contacts.status.isGranted){      Iterable<Contact> contacts = await ContactsService.getContacts();      List<Contact> contactList = contacts.toList();      setState(() {        for ( int i = 0 ;i<contactList.length ; i++){          Contact contact = contactList[i];          Item phone = contact.phones!.toList().last;          if(phone.value.toString().length == 8) {            dataList.add(new ContactInfoModel(                name: contact.displayName.toString(),                tagIndex: "",                namePinyin: "",                phone: phone.value.toString()));          }        }      });      _handleList(dataList);    }  }  Future<void> requestPermission(Permission permission) async {    final status = await permission.request();      setState(() {        _permissionStatus = status;      });  }  void _listenForPermissionStatus() async {    final status = await _permission.status;    setState(() => _permissionStatus = status);    if(_permissionStatus == PermissionStatus.granted){      _openContactBook();    }else if(_permissionStatus == PermissionStatus.denied){        requestPermission(_permission);    }  }  @override  void initState() {    // TODO: implement initState    super.initState();    _listenForPermissionStatus();  }  @override  Widget build(BuildContext context) {    // TODO: implement build    return Scaffold(      appBar: GCNavBar(title: tr("選擇簽訂人"),leftIcon:Icon(Icons.arrow_back_ios_outlined),rightIcon1: null,rightIcon2: null,        onPressed1:null,        onPressed2: null,      ),      body: Container(        color: Colors.white,        child: Column(          children: [            Container(              height: 50,              color: Colors.white,              child: Container(                margin: EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 10),                decoration: BoxDecoration(                  color: Color(0xFFF4F4F4),                  shape: BoxShape.rectangle,                  borderRadius: BorderRadius.all(Radius.circular(4))                ),                child: Row(                  mainAxisAlignment: MainAxisAlignment.center,                  crossAxisAlignment: CrossAxisAlignment.center,                  children: [                    Container(                      height: 16,                      width: 16,                      margin: EdgeInsets.only(left: (MediaQuery.of(context).size.width-60)/3.5),                      decoration: BoxDecoration(                        image: DecorationImage(                          image: AssetImage("assets/homepage/searchicon/icon_sousuo_X@3x.png")                        )                      ),                    ),                    Expanded(child: Container(                      margin: EdgeInsets.only(left: 15,right: 20),                      child: TextField(                        decoration: InputDecoration.collapsed(hintText: "請輸入客戶姓名或電話號碼",                            hintStyle: TextStyle(                                fontSize: 12,                                color: Color(0xFF999999),                                fontWeight: FontWeight.w500                            )                        ),                        style: TextStyle(                            fontSize: 12,                            fontWeight: FontWeight.w500                        ),                      ),                    ))                  ],                ),              ),            ),            Expanded(              flex: 1,              child: AzListView(                data: dataList,                itemCount: dataList.length,                itemBuilder: (context , index) => ContactListItem(dataList[index]),                indexBarData: SuspensionUtil.getTagIndexList(dataList),                indexHintBuilder: (context, hint) {                  return Container(                    alignment: Alignment.center,                    width: 60.0,                    height: 60.0,                    decoration: BoxDecoration(                      color: Color(0xFFE4E4E4),                      shape: BoxShape.circle,                    ),                    child:                    Text(hint, style: TextStyle(color: Colors.white, fontSize: 30.0)),                  );                },              ),            )          ],        ),      ),    );  }  Widget _buildSusWidget(String susTag) {    return Container(      padding: EdgeInsets.symmetric(horizontal: 15.0),      height: _suspensionHeight.toDouble(),      width: double.infinity,      alignment: Alignment.centerLeft,      color: Color(0xFFF4F4F4),      child: Text(        '$susTag',        style: TextStyle(          fontSize: 12,          color: Color(0xFF333333)        ),      ),    );  }  void _handleList(List<ContactInfoModel> list) {    if (list.isEmpty) return;    for (int i = 0, length = list.length; i < length; i++) {      String pinyin = PinyinHelper.getPinyinE(list[i].name);      String tag = pinyin.substring(0, 1).toUpperCase();      list[i].namePinyin = pinyin;      if (RegExp("[A-Z]").hasMatch(tag)) {        list[i].tagIndex = tag;      } else {        list[i].tagIndex = "#";      }    }    //根据A-Z排序    SuspensionUtil.sortListBySuspensionTag(list);    // show sus tag.    SuspensionUtil.setShowSuspensionStatus(list);  }    // ignore: non_constant_identifier_names  Widget ContactListItem(ContactInfoModel info){    String susTag = info.getSuspensionTag();    return Column(      children: [        Offstage(          offstage: info.isShowSuspension != true,          child: _buildSusWidget(susTag),        ),        SizedBox(          height: _itemHeight.toDouble(),          child: Container(            height: 60,            decoration: BoxDecoration(                color: Colors.white,                border: Border(bottom: BorderSide(color: Color(0xFFE4E4E4)))            ),            child: Row(              children: [                Container(                  height: 40,                  width: 40,                  margin: EdgeInsets.only(left: 15,top: 10,bottom: 10),                  decoration: BoxDecoration(                      shape: BoxShape.circle,                      image: DecorationImage(                          image: NetworkImage("http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKS9uphicXUAs5ribqEZ7ictJFibap6gn2qZFLDPjB4Z3x0LKMbvibAU9mWQYmwOXGoR6Lyiazpsp8e3fYw/132")                      )                  ),                ),                Expanded(child: Container(                  margin: EdgeInsets.only(left: 12),                  child: Text(                    info.name,                    style: TextStyle(                        color: Color(0xFF333333),                        fontSize: 16                    ),                  ),                ),),                Container(                  margin: EdgeInsets.only(right: 55),                  child: Text(                    tr("電話：")+info.phone,                    style: TextStyle(                        color: Color(0xFF333333),                        fontSize: 16                    ),                  ),                )              ],            ),          ),        )      ],    );  }}class ContactInfoModel extends ISuspensionBean{  String name = "";  String tagIndex = "";  String namePinyin = "";  String phone = "";  ContactInfoModel({    required this.name,    required this.tagIndex,    required this.namePinyin,    required this.phone  });  ContactInfoModel.fromJson(Map<String, dynamic> json)      : name = json['name'] == null ? "" : json['name'];  Map<String, dynamic> toJson() => {    'name': name,    'tagIndex': tagIndex,    'namePinyin': namePinyin,    'isShowSuspension': isShowSuspension  };  @override  String getSuspensionTag() => tagIndex;}