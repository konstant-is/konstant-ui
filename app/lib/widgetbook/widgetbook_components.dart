import 'package:flutter/material.dart';

class WBPage extends StatelessWidget {
  final String title;
  final String? desc;
  final List<Widget> children;

  const WBPage({
    super.key,
    required this.title,
    this.desc,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: ListView(
          padding: const EdgeInsets.all(42),
          children: [
            getTitle,
            if (desc != null) ...[
              const SizedBox(height: 8),
              getDesc,
            ],
            const SizedBox(height: 40),
            ...children,
          ],
        ));
  }

  Widget get getTitle => Text(
        title,
        style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
      );

  Widget get getDesc => Text(
        desc!,
        style: TextStyle(
          color: Colors.grey.shade600,
          fontSize: 18,
          fontWeight: FontWeight.w300,
        ),
      );
}

class WBCase extends StatelessWidget {
  final String? title;
  final Widget child;
  final double maxWidth;

  const WBCase(
      {super.key,
      this.title,
      required this.child,
      this.maxWidth = double.infinity});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text(
            title ?? "",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 20),
        ],
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(40),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          child: Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: maxWidth),
              child: child,
            ),
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
