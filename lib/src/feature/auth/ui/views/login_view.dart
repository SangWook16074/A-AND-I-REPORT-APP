import 'package:a_and_i_report_web_server/src/feature/auth/ui/views/error_message_view.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/views/login_button_view.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/views/login_text_field_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 768;
    final isTablet = width >= 768 && width < 1200;
    final cardWidth = isMobile ? width - 40 : (isTablet ? 460.0 : 500.0);
    final verticalPadding = isMobile ? 24.0 : 30.0;
    final horizontalPadding = isMobile ? 22.0 : 30.0;
    final logoWidth = isMobile ? 120.0 : (isTablet ? 140.0 : 150.0);
    final minHeight = isMobile ? 380.0 : (isTablet ? 420.0 : 430.0);

    return Container(
      width: cardWidth,
      constraints: BoxConstraints(minHeight: minHeight),
      padding: EdgeInsets.fromLTRB(
        horizontalPadding,
        verticalPadding,
        horizontalPadding,
        isMobile ? 20 : 24,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(isMobile ? 14 : 16),
        border: Border.all(color: Colors.black.withValues(alpha: 0.06)),
        boxShadow: [
          BoxShadow(
            blurRadius: 14,
            offset: const Offset(0, 8),
            color: Colors.black.withValues(alpha: 0.06),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: logoWidth,
            child: Image.asset("assets/logo.webp"),
          ),
          SizedBox(height: isMobile ? 16 : 22),
          const LoginTextFieldView(),
          SizedBox(height: isMobile ? 12 : 14),
          const LoginButtonView(),
          const SizedBox(height: 10),
          const ErrorMessageView(),
        ],
      ),
    );
  }
}
