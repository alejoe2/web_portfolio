part of '../widgets.dart';

class IconButtonCustom extends StatefulWidget {
  final String icon;
  final bool themeColor;
  final double width, height; 
  final void Function()? onTap;
  

  const IconButtonCustom({
    super.key, 
    required this.icon, 
    this.width = 25, 
    this.height = 25, 
    this.onTap, 
    this.themeColor = true,
  });

  @override
  State<IconButtonCustom> createState() => _IconButtonCustomState();
}

class _IconButtonCustomState extends State<IconButtonCustom> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {

    final themeServices = Provider.of<ThemeServices>(context);

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: InkWell(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: SvgPicture.asset('assets/svg/${widget.icon}', 
            width: widget.width,
            height: widget.height,
            colorFilter: widget.themeColor
            ? ColorFilter.mode(
              (themeServices.isLight) 
                ? (isHovered) ? PColors.greenSec : PColors.white
                : (isHovered) ? PColors.greenTer : PColors.green, BlendMode.srcIn)
            : null
          ),
        ),
      ),
    );
  }
}