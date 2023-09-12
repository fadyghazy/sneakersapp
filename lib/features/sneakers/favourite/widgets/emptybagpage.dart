import 'package:flutter/material.dart';
import 'package:sneakers_store/features/sneakers/main/view/widgets/navigation_page.dart';
import 'package:sneakers_store/translate.dart';

class EmptyBagPage extends NavigationPage {
  const EmptyBagPage({
    required super.icon,
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(width: 8),
          Text(
            "${Translate.bagemptytext}",
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}