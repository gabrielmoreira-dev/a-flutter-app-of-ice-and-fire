import 'package:cached_network_image/cached_network_image.dart';
import 'package:domain/use_case/get_character_details_uc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../common/empty_data_image.dart';
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
            successWidgetBuilder: (context, success) => Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 24,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: Colors.white,
                    width: 0.5,
                  ),
                  color: Colors.black26,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CachedNetworkImage(
                        imageUrl: success.characterDetails.image,
                        width: MediaQuery.of(context).size.width * 0.45,
                        placeholder: (context, _) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, _, __) => EmptyDataImage(),
                      ),
                      Flexible(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 24,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                success.characterDetails.name,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 18,
                              ),
                              Text(
                                success.characterDetails.titles.join(';\n'),
                                maxLines: 14,
                                overflow: TextOverflow.fade,
                                style: TextStyle(
                                  fontSize: 9,
                                  wordSpacing: 1,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
