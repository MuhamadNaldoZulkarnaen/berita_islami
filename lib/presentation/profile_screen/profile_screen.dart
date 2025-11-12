import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) => const ProfileScreen();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // profile header
              CircleAvatar(radius: 48, backgroundColor: Colors.grey.shade200, child: const Icon(Icons.person, size: 48, color: Colors.grey)),
              const SizedBox(height: 12),
              Text('Nama Pengguna', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
              const SizedBox(height: 4),
              Text('user@example.com', style: theme.textTheme.bodySmall),
              const SizedBox(height: 20),

              // action buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.edit), label: const Text('Edit')),
                  OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.settings), label: const Text('Settings')),
                ],
              ),

              const SizedBox(height: 20),

              // user activity / saved
              Align(alignment: Alignment.centerLeft, child: Text('Activity', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600))),
              const SizedBox(height: 12),
              ListTile(
                leading: const Icon(Icons.bookmark_border),
                title: Text('Saved Articles', style: theme.textTheme.bodyLarge),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.history),
                title: Text('Reading History', style: theme.textTheme.bodyLarge),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
