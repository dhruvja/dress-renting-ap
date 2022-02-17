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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
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
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.42,
                      height: 160,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).tertiaryColor,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset(
                            'assets/images/myntra2.jpg',
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
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        NavBarPage(initialPage: 'cart'),
                                  ),
                                );
                              },
                              child: Text(
                                'Pressman Top',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Open Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '300 Rs',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Open Sans',
                              color: Color(0xFFDA1111),
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                'Cost per day',
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Open Sans',
                      color: Color(0xFF6C6B6B),
                      fontSize: 8,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
