import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_theme.dart';

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUser;
  final DateTime timestamp;
  final bool isLoading;

  const ChatMessage({
    super.key,
    required this.text,
    required this.isUser,
    required this.timestamp,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 32),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppTheme.getMessageBackgroundColor(context, isLoading),
                  blurRadius: 50,
                  spreadRadius: 8,
                ),
                BoxShadow(
                  color: AppTheme.getMessageShadowColor(context, isLoading),
                  blurRadius: 100,
                  spreadRadius: 20,
                ),
              ],
            ),
            width: 220,
            height: 220,
          ),
          if (text.isNotEmpty)
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              height: 220,
              child: Center(
                child: Text(
                  text,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 28,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.onSurface,
                    height: 1.6,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
