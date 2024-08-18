import 'package:flutter/material.dart';

class CustomNote extends StatelessWidget {
  const CustomNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: ListTile(
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.edit,
              size: 30,
            ),
          ),
          title: const Text(
            'BigTitle',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: const Text(
            'SubTitle',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
    );
  }
}
