import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';



Widget cachedImage(imageUrl) {
  return CachedNetworkImage(
    imageUrl: imageUrl,
    imageBuilder: (context, imageProvider) => Container(
      decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(10),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black12, blurRadius: 2, offset: Offset(2, 2))
          ],
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover)),
    ),
    placeholder: (context, url) => LoadingWidget1(),
    errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
  );
}
class LoadingWidget1 extends StatelessWidget {
  const LoadingWidget1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.black87,
        highlightColor: Colors.white,
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context)
                  .size
                  .width *
                  0.70,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Flexible(
                    flex: 5,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ));
  }
}