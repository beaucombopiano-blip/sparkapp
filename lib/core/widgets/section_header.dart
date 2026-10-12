import 'package:material_ui/material_ui.dart';

import '../../app/theme/tokens.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.title, this.actionLabel, this.onAction, this.trailing});

  final String title;
  final String? actionLabel;
  final VoidCallback? onAction;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final hasAction = actionLabel != null && onAction != null;
    return Padding(
      padding: const EdgeInsets.only(top: Space.l, bottom: Space.s),
      // A Wrap keeps the action at the trailing edge when it fits and moves it
      // under the title at large text sizes instead of overflowing.
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: <Widget>[
          Semantics(
            header: true,
            child: Text(title, style: Theme.of(context).textTheme.titleLarge),
          ),
          if (trailing != null || hasAction)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ?trailing,
                if (hasAction) Flexible(child: TextButton(onPressed: onAction, child: Text(actionLabel!))),
              ],
            ),
        ],
      ),
    );
  }
}
