import 'package:flutter/material.dart';
import 'package:redditech/common/const.dart';

class SubredditDescription extends StatefulWidget {
  const SubredditDescription(
      {super.key,
      required this.subredditDescription,
      required this.showMore,
      required this.showMoreCallback});
  final String subredditDescription;
  final bool showMore;
  final void Function()? showMoreCallback;

  @override
  State<SubredditDescription> createState() => _SubredditDescriptionState();
}

class _SubredditDescriptionState extends State<SubredditDescription> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final text = TextSpan(
          text: widget.subredditDescription,
        );
        final textPainter = TextPainter(
          text: text,
          maxLines: 5,
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: constraints.maxWidth);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              text,
              maxLines: widget.showMore ? null : 5,
              overflow: TextOverflow.clip,
            ),
            if (textPainter.didExceedMaxLines)
              TextButton(
                onPressed: widget.showMoreCallback,
                child: widget.showMore
                    ? const Text("Show less",
                        style: TextStyle(
                            color: neutralMedium1, fontWeight: FontWeight.w400))
                    : const Text("Show more",
                        style: TextStyle(
                            color: neutralMedium1,
                            fontWeight: FontWeight.w400)),
              ),
          ],
        );
      },
    );
  }
}
