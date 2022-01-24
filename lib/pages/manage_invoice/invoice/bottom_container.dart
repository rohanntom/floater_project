import 'package:flutter/material.dart';
import 'package:floater/floater.dart';
import 'bottom_container_state.dart';

class BottomContainer extends StatefulWidgetBase<BottomContainerState> {
  BottomContainer() : super(BottomContainerState.new);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 430,
      height: 80,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: const [
                  Text(
                    'Total: ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    '0.00',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            const Spacer(),
            InkWell(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(6),
                ),
                width: 150,
                height: 65,
                child: InkWell(
                  onTap: null,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Confirm',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
