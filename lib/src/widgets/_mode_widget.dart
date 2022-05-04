import 'package:flutter/material.dart';

import '../../image_painter.dart';

class SelectionItems extends StatelessWidget {
  final bool isSelected;
  final ModeData data;
  final VoidCallback onTap;

  const SelectionItems({Key key, this.isSelected, this.data, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: isSelected ? Colors.blue : Colors.transparent),
      child: ListTile(
        leading: IconTheme(
          data: IconThemeData(opacity: 1.0),
          child:
              Icon(data.icon, color: isSelected ? Colors.white : Colors.black),
        ),
        title: Text(
          data.label,
          style: Theme.of(context).textTheme.subtitle1.copyWith(
              color: isSelected
                  ? Colors.white
                  : Theme.of(context).textTheme.bodyText1.color),
        ),
        onTap: onTap,
        contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
        selected: isSelected,
      ),
    );
  }
}

const List<ModeData> paintModes = [
  ModeData(icon: Icons.edit, mode: PaintMode.freeStyle, label: "Freihand"),
  ModeData(icon: Icons.lens_outlined, mode: PaintMode.circle, label: "Kreis"),
  ModeData(icon: Icons.crop_free, mode: PaintMode.rect, label: "Rechteck"),
  ModeData(
      icon: Icons.arrow_right_alt_outlined,
      mode: PaintMode.arrow,
      label: "Pfeil"),
  ModeData(icon: Icons.horizontal_rule, mode: PaintMode.line, label: "Linie"),
  ModeData(icon: Icons.power_input, mode: PaintMode.dashLine, label: "Strichlinie"),
  // ModeData(icon: Icons.text_format, mode: PaintMode.text, label: "Text"),
  // ModeData(icon: Icons.zoom_out_map, mode: PaintMode.none, label: "Keine / Zoom"),
];

@immutable
class ModeData {
  final IconData icon;
  final PaintMode mode;
  final String label;
  const ModeData({
    this.icon,
    this.mode,
    this.label,
  });
}
