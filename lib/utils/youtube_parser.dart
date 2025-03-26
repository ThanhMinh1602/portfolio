class YouTubeParser {
  /// Extracts the video ID from various YouTube URL formats
  static String? getVideoId(String? url) {
    if (url == null || url.isEmpty) return null;

    // Remove any whitespace
    url = url.trim();

    // Handle different YouTube URL formats
    final patterns = [
      // Standard YouTube URL: https://www.youtube.com/watch?v=VIDEO_ID
      RegExp(r'(?:youtube\.com\/watch\?v=|youtu\.be\/)([^&\n?]+)'),
      // YouTube Short URL: https://youtu.be/VIDEO_ID
      RegExp(r'youtu\.be\/([^&\n?]+)'),
      // YouTube Embed URL: https://www.youtube.com/embed/VIDEO_ID
      RegExp(r'youtube\.com\/embed\/([^&\n?]+)'),
    ];

    for (final pattern in patterns) {
      final match = pattern.firstMatch(url);
      if (match != null && match.groupCount >= 1) {
        return match.group(1);
      }
    }

    return null;
  }

  /// Checks if the URL is a valid YouTube URL
  static bool isValidYouTubeUrl(String? url) {
    if (url == null || url.isEmpty) return false;
    return getVideoId(url) != null;
  }

  /// Gets the embed URL for a YouTube video
  static String? getEmbedUrl(String? url) {
    final videoId = getVideoId(url);
    if (videoId == null) return null;
    return 'https://www.youtube.com/embed/$videoId';
  }
}
