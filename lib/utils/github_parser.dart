class GitHubParser {
  static String? getRepoOwner(String? link) {
    if (link == null || !link.contains('github.com')) {
      return null;
    }

    final parts = link.split('/');
    if (parts.length >= 5) {
      return parts[3]; // Phần sau "github.com"
    }
    return null;
  }

  static String? getRepoName(String? link) {
    if (link == null || !link.contains('github.com')) {
      return null;
    }

    final parts = link.split('/');
    if (parts.length >= 5) {
      return parts[4].replaceAll('.git', ''); // Loại bỏ ".git" nếu có
    }
    return null;
  }
}
