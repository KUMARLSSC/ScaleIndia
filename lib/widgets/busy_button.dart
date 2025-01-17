import 'package:Scaleindia/shared/shared_styles.dart';
import 'package:Scaleindia/widgets/loader_animation.dart';
import 'package:flutter/material.dart';

/// A button that shows a busy indicator in place of title
class BusyButton extends StatefulWidget {
  final bool busy;
  final String title;
  final Function onPressed;
  final bool enabled;
  final Color color;
  const BusyButton(
      {@required this.title,
      this.busy = false,
      @required this.onPressed,
      this.enabled = true,
      this.color});

  @override
  _BusyButtonState createState() => _BusyButtonState();
}

class _BusyButtonState extends State<BusyButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: InkWell(
        child: AnimatedContainer(
            height: widget.busy ? 50 :50,
            width: widget.busy ? 50 : 150,
            duration: const Duration(milliseconds: 300),
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
                horizontal: widget.busy ? 10 : 15,
                vertical: widget.busy ? 10 : 10),
            decoration: BoxDecoration(
              color: widget.enabled ? widget.color : Colors.green[600],
              borderRadius: BorderRadius.circular(10),
            ),
            child: !widget.busy
                ? Text(
                    widget.title,
                    style: buttonTitleTextStyle,
                  )
                : ColorLoader3(
                    radius: 15,
                    dotRadius: 5,
                  )),
      ),
    );
  }
}
