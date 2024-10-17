import '/model/styh_theme.dart';
import '/model/flutter_flow_util.dart';
import '/model/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_account_page_model.dart';
export 'create_account_page_model.dart';

class CreateAccountPageWidget extends StatefulWidget {
  const CreateAccountPageWidget({super.key});

  @override
  State<CreateAccountPageWidget> createState() =>
      _CreateAccountPageWidgetState();
}

class _CreateAccountPageWidgetState extends State<CreateAccountPageWidget> {
  late CreateAccountPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateAccountPageModel());

    _model.emailAddressTextController ??= TextEditingController();
    _model.emailAddressFocusNode ??= FocusNode();

    _model.passwordTextController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();

    _model.passwordConfirmTextController ??= TextEditingController();
    _model.passwordConfirmFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: STYHTheme.secPurple,
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 8,
                child: Container(
                  width: 100.0,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    color: STYHTheme.secPurple,
                  ),
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 140.0,
                          decoration: const BoxDecoration(
                            color: STYHTheme.secPurple,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16.0),
                              bottomRight: Radius.circular(16.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                          ),
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                32.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'brand.ai',
                              // style: STYHTheme.of(context)
                              //     .displaySmall
                              //     .override(
                              //       fontFamily: 'Inter Tight',
                              //       letterSpacing: 0.0,
                              //     ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsets.all(32.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Create an account',
                                  // style: STYHTheme.of(context)
                                  //     .displaySmall
                                  //     .override(
                                  //       fontFamily: 'Inter Tight',
                                  //       letterSpacing: 0.0,
                                  //     ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 24.0),
                                  child: Text(
                                    'Let\'s get started by filling out the form below.',
                                    // style: STYHTheme.of(context)
                                    //     .labelMedium
                                    //     .override(
                                    //       fontFamily: 'Inter',
                                    //       letterSpacing: 0.0,
                                    //     ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 16.0),
                                  child: Container(
                                    width: 370.0,
                                    child: TextFormField(
                                      controller:
                                          _model.emailAddressTextController,
                                      focusNode: _model.emailAddressFocusNode,
                                      autofocus: true,
                                      autofillHints: [AutofillHints.email],
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Email',
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: STYHTheme.priPurpleDeep,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: STYHTheme.priPurpleDeep,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        // errorBorder: OutlineInputBorder(
                                        //   borderSide: BorderSide(
                                        //     color: STYHTheme.of(context)
                                        //         .error,
                                        //     width: 2.0,
                                        //   ),
                                        //   borderRadius:
                                        //       BorderRadius.circular(12.0),
                                        // ),
                                        // focusedErrorBorder: OutlineInputBorder(
                                        //   borderSide: BorderSide(
                                        //     color: STYHTheme.of(context)
                                        //         .error,
                                        //     width: 2.0,
                                        //   ),
                                        //   borderRadius:
                                        //       BorderRadius.circular(12.0),
                                        // ),
                                        filled: true,
                                        fillColor: STYHTheme.priPurpleDeep,
                                      ),
                                      // style: STYHTheme.of(context)
                                      //     .bodyMedium
                                      //     .override(
                                      //       fontFamily: 'Inter',
                                      //       letterSpacing: 0.0,
                                      //     ),
                                      keyboardType: TextInputType.emailAddress,
                                      validator: _model
                                          .emailAddressTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 16.0),
                                  child: Container(
                                    width: 370.0,
                                    child: TextFormField(
                                      controller: _model.passwordTextController,
                                      focusNode: _model.passwordFocusNode,
                                      autofocus: true,
                                      autofillHints: [AutofillHints.password],
                                      obscureText: !_model.passwordVisibility,
                                      decoration: InputDecoration(
                                        labelText: 'Password',
                                        // labelStyle: STYHTheme.of(context)
                                        //     .labelMedium
                                        //     .override(
                                        //       fontFamily: 'Inter',
                                        //       letterSpacing: 0.0,
                                        //     ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: STYHTheme.priPurpleDeep,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: STYHTheme.priPurpleDeep,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        // errorBorder: OutlineInputBorder(
                                        //   borderSide: BorderSide(
                                        //     color: STYHTheme.of(context)
                                        //         .error,
                                        //     width: 2.0,
                                        //   ),
                                        //   borderRadius:
                                        //       BorderRadius.circular(12.0),
                                        // ),
                                        // focusedErrorBorder: OutlineInputBorder(
                                        //   borderSide: BorderSide(
                                        //     color: STYHTheme.of(context)
                                        //         .error,
                                        //     width: 2.0,
                                        //   ),
                                        //   borderRadius:
                                        //       BorderRadius.circular(12.0),
                                        // ),
                                        filled: true,
                                        fillColor: STYHTheme.priPurpleDeep,
                                        // suffixIcon: InkWell(
                                        //   onTap: () => safeSetState(
                                        //     () => _model.passwordVisibility =
                                        //         !_model.passwordVisibility,
                                        //   ),
                                        //   focusNode:
                                        //       FocusNode(skipTraversal: true),
                                        //   child: Icon(
                                        //     _model.passwordVisibility
                                        //         ? Icons.visibility_outlined
                                        //         : Icons.visibility_off_outlined,
                                        //     color: STYHTheme.of(context)
                                        //         .secondaryText,
                                        //     size: 24.0,
                                        //   ),
                                        // ),
                                      ),
                                      // style: STYHTheme.of(context)
                                      //     .bodyMedium
                                      //     .override(
                                      //       fontFamily: 'Inter',
                                      //       letterSpacing: 0.0,
                                      //     ),
                                      validator: _model
                                          .passwordTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 16.0),
                                  child: Container(
                                    width: 370.0,
                                    child: TextFormField(
                                      controller:
                                          _model.passwordConfirmTextController,
                                      focusNode:
                                          _model.passwordConfirmFocusNode,
                                      autofocus: true,
                                      autofillHints: [AutofillHints.password],
                                      obscureText:
                                          !_model.passwordConfirmVisibility,
                                      decoration: InputDecoration(
                                        labelText: 'Confirm Password',
                                        // labelStyle: STYHTheme.of(context)
                                        //     .labelMedium
                                        //     .override(
                                        //       fontFamily: 'Inter',
                                        //       letterSpacing: 0.0,
                                        //     ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: STYHTheme.priPurpleDeep,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: STYHTheme.priPurpleDeep,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        // errorBorder: OutlineInputBorder(
                                        //   borderSide: BorderSide(
                                        //     color: STYHTheme.of(context)
                                        //         .error,
                                        //     width: 2.0,
                                        //   ),
                                        //   borderRadius:
                                        //       BorderRadius.circular(12.0),
                                        // ),
                                        // focusedErrorBorder: OutlineInputBorder(
                                        //   borderSide: BorderSide(
                                        //     color: STYHTheme.of(context)
                                        //         .error,
                                        //     width: 2.0,
                                        //   ),
                                        //   borderRadius:
                                        //       BorderRadius.circular(12.0),
                                        // ),
                                        filled: true,
                                        fillColor: STYHTheme.priPurpleDeep,
                                        // suffixIcon: InkWell(
                                        //   onTap: () => safeSetState(
                                        //     () => _model
                                        //             .passwordConfirmVisibility =
                                        //         !_model
                                        //             .passwordConfirmVisibility,
                                        //   ),
                                        //   focusNode:
                                        //       FocusNode(skipTraversal: true),
                                        //   child: Icon(
                                        //     _model.passwordConfirmVisibility
                                        //         ? Icons.visibility_outlined
                                        //         : Icons.visibility_off_outlined,
                                        //     color: STYHTheme.of(context)
                                        //         .secondaryText,
                                        //     size: 24.0,
                                        //   ),
                                        // ),
                                      ),
                                      // style: STYHTheme.of(context)
                                      //     .bodyMedium
                                      //     .override(
                                      //       fontFamily: 'Inter',
                                      //       letterSpacing: 0.0,
                                      //     ),
                                      minLines: 1,
                                      validator: _model
                                          .passwordConfirmTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                                // Padding(
                                //   padding: const EdgeInsetsDirectional.fromSTEB(
                                //       0.0, 0.0, 0.0, 16.0),
                                //   child: FFButtonWidget(
                                //     onPressed: () {
                                //       print('Button pressed ...');
                                //     },
                                //     text: 'Create Account',
                                //     options: FFButtonOptions(
                                //       width: 370.0,
                                //       height: 44.0,
                                //       padding: const EdgeInsetsDirectional.fromSTEB(
                                //           0.0, 0.0, 0.0, 0.0),
                                //       iconPadding:
                                //           const EdgeInsetsDirectional.fromSTEB(
                                //               0.0, 0.0, 0.0, 0.0),
                                //       color:
                                //           STYHTheme.of(context).primary,
                                //       textStyle: STYHTheme.of(context)
                                //           .titleSmall
                                //           .override(
                                //             fontFamily: 'Inter Tight',
                                //             color: Colors.white,
                                //             letterSpacing: 0.0,
                                //           ),
                                //       elevation: 3.0,
                                //       borderSide: const BorderSide(
                                //         color: Colors.transparent,
                                //         width: 1.0,
                                //       ),
                                //       borderRadius: BorderRadius.circular(12.0),
                                //     ),
                                //   ),
                                // ),

                                // You will have to add an action on this rich text to go to your login page.
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 12.0),
                                  child: RichText(
                                    textScaler:
                                        MediaQuery.of(context).textScaler,
                                    text: TextSpan(
                                      children: [
                                        const TextSpan(
                                          text: 'Already have an account? ',
                                          style: TextStyle(),
                                        ),
                                        TextSpan(
                                          text: 'Sign In here',
                                          // style: STYHTheme.of(context)
                                          //     .bodyMedium
                                          //     .override(
                                          //       fontFamily: 'Inter',
                                          //       color:
                                          //           STYHTheme.of(context)
                                          //               .primary,
                                          //       fontSize: 16.0,
                                          //       letterSpacing: 0.0,
                                          //       fontWeight: FontWeight.w600,
                                          //     ),
                                        )
                                      ],
                                      // style: STYHTheme.of(context)
                                      //     .labelLarge
                                      //     .override(
                                      //       fontFamily: 'Inter',
                                      //       letterSpacing: 0.0,
                                      //     ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
              ))
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      width: 100.0,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: STYHTheme.secPurple,
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(
                            'https://images.unsplash.com/photo-1514924013411-cbf25faa35bb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1380&q=80',
                          ),
                        ),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
