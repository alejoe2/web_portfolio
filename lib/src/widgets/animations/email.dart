part of '../widgets.dart';

class EmailWidget extends StatefulWidget {
  const EmailWidget({
    super.key,
    });
  @override
  State<EmailWidget> createState() => _EmailWidgetState();
}

class _EmailWidgetState extends State<EmailWidget> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tServices = Provider.of<ThemeServices>(context);

    return Center(
      child: Column(
        children: [
          Lottie.asset(
            'assets/animations/email.json',
            width: 100,
            height: 100,
            controller: _controller,           
          ),
          MouseRegion(
            onHover: (_) => _controller..forward()..repeat(),
            onExit: (_) => _controller.forward(),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SelectableText(
                'echeverrialuish@hotmail.com',
                onTap: () async => await launchUrl(Uri.parse('mailto:echeverrialuish@hotmail.com')),
                style: GoogleFonts.cabin( fontSize: 20, color: tServices.isLight ? PColors.white : PColors.black)
              ),
            ),
          ),
        ],
      ),
    );
  }
}