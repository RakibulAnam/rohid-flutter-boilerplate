enum AppRoutes {
  splash('splash', '/splash'),
  dashboard('dashboard', '/dashboard'),
  counter('counter', '/counter'),
  settings('settings', '/settings');


  final String name;

  /// Path template. May include params like `/users/:id`.
  final String path;

  const AppRoutes(this.name, this.path);

  /// Build a location string with [pathParams] and [queryParams].
  /// - Replaces occurrences of `:key` in the path with encoded values.
  /// - Appends encoded query parameters.
  String location({
    Map<String, String> pathParams = const {},
    Map<String, Object?> queryParams = const {},
  }) {
    String filled = path;

    if (pathParams.isNotEmpty) {
      for (final entry in pathParams.entries) {
        filled = filled.replaceAll(
          ':${entry.key}',
          Uri.encodeComponent(entry.value),
        );
      }
    }

    if (queryParams.isEmpty) return filled;

    final List<String> segments = <String>[];
    for (final entry in queryParams.entries) {
      final String key = Uri.encodeQueryComponent(entry.key);
      final Object? value = entry.value;
      if (value == null) continue;
      if (value is Iterable) {
        for (final Object item in value) {
          segments.add('$key=${Uri.encodeQueryComponent(item.toString())}');
        }
      } else {
        segments.add('$key=${Uri.encodeQueryComponent(value.toString())}');
      }
    }

    if (segments.isEmpty) return filled;
    return '$filled?${segments.join('&')}';
  }
}
