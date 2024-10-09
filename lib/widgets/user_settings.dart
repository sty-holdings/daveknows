import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:daveknows/models/constants.dart';
import 'package:daveknows/models/locales.dart';
import 'package:daveknows/widgets/base_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:daveknows/components/shared_UI.dart';


class UserSettingsWidget extends BaseWidget {
  UserSettingsWidget(super.provider) {
    sharedModel.displaySideNav = true;
  }

  @override
  Widget buildUI(BuildContext context, ThemeData theme) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return Center(
        child: Column(
      children: <Widget>[
        pageHeading('${sharedModel.profile.firstName}${L10nApp.titleUserSettings}'),
        const SizedBox(height: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            buildGesture(Constants.NAV_USER_PROFILE, Constants.LBL_Profile, Icons.mode_edit_outline, null),
            const SizedBox(height: 20),
            buildGesture(Constants.NAV_USER_SECURITY, Constants.LBL_Security, Icons.lock_outlined, null),
            const SizedBox(height: 20),
            SharedUI.displayDivider(0, 15, 0, 0),
            const SizedBox(height: 20),
            buildGesture(null, Constants.LBL_Privacy_Policy, Icons.launch_outlined, 'index.php/privacy-policy/'),
            const SizedBox(height: 20),
            buildGesture(null, Constants.LBL_Data_Protection_Policy, Icons.launch_outlined, 'index.php/data-protection/'),
            const SizedBox(height: 20),
            buildGesture(null, Constants.LBL_Close_Account, Icons.launch_outlined, 'index.php/close-account//'),
            const SizedBox(height: 20),
            SharedUI.displayDivider(0, 15, 0, 0),
            const SizedBox(height: 20),
            buildGesture(Constants.NAV_SYSTEM_INFO, Constants.LBL_System_info, Icons.info_outline, null),
          ],
        ),
      ],
    ));
  }

  Widget buildGesture(String? navigation, String label, IconData displayIcon, String? navUrl) {
    if (navigation == null) {
      return buildWebGesture(navUrl!, label, displayIcon);
    } else {
      return buildLocalGesture(navigation, label, displayIcon);
    }
  }

  Widget buildLocalGesture(String navigation, String label, IconData displayIcon) {
    return GestureDetector(
      onTap: () {
        goNext(navigation);
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          Icon(
            displayIcon,
            size: 30,
          )
        ]),
      ),
    );
  }

  Widget buildWebGesture(String navPath, String label, IconData displayIcon) {
    var httpsUri = Uri(
        scheme: 'https',
        host: 'savup.com',
        path: navPath);
    return GestureDetector(
      onTap: () async {
        if (await launchUrl(httpsUri)) {
        } else {
          throw 'Could not launch savup.com page: $navPath';
        }
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          Icon(
            displayIcon,
            size: 30,
          )
        ]),
      ),
    );
  }
}
