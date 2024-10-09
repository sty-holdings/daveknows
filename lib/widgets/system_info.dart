import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:daveknows/models/constants.dart';
import 'package:daveknows/widgets/base_widget.dart';

class SystemInfoWidget extends BaseWidget {
  SystemInfoWidget(super.provider);

  @override
  Widget buildUI(BuildContext context, ThemeData theme) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return displayBackendInfo();
  }

  Padding displayBackendInfo() {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            pageHeading(Constants.LBL_System_info),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  Constants.LBL_Backend_Settings,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            buildBackendInfoLine(Constants.LBL_Version, sharedModel.backendSettings.version),
            buildBackendInfoLine(Constants.LBL_Environment, sharedModel.backendSettings.environment),
            buildBackendInfoLine(Constants.LBL_Message_Prefix, sharedModel.backendSettings.messagePrefix),
            buildBackendInfoLine(Constants.LBL_Secured, sharedModel.backendSettings.secured.toString()),
            // const SizedBox(height: 10),
            // const Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //     Text(
            //       Constants.LBL_HTTP_Settings,
            //       textAlign: TextAlign.left,
            //       style: TextStyle(
            //         color: Colors.black,
            //         fontSize: 22,
            //       ),
            //     ),
            //   ],
            // ),
            // buildBackendInfoLine(Constants.LBL_Version, sharedModel.backendSettings.version),
            // buildBackendInfoLine(Constants.LBL_Environment, sharedModel.backendSettings.environment),
            // buildBackendInfoLine(Constants.LBL_Message_Prefix, sharedModel.backendSettings.messagePrefix),
          ],
        ));
  }

  Padding buildBackendInfoLine(String rowLabel, String rowValue) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
        child: Container(
            margin: const EdgeInsets.all(10),
            // height: 57,
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  SizedBox(
                      child: Text(
                        rowLabel,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      )),
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        child: Text(
                          rowValue,
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ))
                  ],
                )
              ],
            )));
  }
}
