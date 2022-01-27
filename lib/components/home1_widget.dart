import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home1Widget extends StatefulWidget {
  const Home1Widget({Key key}) : super(key: key);

  @override
  _Home1WidgetState createState() => _Home1WidgetState();
}

class _Home1WidgetState extends State<Home1Widget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(3, 3, 3, 3),
      child: InkWell(
        onTap: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NavBarPage(initialPage: 'search'),
            ),
          );
        },
        child: Container(
          width: 150,
          height: 100,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.tertiaryColor,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/images/bigbillion.jpg',
              ).image,
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                color: Color(0xFFDBE2EF),
              )
            ],
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
