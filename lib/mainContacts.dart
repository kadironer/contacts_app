import 'package:contacts_app/phoneCall.dart';
import 'package:contacts_app/users.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainContacts extends StatefulWidget {
  const MainContacts({Key? key}) : super(key: key);

  @override
  State<MainContacts> createState() => _MainContactsState();
}

class _MainContactsState extends State<MainContacts> {


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: TabBar(
            indicatorColor: Colors.transparent,
            automaticIndicatorColorAdjustment: true,
            tabs: [
              Tab(
                icon: Icon(CupertinoIcons.phone_circle_fill, color: Colors.green,size: 40,),
              ),
              Tab(
                icon: Icon(CupertinoIcons.profile_circled,color: Colors.blueAccent, size: 40,),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            PhoneCall(),
            Users(),
          ],
        ),
      ),
    );
  }
}
