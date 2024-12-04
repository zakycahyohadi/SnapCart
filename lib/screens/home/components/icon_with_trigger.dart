import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/size_config.dart';

class IconWithTrigger extends StatelessWidget {
  const IconWithTrigger({
    super.key, required this.svgIcon, this.trigger,
  });

  final String svgIcon;
  final String? trigger;
  

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: getPropScreenWidth(46),
          width: getPropScreenWidth(46),
          padding: EdgeInsets.all(getPropScreenWidth(12)),
          decoration: BoxDecoration(
            color: kSecondaryColor.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(svgIcon),
        ),
        if (trigger != null && trigger != "0") 
        Positioned(
          top: -1,
          right: 0,
          child: Container(
            width: getPropScreenWidth(16),
            height: getPropScreenWidth(16),
            decoration: BoxDecoration(
              color: kPrimaryColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                trigger!, 
                style: TextStyle(
                  color: Colors.white, 
                  fontSize: getPropScreenWidth(10),
                  height: .1,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
        )
      ],
    );
  }
}