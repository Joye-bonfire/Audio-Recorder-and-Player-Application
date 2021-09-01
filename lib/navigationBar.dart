import 'package:Anantha/navigationDrawerWidget.dart';
import 'package:flutter/material.dart';

class NavigationBar extends StatelessWidget {
  //const ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
        alignment: Alignment.bottomCenter,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: NavBarItem(
                  icon: Icons.arrow_back_ios,
                )),
            //SizedBox(width: 100),
            Text(
              'Playing now',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
            ),
            //SizedBox(width: 100),
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NavigationDrawerWidget()));
              },
              icon: NavBarItem(
                icon: Icons.menu,
              ),
            ),
          ],
        ));
  }
}

class NavBarItem extends StatelessWidget {
  final IconData icon;
  const NavBarItem({Key key, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      child: Icon(
        icon,
        color: Colors.black,
      ),
    );
  }
}
