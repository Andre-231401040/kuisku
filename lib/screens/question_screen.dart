import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kuisku/providers/user_provider.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    final String? name = context.watch<UserProvider>().name;

    return Text('$name');
  }
}
