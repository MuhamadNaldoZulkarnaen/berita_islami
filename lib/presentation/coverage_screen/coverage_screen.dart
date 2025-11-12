import 'package:flutter/material.dart';

class CoverageScreen extends StatelessWidget {
  const CoverageScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) => const CoverageScreen();

  final List<Map<String, String>> _items = const [
    {
      'image': 'assets/images/fake_news_4.png',
      'title': 'Local coverage: community events this week',
      'channel': 'Local News',
      'time': '2h ago'
    },
    {
      'image': 'assets/images/fake_news_5.png',
      'title': 'Politics: new policies announced',
      'channel': 'Daily Report',
      'time': '3h ago'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          // include extra bottom padding to account for bottom nav / keyboard and avoid small overflows
          padding: EdgeInsets.fromLTRB(
            16,
            16,
            16,
            24 + MediaQuery.of(context).viewPadding.bottom + MediaQuery.of(context).viewInsets.bottom + 96,
          ),
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
                          hintText: 'Search coverage',
                          border: InputBorder.none,
                          isDense: true,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.tune, color: Colors.grey),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Coverage', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
                  Text('View All', style: theme.textTheme.bodySmall?.copyWith(color: Colors.orangeAccent)),
                ],
              ),
              const SizedBox(height: 12),

              // slightly larger height to prevent tight vertical constraint overflow
              SizedBox(
                height: 220,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _items.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    final item = _items[index];
                    final cardWidth = width * 0.72;
                    return SizedBox(
                      width: cardWidth,
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                              child: Image.asset(
                                item['image']!,
                                width: cardWidth,
                                height: 116,
                                fit: BoxFit.cover,
                                errorBuilder: (c, e, s) => Container(
                                  width: cardWidth,
                                  height: 116,
                                  color: Colors.grey.shade200,
                                  child: const Icon(Icons.image, color: Colors.grey),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(item['title']!, maxLines: 2, overflow: TextOverflow.ellipsis, style: theme.textTheme.bodyLarge),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Text(item['channel']!, style: theme.textTheme.bodySmall?.copyWith(color: Colors.orangeAccent)),
                                      const SizedBox(width: 8),
                                      Text(item['time']!, style: theme.textTheme.bodySmall),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
