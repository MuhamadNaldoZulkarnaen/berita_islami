/// This class is used in the [news_feed_home_screen] screen.

// ignore_for_file: must_be_immutable
class NewsFeedHomeModel {
  NewsFeedHomeModel({
    this.title,
    this.description,
    this.channel,
    this.timeAgo,
    this.likeCount,
    this.commentCount,
    this.shareCount,
    this.isLiked,
  }) {
    title = title ??
        'Making the Most of Outdoor Space for a Bountiful and Beautiful Vegetable Garden';
    description =
        description ?? 'Featured article about gardening and outdoor spaces';
    channel = channel ?? 'Nature Channel';
    timeAgo = timeAgo ?? '36min ago';
    likeCount = likeCount ?? 800;
    commentCount = commentCount ?? 201;
    shareCount = shareCount ?? 122;
    isLiked = isLiked ?? false;
  }

  String? title;
  String? description;
  String? channel;
  String? timeAgo;
  int? likeCount;
  int? commentCount;
  int? shareCount;
  bool? isLiked;
}
