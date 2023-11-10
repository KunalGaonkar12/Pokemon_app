import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PokemonType extends StatelessWidget {
  const PokemonType(
      this.type, {
        Key? key,
        this.large = true,
        this.extra = '',
      }) : super(key: key);

  final String type;
  final String extra;
  final bool large;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: large ? 15 : 12,
            vertical: large ? 5 : 4,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.grey.withOpacity(0.1),
            border: Border.all(color: Colors.white,width: 0.1),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                type,
                textScaleFactor: 1,
                style: TextStyle(
                    fontSize: large ? 12 : 8,
                    height: 0.8,
                    fontWeight: large ? FontWeight.bold : FontWeight.normal,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}