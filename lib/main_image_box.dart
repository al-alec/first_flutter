import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'const.dart';

class MyImageBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const l = 5.5;
    final theme = Theme.of(context);
    return Container(
      width: .515.ofHeight(context),
      height: .80.ofWidth(context),
      margin: EdgeInsets.only(right: 15),
      child: CachedNetworkImage(
        imageUrl: url,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(30),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            alignment: Alignment.bottomLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Text("New Releases", style: theme.textTheme.bodyText1,),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 30),
                  child: Text("\$3600 . 20 units", style: theme.textTheme.bodyText2,),
                )
              ],
            ),
          ),
        ),
        placeholder: (context, url) => Center(
          child: CircularProgressIndicator(
            backgroundColor: theme.primaryColor,
          ),
        ),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }

  String url = "";
  MyImageBox({this.url});
}
