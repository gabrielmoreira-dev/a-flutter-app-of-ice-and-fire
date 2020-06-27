import 'package:aflutterappoficeandfire/presentation/common/got_colors.dart';
import 'package:flutter/material.dart';
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
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
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
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Column(
          children: [
            item.image != null
                ? Image.network(
                    item.image,
                    fit: BoxFit.cover,
                  )
                : Expanded(
                    child: Container(
                      color: GotColors.lightBlue,
                      child: Center(
                        child: Icon(
                          Icons.image,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
            GridTileBar(
              backgroundColor: Colors.black87,
              title: Center(
                child: Text(item.name),
              ),
            ),
          ],
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
