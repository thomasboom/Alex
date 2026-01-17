import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/settings_service.dart';
import '../l10n/app_localizations.dart';

/// A dialog widget for PIN entry with 4 separate input fields
class PinEntryDialog extends StatefulWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onSuccess;
  final bool showBackButton;

  const PinEntryDialog({
    super.key,
    this.title = 'Enter PIN',
    this.subtitle = 'Please enter your 4-digit PIN to continue',
    this.onSuccess,
    this.showBackButton = false,
  });

  @override
  State<PinEntryDialog> createState() => _PinEntryDialogState();
}

class _PinEntryDialogState extends State<PinEntryDialog> {
  final List<TextEditingController> _controllers = List.generate(
    4,
    (index) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());
  String _errorMessage = '';
  bool _isVerifying = false;
  late AppLocalizations _l10n;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNodes[0].requestFocus();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _l10n = AppLocalizations.of(context)!;
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _onDigitChanged(String value, int index) {
    if (value.isNotEmpty) {
      if (index < 3) {
        _focusNodes[index + 1].requestFocus();
      } else {
        _focusNodes[index].unfocus();
        _verifyPin();
      }
    }
  }

  void _onSubmitted(String value, int index) {
    if (index < 3) {
      _focusNodes[index + 1].requestFocus();
    } else {
      _verifyPin();
    }
  }

  void _handleKeyEvent(RawKeyEvent event, int index) {
    if (event is RawKeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.backspace) {
        if (_controllers[index].text.isEmpty && index > 0) {
          _focusNodes[index - 1].requestFocus();
          _controllers[index - 1].clear();
        }
      }
    }
  }

  void _verifyPin() async {
    final pin = _controllers.map((c) => c.text).join();
    if (pin.length != 4) return;

    setState(() {
      _isVerifying = true;
      _errorMessage = '';
    });

    await Future.delayed(const Duration(milliseconds: 300));

    if (SettingsService.verifyPin(pin)) {
      if (mounted) {
        Navigator.of(context).pop(true);
        widget.onSuccess?.call();
      }
    } else {
      setState(() {
        _errorMessage = _l10n.incorrectPin;
        _isVerifying = false;
        for (var controller in _controllers) {
          controller.clear();
        }
        _focusNodes[0].requestFocus();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isDesktop = screenSize.width > 600;
    final padding = isDesktop ? 24.0 : 32.0;
    final fieldSize = isDesktop ? 64.0 : 72.0;

    return PopScope(
      canPop: widget.showBackButton,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).colorScheme.surface,
                Theme.of(context).colorScheme.surface.withValues(alpha: 0.95),
              ],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        widget.title,
                        style: GoogleFonts.playfairDisplay(
                          fontSize: isDesktop ? 32 : 28,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: isDesktop ? 16 : 12),
                      Text(
                        widget.subtitle,
                        style: GoogleFonts.playfairDisplay(
                          fontSize: isDesktop ? 18 : 16,
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withValues(alpha: 0.7),
                          height: 1.4,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  SizedBox(height: isDesktop ? 48 : 64),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(4, (index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: isDesktop ? 6 : 12,
                        ),
                        child: RawKeyboardListener(
                          focusNode: FocusNode(),
                          onKey: (event) => _handleKeyEvent(event, index),
                          child: SizedBox(
                            width: fieldSize,
                            height: fieldSize,
                            child: TextField(
                              controller: _controllers[index],
                              focusNode: _focusNodes[index],
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              obscureText: true,
                              obscuringCharacter: '•',
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(1),
                              ],
                              style: GoogleFonts.playfairDisplay(
                                fontSize: fieldSize * 0.5,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).colorScheme.onSurface,
                                letterSpacing: 4,
                              ),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Theme.of(
                                  context,
                                ).colorScheme.surface,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Theme.of(context).colorScheme.outline
                                        .withValues(alpha: 0.3),
                                    width: 1.5,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Theme.of(context).colorScheme.outline
                                        .withValues(alpha: 0.3),
                                    width: 1.5,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                    width: 2,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Theme.of(context).colorScheme.error,
                                    width: 1.5,
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Theme.of(context).colorScheme.error,
                                    width: 2,
                                  ),
                                ),
                                contentPadding: EdgeInsets.zero,
                                counterText: '',
                              ),
                              onChanged: (value) =>
                                  _onDigitChanged(value, index),
                              onSubmitted: (value) =>
                                  _onSubmitted(value, index),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  if (_errorMessage.isNotEmpty) ...[
                    SizedBox(height: 16),
                    Text(
                      _errorMessage,
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.error,
                        height: 1.4,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                  if (_isVerifying) ...[
                    SizedBox(height: 16),
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Show PIN entry dialog and return true if PIN is correct
Future<bool> showPinEntryDialog(
  BuildContext context, {
  String? title,
  String? subtitle,
  VoidCallback? onSuccess,
  bool showBackButton = false,
}) async {
  final l10n = AppLocalizations.of(context)!;
  final result = await Navigator.of(context).push<bool>(
    MaterialPageRoute(
      builder: (context) => PinEntryDialog(
        title: title ?? l10n.enterPin,
        subtitle: subtitle ?? l10n.enterPinToContinue,
        onSuccess: onSuccess,
        showBackButton: showBackButton,
      ),
      fullscreenDialog: true,
    ),
  );
  return result ?? false;
}
