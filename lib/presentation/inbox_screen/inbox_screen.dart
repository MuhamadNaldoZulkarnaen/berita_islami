import 'package:flutter/material.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) => const InboxScreen();

  final List<Map<String, String>> _messages = const [
    {
      'avatar': 'assets/images/fake_avatar_1.png',
      'title': 'Editor: New comments on your article',
      'subtitle': 'There are 3 new comments awaiting review',
      'time': '1h'
    },
    {
      'avatar': 'assets/images/fake_avatar_2.png',
      'title': 'Subscriber: Question about subscription',
      'subtitle': 'How do I update payment method?',
      'time': '3h'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search field
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Colors.grey),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: 'Search messages',
                          border: InputBorder.none,
                          isDense: true,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.more_vert, color: Colors.grey),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Inbox', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
                  Text('View All', style: theme.textTheme.bodySmall?.copyWith(color: Colors.orangeAccent)),
                ],
              ),
              const SizedBox(height: 12),

              Column(
                children: _messages.map((m) {
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
                    leading: ClipOval(
                      child: Image.asset(
                        m['avatar']!,
                        width: 48,
                        height: 48,
                        fit: BoxFit.cover,
                        errorBuilder: (c, e, s) => Container(
                          width: 48,
                          height: 48,
                          color: Colors.grey.shade200,
                          child: const Icon(Icons.person, color: Colors.grey),
                        ),
                      ),
                    ),
                    title: Text(m['title']!, style: theme.textTheme.bodyLarge),
                    subtitle: Text(m['subtitle']!, style: theme.textTheme.bodySmall),
                    trailing: Text(m['time']!, style: theme.textTheme.bodySmall),
                    onTap: () {},
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
