import 'package:flutter/material.dart';
import 'package:new_portfolio/core/network/google_form_client.dart';

import 'success_dialog.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();

  final _subjectController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  final _googleFormClient = GoogleFormClient();

  bool _isSubmitting = false;

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSubmitting = true);

    await _googleFormClient.submit(
      subject: _subjectController.text,
      email: _emailController.text,
      message: _messageController.text,
    );

    _formKey.currentState!.reset();
    _subjectController.clear();
    _emailController.clear();
    _messageController.clear();

    setState(() => _isSubmitting = false);

    if (!mounted) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const SuccessDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Contact', style: theme.textTheme.headlineMedium),
          const SizedBox(height: 16),

          Text(
            'Send a message for job opportunities or discussions.',
            style: theme.textTheme.bodyLarge,
          ),
          const SizedBox(height: 32),

          _InputField(
            label: 'Subject',
            controller: _subjectController,
            validator: (v) => v!.isEmpty ? 'Enter a subject' : null,
          ),
          const SizedBox(height: 16),

          _InputField(
            label: 'Email',
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (v) =>
                v!.contains('@') ? null : 'Enter a valid email',
          ),
          const SizedBox(height: 16),

          _InputField(
            label: 'Message',
            controller: _messageController,
            maxLines: 5,
            validator: (v) => v!.isEmpty ? 'Enter a message' : null,
          ),
          const SizedBox(height: 32),

          ElevatedButton(
            onPressed: _isSubmitting ? null : _submitForm,
            child: _isSubmitting
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Text('Send Message'),
          ),
        ],
      ),
    );
  }
}

class _InputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final TextInputType? keyboardType;
  final int maxLines;

  const _InputField({
    required this.label,
    required this.controller,
    required this.validator,
    this.keyboardType,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }
}