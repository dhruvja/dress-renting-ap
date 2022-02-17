import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartComponentWidget extends StatefulWidget {
  const CartComponentWidget({Key key}) : super(key: key);

  @override
  _CartComponentWidgetState createState() => _CartComponentWidgetState();
}

class _CartComponentWidgetState extends State<CartComponentWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.95,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 1,
              color: Color(0xFFAEE1E1),
            )
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 3, 0, 3),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/upper.png',
                        width: 74,
                        height: 74,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pressed T-Shirt',
                        style: FlutterFlowTheme.of(context).subtitle1.override(
                              fontFamily: 'Open Sans',
                              color: Color(0xFF111417),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                        child: Text(
                          'Size:XXL',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Open Sans',
                                    color: Color(0xFF090F13),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'No of Days',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Open Sans',
                                      color: Color(0xFF6C6B6B),
                                      fontSize: 8,
                                    ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Rs.250',
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle1
                                          .override(
                                            fontFamily: 'Open Sans',
                                            color: Color(0xFF151B1E),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ],
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
            ],
          ),
        ),
      ),
    );
  }
}
