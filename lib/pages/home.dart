import 'package:flutter/services.dart';
import 'package:daveknows/index.dart';
import 'package:flutter/material.dart';
import 'package:daveknows/models/constants.dart';
import 'package:daveknows/models/locales.dart';
import 'package:daveknows/widgets/base_widget.dart';


class HomePage extends BaseWidget {
  final formKey = GlobalKey<FormState>();
  final fnKey = GlobalKey<FormFieldState>();
  final lnKey = GlobalKey<FormFieldState>();
  final emailKey = GlobalKey<FormFieldState>();
  final passKey = GlobalKey<FormFieldState>();
  final rePassKey = GlobalKey<FormFieldState>();
  final formatter = NumberFormat.currency(symbol: Constants.currencySymbol, decimalDigits: 2);

  HomePage(super.provider) {
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
            pageHeading('${L10nApp.titleHome} ${sharedModel.profile.firstName}'),
            const SizedBox(height: 10),
            // User Info
            Container(
              margin: const EdgeInsets.all(10),
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 3,
                    offset: const Offset(5, 5), // changes position of shadow
                  ),
                ],
              ),
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                const SizedBox(width: 10),
                CircleAvatar(radius: 25, child: sharedModel.profile.avatar),
                const SizedBox(width: 25),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Currently Lent:',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Lifetime Return:',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
              ]),
            ),
            const SizedBox(height: 10),
            // Quick Navigation
            // On-boarding check list
            _buildToDoList(theme)
          ],
        ));
  }

  Container _buildToDoList(ThemeData theme) {
    return Container(
        margin: const EdgeInsets.all(10),
        height: 300,
        width: 600,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 3,
              offset: const Offset(5, 5), // changes position of shadow
            ),
          ],
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
          const SizedBox(width: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 10),
              Icon(Icons.pending_actions_outlined, size: 50),
              Text(Constants.LBL_ToDo_list, textAlign: TextAlign.center, style: Constants.LM_listTileVeryStrongText),
              SizedBox(width: 10),
            ],
          ),
          const SizedBox(height: 10),
          ...createToDoList(theme),
        ]));
  }

  List<Row> createToDoList(ThemeData theme) {
    List<Row> list = [];
    if (sharedModel.toDoList.isEmpty) {
      list.add(
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 10),
            Text(Constants.LBL_Nothing_ToDo, textAlign: TextAlign.center, style: Constants.LM_listTileStrongText),
            SizedBox(width: 10),
          ],
        ),
      );
    } else {
      for (final todo in sharedModel.toDoList) {
        list.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.popAndPushNamed(context, todo.navigation ?? Constants.MISSING);
                  },
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(width: 5),
                        if (todo.status == Constants.STATUS_PENDING)
                          const Icon(Icons.check_box_outline_blank, size: 15),
                        if (todo.status == Constants.STATUS_COMPLETED) const Icon(Icons.check_box_outlined, size: 15),
                        const SizedBox(width: 5),
                        Text(todo.description ?? Constants.MISSING,
                            textAlign: TextAlign.center, style: Constants.LM_listTileText),
                        const SizedBox(width: 5),
                      ]))
            ],
          ),
        );
      }
    }
    return list;
  }
}
