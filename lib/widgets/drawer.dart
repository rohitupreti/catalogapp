import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.cyanAccent,
        child: ListView(
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.cyan),
                  margin: EdgeInsets.zero,
                  accountName: Text("rohit"),
                  accountEmail: Text("a@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/face.jpg"),
                  ),
                  //currentAccountPicture: Image.network("https://www.techfunnel.com/wp-content/uploads/2017/12/7-Types-of-Hackers.jpg"),
                )),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.black,
              ),
              title: Text("Home",
                  textScaleFactor: 1.5, style: TextStyle(color: Colors.white)),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.black,
              ),
              title: Text("Profile",
                  textScaleFactor: 1.5, style: TextStyle(color: Colors.white)),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.black,
              ),
              title: Text("Mail",
                  textScaleFactor: 1.5, style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
