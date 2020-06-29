import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class GotGridView extends StatelessWidget {
  GotGridView({
    @required this.itemList,
    @required this.onTap,
    this.expand = true,
  })  : assert(itemList != null),
        assert(onTap != null);

  final List<CardItemVM> itemList;
  final Function onTap;
  final bool expand;

  @override
  Widget build(BuildContext context) => GridView(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 4,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: itemList
            .map(
              (item) => _GotGridTile(
                item: item,
                onTap: onTap,
                expand: expand,
              ),
            )
            .toList(),
      );
}

class _GotGridTile extends StatelessWidget {
  _GotGridTile({
    @required this.item,
    @required this.onTap,
    this.expand = true,
  })  : assert(item != null),
        assert(onTap != null);

  final CardItemVM item;
  final Function onTap;
  final bool expand;

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: Colors.white,
            width: 0.5,
          ),
        ),
        child: GestureDetector(
          onTap: () => onTap(item.name),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.black26,
                    child: Center(
                      child: CachedNetworkImage(
                        imageUrl: item.image,
                        width: expand ? double.infinity : 100,
                        height: expand ? double.infinity : 100,
                        fit: expand ? BoxFit.cover : BoxFit.contain,
                        alignment:
                            expand ? Alignment.topCenter : Alignment.center,
                        placeholder: (context, _) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, _, __) => ImageError(),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 40,
                  color: Colors.black87,
                  child: Center(
                    child: Text(
                      item.name,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

class CardItemVM {
  CardItemVM({
    @required this.name,
    @required this.image,
  })  : assert(name != null),
        assert(image != null);

  final String name;
  final String image;
}

class ImageError extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Icon(
        Icons.image,
        color: Colors.white,
      );
}
