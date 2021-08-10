import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavigationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NotificationModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          title: Text('Notificacions Page'),
        ),
        floatingActionButton: ButtonFloating(),
        bottomNavigationBar: ButtonNavigation(),
      ),
    );
  }
}

class ButtonNavigation extends StatefulWidget {
  @override
  _ButtonNavigationState createState() => _ButtonNavigationState();
}

class _ButtonNavigationState extends State<ButtonNavigation> {
  int _selectIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final number = Provider.of<_NotificationModel>(context).number;

    return BottomNavigationBar(
      currentIndex: _selectIndex,
      onTap: _onItemTapped,
      selectedFontSize: 20,
      selectedItemColor: Colors.red,
      elevation: 0,
      items: [
        BottomNavigationBarItem(
          label: 'Bone',
          icon: FaIcon(FontAwesomeIcons.bone),
        ),
        BottomNavigationBarItem(
            label: 'Notificantions',
            icon: Stack(
              children: <Widget>[
                FaIcon(FontAwesomeIcons.bell),
                Positioned(
                  top: 0.0,
                  right: 0.0,
                  //child: Icon(Icons.brightness_1, size: 8, color: Colors.red),
                  child: BounceInDown(
                    from: 10,
                    animate: (number > 0) ? true : false,
                    child: Bounce(
                      from: 10,
                      controller: (controller) =>
                          Provider.of<_NotificationModel>(context,
                                  listen: false)
                              .bounceController = controller,
                      child: Container(
                        width: 12,
                        height: 12,
                        child: Text(
                          '$number',
                          style: TextStyle(fontSize: 7, color: Colors.white),
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )),
        BottomNavigationBarItem(
          label: 'Dog',
          icon: FaIcon(FontAwesomeIcons.dog),
        ),
      ],
    );
  }
}

class ButtonFloating extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        int vaule =
            Provider.of<_NotificationModel>(context, listen: false).number;

        vaule++;
        Provider.of<_NotificationModel>(context, listen: false).number = vaule;

        if (vaule >= 1) {
          print('object');
          final controller =
              Provider.of<_NotificationModel>(context, listen: false)
                  ._bouncecontroller;
          controller!.forward(from: 0);
        }
      },
      backgroundColor: Colors.red,
      child: FaIcon(
        FontAwesomeIcons.play,
      ),
    );
  }
}

class _NotificationModel extends ChangeNotifier {
  int _number = 0;
  AnimationController? _bouncecontroller;

  int get number => _number;

  set number(int vaule) {
    if (vaule < 100) {
      this._number = vaule;
    }

    notifyListeners();
  }

  AnimationController get bounceController => _bouncecontroller!;

  set bounceController(AnimationController controller) {
    this._bouncecontroller = controller;
  }
}
