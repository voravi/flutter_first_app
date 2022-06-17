import 'dart:developer';

import 'package:flutter/material.dart';

class TicTacToe extends StatefulWidget {
  const TicTacToe({Key? key}) : super(key: key);

  @override
  _TicTacToeState createState() => _TicTacToeState();
}

List<String> playerTurn = ["", "", "", "", "", "", "", "", ""];

class Player {
  static const none = "";
  static const X = 'X';
  static const O = 'O';
}

class _TicTacToeState extends State<TicTacToe> {
  String lastMove = Player.none;

  int filledBox = 0;
  bool isXTurn = true;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: backgroundColor().withAlpha(150),
          appBar: AppBar(
              backgroundColor: isXTurn ? Colors.red : Colors.blue,
              title: Text(
                "Tic Tac Teo",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              )),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 160),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GridView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: 9,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      crossAxisCount: 3,
                      childAspectRatio: 2 / 2,
                    ),
                    itemBuilder: (BuildContext context, index) {
                      String value = playerTurn[index];
                      final color = getFieldColor(value);
                      return InkWell(
                        onTap: () {
                          selectField(value, index);
                          setState(() {
                            if (filledBox <= 9) {
                              isXTurn = !isXTurn;
                            }
                          });
                        },
                        child: Container(
                          height: 110,
                          width: 110,
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              "${playerTurn[index]}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  void selectField(String value, int index) {
    if (value == Player.none) {
      final newValue = lastMove == Player.X ? Player.O : Player.X;
      filledBox++;
      setState(() {
        lastMove = newValue;
        playerTurn[index] = newValue;
      });
      log(isEnd().toString(), name: "Mathod");
      if (isWinner(index)) {
        showEndDialog("Player $newValue Won");
      } else if (isEnd()) {
        drawDialog();
      }
    }
  }

  Future<dynamic> showEndDialog(String title) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Player $title Won"),
        content: Text("Press to restart the game"),
        actions: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                for (int i = 0; i <= 8; i++) {
                  playerTurn[i] = Player.none;
                }
                filledBox = 0;
              });
              Navigator.pop(context);
            },
            child: Text(
              "Restart",
            ),
          ),
        ],
      ),
    );
  }

  Color getFieldColor(String value) {
    switch (value) {
      case Player.O:
        return Colors.blue;
      case Player.X:
        return Colors.red;
      default:
        return Colors.white;
    }
  }

  Color backgroundColor() {
    final thisMove = lastMove == Player.X ? Player.O : Player.X;

    return getFieldColor(thisMove);
  }

  bool isWinner(index) {
    var col = 0, row = 0, diag = 0, rdiag = 0;
    const n = 9;

    if (playerTurn[0] == playerTurn[1] &&
        playerTurn[0] == playerTurn[2] &&
        playerTurn[0] != '') {
      showEndDialog(playerTurn[0]);
    }
    if (playerTurn[3] == playerTurn[4] &&
        playerTurn[3] == playerTurn[5] &&
        playerTurn[3] != '') {
      showEndDialog(playerTurn[3]);
    }
    if (playerTurn[6] == playerTurn[7] &&
        playerTurn[6] == playerTurn[8] &&
        playerTurn[6] != '') {
      showEndDialog(playerTurn[6]);
    }

    // Checking Column
    if (playerTurn[0] == playerTurn[3] &&
        playerTurn[0] == playerTurn[6] &&
        playerTurn[0] != '') {
      showEndDialog(playerTurn[0]);
    }
    if (playerTurn[1] == playerTurn[4] &&
        playerTurn[1] == playerTurn[7] &&
        playerTurn[1] != '') {
      showEndDialog(playerTurn[1]);
    }
    if (playerTurn[2] == playerTurn[5] &&
        playerTurn[2] == playerTurn[8] &&
        playerTurn[2] != '') {
      showEndDialog(playerTurn[2]);
    }

    // Checking Diagonal
    if (playerTurn[0] == playerTurn[4] &&
        playerTurn[0] == playerTurn[8] &&
        playerTurn[0] != '') {
      showEndDialog(playerTurn[0]);
    }
    if (playerTurn[2] == playerTurn[4] &&
        playerTurn[2] == playerTurn[6] &&
        playerTurn[2] != '') {
      showEndDialog(playerTurn[2]);
    } else if (filledBox == 9) {}

    return row == n || col == n || diag == n || rdiag == n;
  }

  void drawDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Draw"),
            content: Text("Press to restart the game"),
            actions: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    for (int i = 0; i <= 8; i++) {
                      playerTurn[i] = Player.none;
                    }
                    filledBox = 0;
                  });
                  Navigator.pop(context);
                },
                child: Text("Restart"),
              ),
            ],
          );
        });
  }

  bool isEnd() => playerTurn.every(
        (element) {
          log(filledBox.toString(), name: "filled Box");
          return element != Player.none;
        },
      );
}

class RestartWidget extends StatefulWidget {
  RestartWidget({required this.child});

  final Widget child;

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>()!.restartApp();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}
