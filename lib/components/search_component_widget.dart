import 'package:ecommerce/product_details/product_details_widget.dart';
import 'package:ecommerce/product_page/product_page_widget.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchComponentWidget extends StatefulWidget {
  const SearchComponentWidget({Key key}) : super(key: key);

  @override
  _SearchComponentWidgetState createState() => _SearchComponentWidgetState();
}

class _SearchComponentWidgetState extends State<SearchComponentWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(3, 3, 3, 3),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailsWidget(),
                        ),
                      );
                    },
                    child: Container(
                      width: 150,
                      height: 160,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).tertiaryColor,
                        image: DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: Image.asset(
                            'assets/images/myntra.jpg',
                          ).image,
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 3,
                            color: Color(0xFFD3E0DC),
                          )
                        ],
                      ),
                      alignment: AlignmentDirectional(0, 0),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NavBarPage(initialPage: 'cart'),
                        ),
                      );
                    },
                    child: Text(
                      'Pressman Top',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).primaryColor,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ],
              ),
              Text(
                'Cost per day',
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Poppins',
                      color: Color(0xFF6C6B6B),
                      fontSize: 8,
                    ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '300 Rs',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFFDA1111),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
