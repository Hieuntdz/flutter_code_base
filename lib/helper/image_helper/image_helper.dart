import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_code_base/helper/image_helper/asset_helper.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageProperty {
  const ImageProperty({
    Key? key,
    required this.image,
    required this.x,
    required this.y,
  });

  final ui.Image image;
  final int x;
  final int y;
}

// ignore: avoid_classes_with_only_static_members
class ImageHelper {
  static const double widthIcon = 18;
  static const double heightIcon = 18;

  static Widget loadFromUrl(
    String imageURL, {
    double? imageWidth,
    double? imageHeight,
    double? radius,
    BoxFit? fit = BoxFit.contain,
  }) {
    return CachedNetworkImage(
      imageUrl: imageURL,
      width: imageWidth,
      height: imageHeight,
      imageBuilder: (context, imageProvider) => Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 0),
          image: DecorationImage(
            image: imageProvider,
            fit: fit,
          ),
        ),
      ),
      placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator()),
      errorWidget: (BuildContext context, String url, dynamic error) =>
          const Center(
        child: Icon(Icons.error),
      ),
    );
  }

  static Widget loadFromAsset(
    String imageFilePath, {
    String? defaultImage,
    double? width,
    double? height,
    double? radius,
    BoxFit? fit,
    Color? tintColor,
    Alignment? alignment,
  }) {
    if (AssetHelper.hasAsset[imageFilePath] != true) {
      if ((defaultImage ?? '').isNotEmpty &&
          defaultImage != imageFilePath &&
          AssetHelper.hasAsset[defaultImage] == true) {
        return loadFromAsset(defaultImage!,
            width: width,
            height: height,
            radius: radius,
            fit: fit,
            tintColor: tintColor,
            alignment: alignment);
      }
      return ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? 0),
        child: SizedBox(
          width: width,
          height: height,
        ),
      );
    }
    if (imageFilePath.toLowerCase().endsWith('svg')) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? 0),
        child: SvgPicture.asset(
          imageFilePath,
          width: width,
          height: height,
          fit: fit ?? BoxFit.contain,
          color: tintColor,
          alignment: alignment ?? Alignment.center,
        ),
      );
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? 0),
        child: Image.asset(
          imageFilePath,
          width: width,
          height: height,
          fit: fit ?? BoxFit.contain,
          color: tintColor,
          alignment: alignment ?? Alignment.center,
        ),
      );
    }
  }

  static Widget loadIconFromAsset(
    String imageFilePath, {
    double? width = 18,
    double? height = 18,
    double? radius,
    BoxFit? fit,
    Color? tintColor,
    Alignment? alignment,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? 0),
      child: Image.asset(
        imageFilePath,
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
        color: tintColor,
        alignment: alignment ?? Alignment.center,
      ),
    );
  }

  static Future<ui.Image> bytesToImage(Uint8List data) async {
    ui.Codec codec = await ui.instantiateImageCodec(data);
    ui.FrameInfo frame = await codec.getNextFrame();
    return frame.image;
  }

  static Future<Uint8List?> join(List<Uint8List?> list) async {
    if (list.isNotEmpty) {
      List<ImageProperty> imageProperties = [];
      final recorder = ui.PictureRecorder();
      final paint = Paint()
        ..color = Colors.white
        ..style = PaintingStyle.fill;
      int _height = 0;
      int _width = 0;
      for (int i = 0; i < list.length; i++) {
        Uint8List? item = list[i];
        if (item != null) {
          ui.Codec codec = await ui.instantiateImageCodec(item);
          ui.FrameInfo frame = await codec.getNextFrame();
          final image = frame.image;
          imageProperties.add(ImageProperty(image: image, x: 0, y: _height));
          _height += image.height;
          if (_width < image.width) {
            _width = image.width;
          }
        }
      }
      final canvas = Canvas(
        recorder,
        Rect.fromPoints(
          const Offset(0.0, 0.0),
          Offset(
            _width.toDouble(),
            _height.toDouble(),
          ),
        ),
      );
      // canvas.drawCircle(Offset(_width/2, _height/2), _width/2, paint);
      canvas.drawColor(Colors.white, BlendMode.screen);
      for (int i = 0; i < imageProperties.length; i++) {
        ImageProperty item = imageProperties[i];
        canvas.drawImage(
            item.image, Offset(item.x.toDouble(), item.y.toDouble()), paint);
      }
      final picture = recorder.endRecording();
      final imgFull = await picture.toImage(_width, _height);
      final imageData =
          await imgFull.toByteData(format: ui.ImageByteFormat.png);
      if (imageData != null) {
        return Uint8List.view(imageData.buffer);
      }
    }
    return null;
  }
}
