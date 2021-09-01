import 'package:Anantha/loginScreen.dart';
import 'package:Anantha/profile.dart';
import 'package:flutter/material.dart';
import './playerPage.dart';

class NavigationDrawerWidget extends StatefulWidget {
  //const NavigationDrawerWidget({ Key? key }) : super(key: key);

  @override
  _NavigationDrawerWidgetState createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //  Admob.initialize(testDeviceIds: 'ca-app-pub-1581282519029904~7431798424');
  }

  @override
  Widget build(BuildContext context) {
    String name = 'Ted Mosby';
    String email = 'tedmosby@mosby.com';
    return Drawer(
      child: Material(
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [
                Color(0x660da8f4),
                Color(0x8c0da8f4),
                Color(0xb30da8f4),
                Color(0xd90da8f4),
                Color(0xff0da8f4),
              ])),
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            children: [
              BuildHeader(
                name: name,
                email: email,
                url:
                    'https://images.unsplash.com/photo-1552374196-c4e7ffc6e126?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1268&q=80',
                onClicked: () => selectedItem(context, 0),
              ),
              SizedBox(
                height: 30,
              ),
              // Divider(
              //   color: Colors.white,
              // ),
              MenuItem(
                text: 'Profile',
                icon: Icons.person,
                onClick: () => selectedItem(context, 0),
              ),
              SizedBox(
                height: 30,
              ),
              MenuItem(
                text: 'Play Now',
                icon: Icons.play_arrow,
                onClick: () => selectedItem(context, 1),
              ),
              SizedBox(
                height: 30,
              ),
              Divider(
                color: Colors.white,
              ),
              MenuItem(
                text: 'Logout',
                icon: Icons.logout,
                onClick: () => selectedItem(context, 2),
              ),
              SizedBox(
                height: 300,
              ),
              Container(
                color: Colors.grey,
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onClick;
  MenuItem({Key key, this.text, this.icon, this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = Colors.white;
    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(
        text,
        style: TextStyle(color: color, fontSize: 20),
      ),
      hoverColor: Colors.white30,
      onTap: onClick,
    );
  }
}

void selectedItem(BuildContext context, int index) {
  switch (index) {
    case 0:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Profile()));
      break;
    case 1:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PlayerPage()));
      break;
    case 2:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
      break;
    case 2:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
      break;
  }
}

class BuildHeader extends StatelessWidget {
  final String name;
  final String email;
  final String url;
  VoidCallback onClicked;
  BuildHeader({Key key, this.name, this.email, this.url, this.onClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClicked,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 40),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(url),
            ),
            SizedBox(
              width: 25,
            ),
            Column(
              children: [
                Text(
                  name,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  email,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
