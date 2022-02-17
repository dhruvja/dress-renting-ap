import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../components/cart_component_copy_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import '../api_endpoint.dart';

class OrdeBookedWidget extends StatefulWidget {
  const OrdeBookedWidget({Key key}) : super(key: key);

  @override
  _OrdeBookedWidgetState createState() => _OrdeBookedWidgetState();
}

class _OrdeBookedWidgetState extends State<OrdeBookedWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  var items;
  bool present = false;

  void initState() {
    super.initState();
    getOrder();
  }

  void getOrder() async {
    var url = Endpoint() + "/api/getorders";
    final storage = await FlutterSecureStorage();
    var token = await storage.read(key: 'token');
    token = "Bearer " + token;
    print(token);
    final response = await http.get(Uri.parse(url),
        headers: {'Content-Type': 'application/json', 'Authorization': token});
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      setState(() {
        items = data;
        present = true;
      });
    } else {
      print("not authorized");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: true,
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 3, 0, 0),
                    child: InkWell(
                      onTap: () async {
                        getOrder();
                      },
                      child: Text(
                        'Booked',
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ),
                  ),
                ],
              ),
              if (present)
                ...(items).map((item) {
                  item['add'] = item['address_order_id'][0]['housename'] +
                      ", " +
                      item['address_order_id'][0]['streetname'] +
                      ", " +
                      item['address_order_id'][0]['area'] +
                      ", " +
                      item['address_order_id'][0]['city'] +
                      ", " +
                      item['address_order_id'][0]['state'] +
                      ", " +
                      item['address_order_id'][0]['pincode'];
                  return CartComponentCopyWidget(item);
                })
            ],
          ),
        ),
      ),
    );
  }
}
