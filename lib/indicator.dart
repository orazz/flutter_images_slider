import 'package:flutter/material.dart';
import 'package:flutter_images_slider/helpers.dart';

class PageIndicator extends StatefulWidget {
  final Color indicatorBackColor;

  final Color indicatorColor;

  final int length;

  final int realPage;

  final PageController controller;

  final double indicatorSpace;

  final double indicatorWidth;

  const PageIndicator(
      {Key key,
      this.indicatorBackColor = Colors.white,
      this.indicatorColor = Colors.grey,
      @required this.controller,
      @required this.length,
      @required this.realPage,
      this.indicatorSpace = 4.0,
      this.indicatorWidth = 6})
      : super(key: key);

  @override
  _PageIndicatorState createState() => _PageIndicatorState();
}

class _PageIndicatorState extends State<PageIndicator> {
  PageController get controller => widget.controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: CustomPaint(
        child: Container(
          height: double.infinity,
        ),
        painter: LinePainter(
          indicatorBackColor: widget.indicatorBackColor,
          indicatorColor: widget.indicatorColor,
          count: widget.length,
          realPage: widget.realPage,
          page: widget.controller.page ?? controller.initialPage.toDouble(),
          padding: widget.indicatorSpace,
          indicatorWidth: widget.indicatorWidth,
        ),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  double page;
  int count;
  int realPage;
  Color indicatorBackColor;
  Color indicatorColor;
  double padding;
  double indicatorWidth;

  Paint _backLinePaint;
  Paint _indicatorLinePaint;
  LinePainter({
    this.page = 0.0,
    this.count = 0,
    this.realPage = 0,
    this.indicatorBackColor = Colors.white,
    this.indicatorColor = Colors.grey,
    this.padding = 3.0,
    this.indicatorWidth = 6.0,
  }) {
    _backLinePaint = Paint();
    _backLinePaint.color = indicatorBackColor;
    _backLinePaint.strokeWidth = indicatorWidth;

    _indicatorLinePaint = Paint();
    _indicatorLinePaint.color = indicatorColor;
    _indicatorLinePaint.strokeWidth = indicatorWidth;

    this.realPage ??= 0;
    this.page ??= 0.0;
    this.count ??= 0;
    this.indicatorBackColor ??= Colors.white;
    this.indicatorColor ??= Colors.grey;
    this.padding ??= 3.0;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(
        Offset(0.0, padding), Offset(size.width, padding), _backLinePaint);

    final double index =
        Helpers.getRealIndex(page, realPage.toDouble(), count.toDouble());

    var selectedX = (size.width / count) * (index);

    if (index > count - 1) {
      double startX = index.abs() - (count - 1);

      canvas.drawLine(Offset(startX - 1, padding),
          Offset(startX * (size.width / count), padding), _indicatorLinePaint);
    }

    canvas.drawLine(Offset(selectedX, padding),
        Offset(selectedX + (size.width / count), padding), _indicatorLinePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
