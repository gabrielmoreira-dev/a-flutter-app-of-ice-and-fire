import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class GotGridView extends StatelessWidget {
  GotGridView({
    @required this.itemList,
  }) : assert(itemList != null);

  final List<CardItemVM> itemList;

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
              ),
            )
            .toList(),
      );
}

class _GotGridTile extends StatelessWidget {
  _GotGridTile({
    @required this.item,
  }) : assert(item != null);

  final CardItemVM item;

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: Colors.white,
            width: 0.5,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.black26,
                  child: Center(
                    child: item.image != null
                        ? CachedNetworkImage(
                            imageUrl: item.image,
                            width: 100,
                            height: 100,
                            placeholder: (context, _) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, _, __) => ImageError(),
                          )
                        : ImageError(),
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
      );
}

class CardItemVM {
  CardItemVM({
    @required this.name,
    this.image,
  }) : assert(name != null);

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
