part of '../widgets.dart';

class ErrorWidgetAnimate extends StatefulWidget {
  final void Function()? complete;
  const ErrorWidgetAnimate({
    super.key, this.complete
    });
  @override
  State<ErrorWidgetAnimate> createState() => _ErrorWidgetAnimateState();
}

class _ErrorWidgetAnimateState extends State<ErrorWidgetAnimate> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        'assets/animations/error.json',
        controller: _controller,
        onLoaded: (composition) {
          _controller
          ..duration = composition.duration
          ..forward()
          ..addStatusListener((status) { 
            if (status == AnimationStatus.completed) {
              if (widget.complete!=null) widget.complete!();
            }
          });
        },
      ),
    );
  }
}