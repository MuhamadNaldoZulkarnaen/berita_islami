import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) => const SearchScreen();

  final List<String> _popularTags = const [
    '#FridayMorning',
    '#CollegeColorsDay',
    '#instagramDown',
    '#FridayFeeling',
    '#ThursdayVibes',
    '#DigitalCurrency',
    '#Bitcoin',
    '#Cryptocurrency',
    '#knifeTalk',
  ];

  final List<Map<String, String>> _latestNews = const [
    {
      'image': 'assets/images/fake_news_1.png',
      'title': 'Climate change: Arctic warming linked to colder winters',
      'channel': 'Nature Channel',
      'time': '4 min ago'
    },
    {
      'image': 'assets/images/fake_news_2.png',
      'title': 'Tokyo Paralympics: medals and pass 10k view',
      'channel': 'BBC Sport',
      'time': '5 min ago'
    },
    {
      'image': 'assets/images/fake_news_3.png',
      'title': 'Economic update: market shifts and forecasts',
      'channel': 'Business Daily',
      'time': '10 min ago'
    },
  ];

  final List<Map<String, String>> _recommendations = const [
    {
      'image': 'assets/images/fake_thumb_1.png',
      'title': 'US jobs growth disappoints as recovery falters'
    },
    {
      'image': 'assets/images/fake_thumb_2.png',
      'title': 'Food price rise fears amid staff shortages'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          // add extra bottom padding to account for bottom navigation bar and keyboard
          padding: EdgeInsets.fromLTRB(
            16,
            16,
            16,
            // include system bottom padding, keyboard inset and an additional buffer
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
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 6, offset: const Offset(0, 2)),
                  ],
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Colors.grey),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: 'Search',
                          border: InputBorder.none,
                          isDense: true,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.filter_list, color: Colors.grey),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Popular Tags
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Popular Tags', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
                  Text('View All', style: theme.textTheme.bodySmall?.copyWith(color: Colors.orangeAccent)),
                ],
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _popularTags.map((t) => Chip(label: Text(t), backgroundColor: theme.cardColor)).toList(),
              ),

              const SizedBox(height: 20),

              // Latest News header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Latest News', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
                  Text('View All', style: theme.textTheme.bodySmall?.copyWith(color: Colors.orangeAccent)),
                ],
              ),
              const SizedBox(height: 12),

              // Horizontal list with one large card and others
              // increased height slightly to avoid small RenderFlex overflows on tight layouts
              SizedBox(
                height: 220,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _latestNews.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    final item = _latestNews[index];
                    final cardWidth = index == 0 ? width * 0.7 : 220.0;
                    return SizedBox(
                      width: cardWidth,
                      child: Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                              // slightly reduce image height so text and paddings fit inside the card
                              child: _buildImage(item['image']!, height: 116, width: cardWidth),
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
                                      Container(width: 4, height: 4, decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.grey)),
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

              const SizedBox(height: 20),

              // Recommendation Topic
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Recomendation Topic', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
                  Text('View All', style: theme.textTheme.bodySmall?.copyWith(color: Colors.orangeAccent)),
                ],
              ),
              const SizedBox(height: 12),

              Column(
                children: _recommendations.map((r) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(r['title']!, style: theme.textTheme.bodyLarge),
                      ),
                      const SizedBox(width: 12),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: _buildImage(r['image']!, width: 64, height: 64),
                      )
                    ],
                  ),
                )).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage(String assetName, {double? width, double? height}) {
    // Use Image.asset; if asset doesn't exist at runtime the error widget is a neutral placeholder.
    return Image.asset(
      assetName,
      width: width,
      height: height,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) => Container(
        width: width,
        height: height,
        color: Colors.grey.shade200,
        child: const Icon(Icons.image, color: Colors.grey, size: 28),
      ),
    );
  }
}
