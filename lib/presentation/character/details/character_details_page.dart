import 'package:domain/use_case/get_character_details_uc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../common/got_app_bar.dart';
import '../../common/response_view.dart';
import '../../common/view_utils.dart';
import 'character_details_bloc.dart';
import 'character_details_models.dart';

class CharacterDetailsPage extends StatelessWidget {
  CharacterDetailsPage({
    @required this.bloc,
    @required this.title,
  })  : assert(bloc != null),
        assert(title != null);

  final CharacterDetailsBloc bloc;
  final String title;

  static Widget create(String name) => BlocProvider(
        create: (context) => CharacterDetailsBloc(
          getCharacterDetailsUC:
              Provider.of<GetCharacterDetailsUC>(context, listen: false),
          name: name,
        ),
        child: Consumer<CharacterDetailsBloc>(
          builder: (context, bloc, _) => CharacterDetailsPage(
            bloc: bloc,
            title: name,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: GotAppBar(
          title: title,
        ),
        body: BlocBuilder<CharacterDetailsBloc, CharacterDetailsState>(
          bloc: bloc,
          builder: (context, state) =>
              ResponseView<CharacterDetailsState, Success, Loading, Error>(
            state: state,
            onTryAgainTap: () => bloc.add(
              OnTryAgainEvent(),
            ),
            successWidgetBuilder: (context, success) => Placeholder(),
          ),
        ),
      );
}
