import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardGridView extends StatelessWidget {
  CardGridView({
    @required this.itemList,
  }) : assert(itemList != null);

  final List<CardItemVM> itemList;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 3 / 4,
            crossAxisSpacing: 6,
            mainAxisSpacing: 4,
          ),
          children: itemList
              .map(
                (item) => _CardItem(
                  item: item,
                ),
              )
              .toList(),
        ),
      );
}

class _CardItem extends StatelessWidget {
  _CardItem({
    @required this.item,
  }) : assert(item != null);

  final CardItemVM item;

  @override
  Widget build(BuildContext context) => Card(
        child: Text(item.name),
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
