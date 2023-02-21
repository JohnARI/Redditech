import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:redditech/common/const.dart';

class MyAppbar extends StatelessWidget {
  final String title;
  const MyAppbar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SafeArea(
          child: SvgPicture.asset(
            "assets/images/logos/logo_dark.svg",
            color: medium0.withOpacity(0.3),
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.topCenter,
            fit: BoxFit.fitWidth,
          ),
        ),
        SizedBox(
          height: 200,
          child: AppBar(
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0, bottom: 18.0),
                    child: Text(title,
                        style: const TextStyle(
                          shadows: [
                            Shadow(
                              color: neutralDark0,
                              offset: Offset(0, 0),
                              blurRadius: 5,
                            ),
                          ],
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
        ),
      ],
    );
  }
}
