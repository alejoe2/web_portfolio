part of '../pages.dart';

class SplashPage extends StatefulWidget {
  final void Function()? complete;
  const SplashPage({super.key, this.complete});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
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
    final tServices = Provider.of<ThemeServices>(context);


    return Scaffold(
      backgroundColor: (tServices.isLight)? PColors.black : PColors.white,
      body: Center(
        child: Lottie.asset(
          'assets/animations/eve_animation.json',
          controller: _controller,
          onLoaded: (composition) {
            _controller
            ..duration = composition.duration
            ..forward()
            ..repeat();
          },
        ),
      ),
    );
  }
}