import 'package:domain/use_case/get_character_list_uc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../common/card_grid_view.dart';
import '../../common/got_app_bar.dart';
import '../../common/response_view.dart';
import 'character_bloc.dart';
import 'character_models.dart';

class CharacterPage extends StatelessWidget {
  CharacterPage({
    @required this.bloc,
  }) : assert(bloc != null);

  final CharacterBloc bloc;

  static Widget create() => BlocProvider(
        create: (context) => CharacterBloc(
          getCharacterListUC:
              Provider.of<GetCharacterListUC>(context, listen: false),
          houseName: 'House Stark',
        ),
        child: Consumer<CharacterBloc>(
          builder: (context, bloc, _) => CharacterPage(
            bloc: bloc,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: GotAppBar(),
        ),
        body: BlocBuilder<CharacterBloc, CharacterState>(
          bloc: bloc,
          builder: (context, state) =>
              ResponseView<CharacterState, Success, Loading, Error>(
            state: state,
            onTryAgainTap: () => bloc.add(
              OnTryAgainEvent(),
            ),
            successWidgetBuilder: (context, success) => GotGridView(
              itemList: success.characterList
                  .map(
                    (houseItem) => CardItemVM(
                      name: houseItem.name,
                      image: houseItem.image,
                    ),
                  )
                  .toList(),
              onTap: (name) {},
            ),
          ),
        ),
      );
}
