import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../app/routes.dart';
import '../../app/session.dart';
import '../../app/theme/tokens.dart';
import '../../core/utils/l10n.dart';
import '../../core/widgets/spark_logo.dart';
import '../../data/providers/session_providers.dart';

/// "Good morning, Maya ✨" for the given wall-clock hour.
String greetingLine(AppLocalizations l10n, String name, int hour, {bool sparkle = true}) {
  if (hour < 12) return sparkle ? l10n.greetingMorning(name) : l10n.greetingMorningPlain(name);
  if (hour < 18) return sparkle ? l10n.greetingAfternoon(name) : l10n.greetingAfternoonPlain(name);
  return sparkle ? l10n.greetingEvening(name) : l10n.greetingEveningPlain(name);
}

/// Daily greeting: the logo character blinks, bounces and smiles for
/// ~1.8 s, then fades into the Dashboard. Tap anywhere to skip. Never blocks
/// for more than 2 s; reduce-motion shows a static smiling logo.
class GreetingScreen extends ConsumerStatefulWidget {
  const GreetingScreen({super.key});

  static const Duration duration = Duration(milliseconds: 1800);
  static const Duration reducedMotionDuration = Duration(milliseconds: 900);

  @override
  ConsumerState<GreetingScreen> createState() => _GreetingScreenState();
}

class _GreetingScreenState extends ConsumerState<GreetingScreen> {
  Timer? _timer;
  bool _left = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_timer == null) {
      final reduce = MediaQuery.disableAnimationsOf(context);
      _timer = Timer(reduce ? GreetingScreen.reducedMotionDuration : GreetingScreen.duration, _leave);
      ref.read(greetingGateProvider).markShown();
    }
  }

  void _leave() {
    if (_left || !mounted) return;
    _left = true;
    _timer?.cancel();
    context.go(Routes.dashboard);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final text = Theme.of(context).textTheme;
    final name = ref.watch(userProfileProvider.select((p) => p.value?.firstName)) ?? '';
    final hour = ref.watch(userClockProvider).now().hour;

    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _leave,
        child: Semantics(
          button: true,
          hint: l10n.greetingSkipHint,
          child: SafeArea(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  AnimatedSparkLogo(size: 140, semanticLabel: l10n.greetingLogoSemantics),
                  const SizedBox(height: Space.l),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Space.l),
                    child: Text(
                      greetingLine(l10n, name, hour),
                      style: text.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
