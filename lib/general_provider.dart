import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class GeneralProvider extends StatelessWidget {
  GeneralProvider({
    @required this.builder,
  }) : assert(builder != null);

  final WidgetBuilder builder;

  List<SingleChildWidget> _buildRDSProviders() => [];

  List<SingleChildWidget> _buildCDSProviders() => [];

  List<SingleChildWidget> _buildRepositoryProviders() => [];

  List<SingleChildWidget> _buildUCProviders() => [];

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ..._buildRDSProviders(),
          ..._buildCDSProviders(),
          ..._buildRepositoryProviders(),
          ..._buildUCProviders(),
        ],
        child: builder(context),
      );
}
