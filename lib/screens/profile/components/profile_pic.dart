import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/size_config.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenWidth(115),
      width: getProportionateScreenWidth(115),
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/clone/Vespa.jpeg"),
          ),
          Positioned(
            bottom: 0, // Posisi tombol di bagian bawah gambar
            right: 0, // Posisi tombol di bagian kanan bawah
            child: SizedBox(
              height: 46,
              width: 46,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xFFF5F6F9), // Gaya warna background
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50), // Membuat tombol bulat
                    side: BorderSide(color: Colors.white), // Tambahan border jika diperlukan
                  ),
                ),
                onPressed: () {
                  // Aksi ketika tombol ditekan
                },
                child: SvgPicture.asset(
                  "assets/icons/Camera Icon.svg",
                  color: kPrimaryColor, // Warna ikon SVG jika ingin diubah
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}