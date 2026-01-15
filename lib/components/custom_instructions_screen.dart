import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/custom_instructions_service.dart';
import '../l10n/app_localizations.dart';

class CustomInstructionsScreen extends StatefulWidget {
  const CustomInstructionsScreen({super.key});

  @override
  State<CustomInstructionsScreen> createState() =>
      _CustomInstructionsScreenState();
}

class _CustomInstructionsScreenState extends State<CustomInstructionsScreen> {
  late AppLocalizations _l10n;
  final _instructionController = TextEditingController();

  @override
  void dispose() {
    _instructionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _l10n.customInstructions,
          style: GoogleFonts.playfairDisplay(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      body: Container(
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
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<List<CustomInstruction>>(
                stream: CustomInstructionsService.instructionsStream,
                initialData: CustomInstructionsService.allInstructions,
                builder: (context, snapshot) {
                  final instructions = snapshot.data ?? [];
                  if (instructions.isEmpty) {
                    return _buildEmptyState();
                  }
                  return ListView.builder(
                    padding: const EdgeInsets.all(20),
                    itemCount: instructions.length,
                    itemBuilder: (context, index) {
                      return _buildInstructionCard(instructions[index]);
                    },
                  );
                },
              ),
            ),
            _buildAddInstructionSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.lightbulb_outline,
              size: 64,
              color: Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: 0.5),
            ),
            const SizedBox(height: 24),
            Text(
              _l10n.noCustomInstructions,
              textAlign: TextAlign.center,
              style: GoogleFonts.playfairDisplay(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.8),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              _l10n.customInstructionsHint,
              textAlign: TextAlign.center,
              style: GoogleFonts.playfairDisplay(
                fontSize: 14,
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.6),
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInstructionCard(CustomInstruction instruction) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                instruction.text,
                style: GoogleFonts.playfairDisplay(
                  fontSize: 15,
                  color: instruction.isActive
                      ? Theme.of(context).colorScheme.onSurface
                      : Theme.of(
                          context,
                        ).colorScheme.onSurface.withValues(alpha: 0.5),
                  height: 1.4,
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                instruction.isActive ? Icons.visibility : Icons.visibility_off,
                size: 20,
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.5),
              ),
              onPressed: () {
                CustomInstructionsService.toggleInstruction(instruction.id);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.delete_outline,
                size: 20,
                color: Theme.of(
                  context,
                ).colorScheme.error.withValues(alpha: 0.7),
              ),
              onPressed: () {
                _showDeleteDialog(instruction);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddInstructionSection() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _instructionController,
              decoration: InputDecoration(
                hintText: _l10n.instructionHint,
                hintStyle: GoogleFonts.playfairDisplay(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.5),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
              style: GoogleFonts.playfairDisplay(),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _addInstruction,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  _l10n.addInstruction,
                  style: GoogleFonts.playfairDisplay(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addInstruction() {
    final text = _instructionController.text.trim();
    if (text.isEmpty) return;

    CustomInstructionsService.addInstruction(text);
    _instructionController.clear();
  }

  void _showDeleteDialog(CustomInstruction instruction) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            _l10n.deleteInstruction,
            style: GoogleFonts.playfairDisplay(fontWeight: FontWeight.w600),
          ),
          content: Text(
            _l10n.deleteInstructionConfirm,
            style: GoogleFonts.playfairDisplay(),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(_l10n.cancel, style: GoogleFonts.playfairDisplay()),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                CustomInstructionsService.deleteInstruction(instruction.id);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.error,
                foregroundColor: Theme.of(context).colorScheme.onError,
              ),
              child: Text(_l10n.delete, style: GoogleFonts.playfairDisplay()),
            ),
          ],
        );
      },
    );
  }
}
