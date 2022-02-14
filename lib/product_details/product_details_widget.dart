import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import '../product_page/product_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import '../api_endpoint.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class ProductDetailsWidget extends StatefulWidget {
  final values;
  const ProductDetailsWidget({Key key, @required this.values})
      : super(key: key);

  @override
  _ProductDetailsWidgetState createState() => _ProductDetailsWidgetState();
}

class _ProductDetailsWidgetState extends State<ProductDetailsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  var values;
  String endpoint = Endpoint();
  var selectedSize = {"size": "xs", "id": "0"};
  bool x;
  bool y;
  var bundles;
  var present = false;
  var loading = false;

  void initState() {
    super.initState();
    values = widget.values;
    readBundles();
  }

  List bundleNames = ["U", "L", "F", "A"];

  void readBundles() async {
    final storage = new FlutterSecureStorage();
    var catego = await storage.read(key: 'bundles');
    var categories = json.decode(catego);
    var items = await storage.read(key: 'cart');
    bool available = true;
    if (items == null) {
      available = true;
    } else {
      var item = json.decode(items);
      for (int i = 0; i < item.length; i++) {
        if (item[i]['id'] == values['id']) {
          available = false;
          break;
        }
      }
    }
    setState(() {
      bundles = categories;
      present = available;
      loading = true;
    });
  }

  void bookItem() async {
    var updateBundles = [...bundles];
    final storage = await FlutterSecureStorage();
    print("inside");
    switch (values['category']) {
      case 'upperwear':
        updateBundles[0] = true;
        break;
      case 'lowerwear':
        updateBundles[1] = true;
        break;
      case 'footwear':
        updateBundles[2] = true;
        break;
      case 'accessories':
        updateBundles[3] = true;
        break;
    }
    setState(() {
      bundles = updateBundles;
    });
    await storage.write(key: 'bundles', value: json.encode(updateBundles));
    var items = await storage.read(key: 'cart');
    if (items == null) {
      List cart = [];
      cart.add(values);
      await storage.write(key: 'cart', value: json.encode(cart));
    } else {
      List cart = json.decode(items);
      cart.add(values);
      await storage.write(key: 'cart', value: json.encode(cart));
    }
    await showDialog(
      context: context,
      builder: (alertDialogContext) {
        return AlertDialog(
          title: Text('Added'),
          content: Text('The ' + values['category'] + ' is Booked'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(alertDialogContext),
              child: Text('Ok'),
            ),
          ],
        );
      },
    );
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NavBarPage(initialPage: 'HomePage'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.chevron_left_rounded,
            color: Color(0xFF8B97A2),
            size: 24,
          ),
        ),
        title: Text(
          ' ',
          style: FlutterFlowTheme.of(context).subtitle2.override(
                fontFamily: 'Lexend Deca',
                color: Color(0xFF151B1E),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              buttonSize: 48,
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: Color(0xFF95A1AC),
                size: 30,
              ),
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NavBarPage(initialPage: 'cart'),
                  ),
                );
              },
            ),
          ),
        ],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  child: FlutterFlowExpandedImageView(
                                    image: Image.network(
                                      endpoint +
                                          values['product_image'][0]['image'],
                                      fit: BoxFit.contain,
                                    ),
                                    allowRotation: false,
                                    tag: 'productImageTag',
                                    useHeroAnimation: true,
                                  ),
                                ),
                              );
                            },
                            child: Hero(
                              tag: 'productImageTag',
                              transitionOnUserGestures: true,
                              child: Image.network(
                                endpoint + values['product_image'][0]['image'],
                                width: MediaQuery.of(context).size.width,
                                height: 350,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            values['product_name'],
                            style: FlutterFlowTheme.of(context).title1.override(
                                  fontFamily: 'Playfair Display',
                                  color: Color(0xFF090F13),
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          Expanded(
                            child: Text(
                              "Rs " + values['price'].toString(),
                              textAlign: TextAlign.end,
                              style: FlutterFlowTheme.of(context)
                                  .subtitle1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF4B39EF),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Per day',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                              child: Text(
                                values['details'],
                                style: FlutterFlowTheme.of(context)
                                    .bodyText2
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF8B97A2),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12, 5, 4, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.95,
                      height: 50,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).tertiaryColor,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ...(values['product_size']).map((size) {
                            x = false;
                            if (selectedSize['id'] == size['id'].toString()) {
                              x = true;
                            }
                            return (Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: x
                                        ? Colors.black
                                        : FlutterFlowTheme.of(context)
                                            .tertiaryColor,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 5,
                                        color: Color(0xFFD3E0DC),
                                      )
                                    ],
                                    shape: BoxShape.circle,
                                  ),
                                  child: InkWell(
                                    onTap: () async {
                                      // Navigator.pop(context);
                                      setState(() {
                                        selectedSize = {
                                          "size": size['name'],
                                          "id": size['id'].toString()
                                        };
                                        x = true;
                                      });
                                    },
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          size['name'],
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600,
                                                color: x
                                                    ? Colors.white
                                                    : Colors.black,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ));
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12, 15, 4, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.95,
                      height: 50,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).tertiaryColor,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if(loading)
                          ...(bundleNames).map((name) {
                            var index = bundleNames.indexOf(name);
                            y = false;
                            if (bundles[index]) y = true;
                            return (Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 0, 5, 0),
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: y
                                          ? Colors.black
                                          : FlutterFlowTheme.of(context)
                                              .tertiaryColor,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 10,
                                          color: Color(0xFFD3E0DC),
                                        )
                                      ],
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Color(0xFFAEE1E1),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          name,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600,
                                                color: y
                                                    ? Colors.white
                                                    : Colors.black,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ));
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 20),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Material(
                      color: Colors.transparent,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Color(0xFF4B39EF),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: FFButtonWidget(
                          onPressed: () async {
                            if (present) {
                              bookItem();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Already added to bundle'),
                                    backgroundColor: Colors.green),
                              );
                            }
                          },
                          text: present ? 'Add to bundle' : 'Added to bundle',
                          options: FFButtonOptions(
                            color: Color(0xFF4B39EF),
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: 8,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
