import 'package:flutter/material.dart';

class HighlightedText extends StatelessWidget {
  final String text;
  final String matcher;

  const HighlightedText({
    required this.text,
    required this.matcher,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final spans = matcher.isNotEmpty
        ? _highlightOccurrences(context, text, matcher)
        : <TextSpan>[];

    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: spans.isNotEmpty ? TextSpan(children: spans) : TextSpan(text: text),
    );
  }

  List<TextSpan> _highlightOccurrences(
    BuildContext context,
    String source,
    String query,
  ) {
    final matches = query
        .trim()
        .toLowerCase()
        .split(' ')
        .expand((word) => word.allMatches(source.toLowerCase()))
        .toList()
      ..sort((a, b) => a.start.compareTo(b.start));

    if (matches.isEmpty) {
      return [];
    }

    final defaultStyle = Theme.of(context).textTheme.bodyText2;

    final matchStyle = defaultStyle?.copyWith(fontWeight: FontWeight.w800);

    var lastMatchEnd = 0;
    final spans = <TextSpan>[];

    for (final match in matches) {
      if (match.end >= lastMatchEnd) {
        if (match.start <= lastMatchEnd) {
          spans.add(TextSpan(
            text: source.substring(lastMatchEnd, match.end),
            style: matchStyle,
          ));
        } else {
          spans.addAll([
            TextSpan(
              text: source.substring(lastMatchEnd, match.start),
              style: defaultStyle,
            ),
            TextSpan(
              text: source.substring(match.start, match.end),
              style: matchStyle,
            ),
          ]);
        }
        lastMatchEnd = match.end;
      }
    }

    if (lastMatchEnd < source.length) {
      spans.add(TextSpan(
        text: source.substring(lastMatchEnd, source.length),
        style: defaultStyle,
      ));
    }

    return spans;
  }
}
