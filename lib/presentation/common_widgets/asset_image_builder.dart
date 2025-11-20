import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AssetImageBuilder extends StatelessWidget {
  /// The path to the image asset.
  /// For example: 'assets/images/logo.png' or 'assets/icons/home.svg'
  final String path;

  /// The height of the image.
  final double? height;

  /// The width of the image.
  final double? width;

  /// A color to apply to the image.
  /// For raster images, this works as a color overlay.
  /// For SVG images, this will replace the fill color of the SVG paths.
  final Color? color;

  /// How the image should be inscribed into the box.
  /// Defaults to [BoxFit.contain].
  final BoxFit fit;

  /// A builder that specifies the widget to display to the user while an image
  /// is still loading. If this is null, a default [CircularProgressIndicator]
  /// will be used.
  final Widget? loadingBuilder;

  const AssetImageBuilder(
    this.path, {
    Key? key,
    this.height,
    this.width,
    this.color,
    this.fit = BoxFit.contain,
    this.loadingBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Check if the image path ends with the .svg extension.
    final bool isSvg = path.toLowerCase().endsWith('.svg');

    if (isSvg) {
      // Use SvgPicture.asset for SVG images.
      return SvgPicture.asset(
        path,
        height: height,
        width: width,
        fit: fit,
        // The colorFilter property is used to apply a color to an SVG.
        colorFilter: color != null
            ? ColorFilter.mode(color!, BlendMode.srcIn)
            : null,
        placeholderBuilder: (BuildContext context) =>
            loadingBuilder ??
            const Center(child: CircularProgressIndicator.adaptive()),
      );
    } else {
      // Use Image.asset for all other image types (PNG, JPG, etc.).
      return Image.asset(
        path,
        height: height,
        width: width,
        fit: fit,
        color: color,
        // Provides a frame-by-frame loading builder.
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
          if (wasSynchronouslyLoaded) {
            return child;
          }
          // Use an AnimatedSwitcher to fade between the loader and the image.
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 350),
            child: frame == null
                ? (loadingBuilder ??
                      const Center(child: CircularProgressIndicator.adaptive()))
                : child,
          );
        },
        // Handles errors during image loading, such as if the file is not found.
        errorBuilder: (context, error, stackTrace) {
          // You can return a more sophisticated error widget here.
          return const Icon(Icons.error_outline, color: Colors.red, size: 32);
        },
      );
    }
  }
}
