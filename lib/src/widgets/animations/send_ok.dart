part of '../widgets.dart';

class SendOkWidget extends StatefulWidget {
  final void Function()? complete;
  const SendOkWidget({
    super.key, this.complete
    });
  @override
  State<SendOkWidget> createState() => _SendOkWidgetState();
}

class _SendOkWidgetState extends State<SendOkWidget> with TickerProviderStateMixin {
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
        'assets/animations/send_ok.json',
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