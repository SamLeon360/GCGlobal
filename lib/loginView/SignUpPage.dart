import 'package:flutter/cupertino.dart';import 'package:flutter/material.dart';import 'package:gcglobal/Widghts/GCButton.dart';import 'package:gcglobal/Widghts/GCInputWidget.dart';import 'package:gcglobal/Widghts/GCNavBar.dart';import 'package:gcglobal/loginView/forgetPwdPage.dart';class SignUpPage extends StatelessWidget{  @override  Widget build(BuildContext context) {    // TODO: implement build    return Scaffold(      appBar: GCNavBar(        title:"title",leftIcon:Icon(Icons.arrow_back_ios_outlined),rightIcon1: Icon(Icons.ac_unit_outlined),rightIcon2: null,        onPressed1: (){        } ,        onPressed2: (){        },      ),      body: Column(        children: [          ///验证码输入框          GCCodeInputWidget(marginEdg: EdgeInsets.only(left: 15,right: 15,top:22)),          ///验证码          GCInputWidght(title: "code_text",hintText: "pleace_code",marginEdg: EdgeInsets.only(left: 15,right: 15,top:22),),          ///设置密码          GCInputWidght(title: "password_text",hintText: "pleace_password",marginEdg: EdgeInsets.only(left: 15,right: 15,top:22),),          ///注册按钮          GCButton(title: 'register',marginEdg: EdgeInsets.only(left: 65,right: 65,top: 80),onPressed: (){            Navigator.push(context, MaterialPageRoute(builder: (context) {              return forgetPwdPage();            }));          },)        ],      ),    );  }}