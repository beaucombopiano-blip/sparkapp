import 'package:cupertino_ui/cupertino_ui.dart' show CupertinoPicker;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:material_ui/material_ui.dart';
import 'package:timezone/timezone.dart' as tz;

import '../../app/theme/spark_colors.dart';
import '../../app/theme/tokens.dart';
import '../../core/utils/l10n.dart';
import '../../core/widgets/spark_button.dart';
import '../../core/widgets/spark_card.dart';
import '../../data/providers/session_providers.dart';
import '../../data/repositories/auth_repository.dart';

/// Calls `completeSignup` with display name, birth year and time zone.
class CompleteSignupScreen extends ConsumerStatefulWidget {
  const CompleteSignupScreen({super.key});

  @override
  ConsumerState<CompleteSignupScreen> createState() => _CompleteSignupScreenState();
}

class _CompleteSignupScreenState extends ConsumerState<CompleteSignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  late final int _currentYear = DateTime.now().year;
  late int _birthYear = _currentYear - 16;
  late final FixedExtentScrollController _yearController =
      FixedExtentScrollController(initialItem: _currentYear - _birthYear);
  String _timezone = tz.local.name;
  bool _busy = false;
  Object? _error;

  @override
  void initState() {
    super.initState();
    final auth = ref.read(authSessionProvider).value;
    _name.text = auth?.displayName ?? '';
    FlutterTimezone.getLocalTimezone().then((zone) {
      if (mounted && tz.timeZoneDatabase.locations.containsKey(zone.identifier)) {
        setState(() => _timezone = zone.identifier);
      }
    }).catchError((Object _) {});
  }

  @override
  void dispose() {
    _name.dispose();
    _yearController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      await ref.read(authRepositoryProvider).completeSignup(
            displayName: _name.text,
            birthYear: _birthYear,
            timezone: _timezone,
          );
      // The profileComplete claim flips and the router moves on.
    } on UnderageSignupException catch (e) {
      if (!mounted) return;
      final l10n = context.l10n;
      await showDialog<void>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(l10n.signupUnderageTitle),
          content: Text(e.message ?? l10n.signupUnderageBody),
          actions: <Widget>[
            TextButton(onPressed: () => Navigator.of(context).pop(), child: Text(l10n.signupUnderageOk)),
          ],
        ),
      );
    } on Object catch (e) {
      if (mounted) setState(() => _error = e);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _pickTimezone() async {
    final picked = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) => _TimezonePicker(selected: _timezone),
    );
    if (picked != null) setState(() => _timezone = picked);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final text = Theme.of(context).textTheme;
    final c = context.spark;
    final years = List<int>.generate(100, (i) => _currentYear - i);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: c.background,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          TextButton(onPressed: () => ref.read(authRepositoryProvider).signOut(), child: Text(l10n.signOut)),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(Space.l),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(l10n.signupTitle, style: text.headlineMedium),
                    const SizedBox(height: Space.s),
                    Text(l10n.signupBody, style: text.bodyLarge),
                    const SizedBox(height: Space.l),
                    TextFormField(
                      controller: _name,
                      textCapitalization: TextCapitalization.words,
                      autofillHints: const <String>[AutofillHints.givenName],
                      decoration: InputDecoration(labelText: l10n.signupNameLabel, hintText: l10n.signupNameHint),
                      maxLength: 40,
                      validator: (v) => (v ?? '').trim().isEmpty ? l10n.signupNameRequired : null,
                    ),
                    const SizedBox(height: Space.m),
                    Text(l10n.signupBirthYearLabel, style: text.titleMedium),
                    const SizedBox(height: Space.xs),
                    Text(l10n.signupBirthYearHelp, style: text.bodySmall),
                    const SizedBox(height: Space.s),
                    SparkCard(
                      padding: EdgeInsets.zero,
                      child: SizedBox(
                        height: 160,
                        child: Semantics(
                          label: l10n.signupBirthYearLabel,
                          value: '$_birthYear',
                          child: CupertinoPicker(
                            scrollController: _yearController,
                            itemExtent: 44,
                            onSelectedItemChanged: (i) => setState(() => _birthYear = years[i]),
                            children: <Widget>[
                              for (final y in years)
                                Center(child: Text('$y', style: text.titleLarge)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: Space.m),
                    Text(l10n.signupTimezoneLabel, style: text.titleMedium),
                    const SizedBox(height: Space.xs),
                    Text(l10n.signupTimezoneHelp, style: text.bodySmall),
                    const SizedBox(height: Space.s),
                    SparkCard(
                      onTap: _pickTimezone,
                      semanticLabel: '${l10n.signupTimezoneLabel}: $_timezone',
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.public_rounded, color: c.secondary),
                          const SizedBox(width: Space.s),
                          Expanded(child: Text(_timezone.replaceAll('_', ' '), style: text.bodyLarge)),
                          Icon(Icons.edit_rounded, color: c.iconMuted),
                        ],
                      ),
                    ),
                    if (_error != null) ...<Widget>[
                      const SizedBox(height: Space.m),
                      Semantics(
                        liveRegion: true,
                        child: Text(errorMessage(l10n, _error!), style: text.bodyMedium?.copyWith(color: c.danger)),
                      ),
                    ],
                    const SizedBox(height: Space.l),
                    SparkButton(label: l10n.signupSubmit, onPressed: _submit, loading: _busy, expand: true),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TimezonePicker extends StatefulWidget {
  const _TimezonePicker({required this.selected});
  final String selected;

  @override
  State<_TimezonePicker> createState() => _TimezonePickerState();
}

class _TimezonePickerState extends State<_TimezonePicker> {
  late final List<String> _all = tz.timeZoneDatabase.locations.keys
      .where((z) => z.contains('/') && !z.startsWith('Etc/'))
      .toList()
    ..sort();
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final q = _query.toLowerCase().replaceAll(' ', '_');
    final filtered = q.isEmpty ? _all : _all.where((z) => z.toLowerCase().contains(q)).toList();
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.8,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(Space.m),
            child: TextField(
              autofocus: true,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search_rounded),
                hintText: l10n.signupTimezoneSearch,
              ),
              onChanged: (v) => setState(() => _query = v),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filtered.length,
              itemBuilder: (context, i) {
                final zone = filtered[i];
                return ListTile(
                  title: Text(zone.replaceAll('_', ' ')),
                  trailing: zone == widget.selected ? const Icon(Icons.check_rounded) : null,
                  onTap: () => Navigator.of(context).pop(zone),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
