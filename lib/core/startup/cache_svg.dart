import 'package:nimble_simple/core/utils/images.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

void cacheSvg() async {
  Future.wait([
    precachePicture(
      ExactAssetPicture(
        SvgPicture.svgStringDecoderBuilder,
        AppAssets.appIcon,
      ),
      null,
    ),
    // precachePicture(
    //   ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, 'assets/my_asset.svg'),
    //   null,
    // ),
  ]);
}
