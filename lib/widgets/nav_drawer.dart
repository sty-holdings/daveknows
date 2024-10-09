import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:daveknows/models/constants.dart';
import 'package:daveknows/models/user_profile.dart';
import 'package:daveknows/components/shared_UI.dart';

class NavDrawer extends StatelessWidget {
  final UserProfile profile;

  const NavDrawer(this.profile, {super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return Drawer(
      backgroundColor: Constants.Sec_Cyan,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(profile),
          _displayListTitle(context, Icons.home_filled, Colors.black, Constants.LBL_Home, Constants.LM_listTileVeryStrongText, Constants.NAV_HOME),
          _displayListTitle(
              context, Icons.view_list_outlined, Colors.black, Constants.LBL_History, Constants.LM_listTileLargeText, Constants.NAV_HISTORY),
          _displayListTitle(context, Icons.badge_outlined, Colors.black, Constants.LBL_Coming_Soon, Constants.LM_listTileLargeText, null),
          SharedUI.displayDivider(0, 15, 0, 0),
          _displayListTitle(context, Icons.highlight_off, Colors.black, Constants.LBL_Logout, Constants.LM_listTileText, Constants.NAV_LOGIN),
        ],
      ),
    );
  }
}

Widget _createHeader(UserProfile profile) {
  return DrawerHeader(
      padding: EdgeInsets.zero,
      child: Container(
          color: Constants.Sec_Cyan,
          padding: const EdgeInsets.all(15),
          child: ListView(padding: EdgeInsets.zero, children: <Widget>[
            CircleAvatar(
              radius: 50,
              child: profile.avatar,
            ),
            const SizedBox(height: 5),
            if (profile.firstName != null && profile.lastName != null)
              Text(
                '${profile.firstName} ${profile.lastName}',
                style: const TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
          ])));
}

ListTile _displayListTitle(context, myIcon, myIconColor, myTitle, myTitleStyle, myNav) {
  if (myNav == null) {
    return ListTile(
      leading: Icon(myIcon, color: myIconColor),
      title: Text(
        myTitle,
        style: myTitleStyle,
      ),
    );
  } else {
    return ListTile(
      leading: Icon(myIcon, color: myIconColor),
      title: Text(
        myTitle,
        style: myTitleStyle,
      ),
      onTap: () => {Navigator.popAndPushNamed(context, myNav)},
    );
  }
}
