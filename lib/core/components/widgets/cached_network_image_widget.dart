import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({Key? key, required this.imageUrl}) : super(key: key);
final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 174,
      width: 174,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: imageUrl,
       placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(
          color: Colors.white70,
        )),
        errorWidget: (context, url, error) => const Icon(
          Icons.error,
          color: Colors.grey,
          size: 30,
        ),
      ),
    );
  }
}
