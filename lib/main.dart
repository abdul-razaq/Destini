import 'package:flutter/material.dart';

import 'story_brain.dart';

void main() => runApp(Destini());

class Destini extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Destini',
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

final StoryBrain storyBrain = StoryBrain();

class StoryPage extends StatefulWidget {
  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/background.png'), fit: BoxFit.cover),
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    storyBrain.getStory,
                    style:
                        TextStyle(fontSize: 25.0, fontFamily: "Roboto-Black"),
                  ),
                ),
                flex: 12,
              ),
              Expanded(
                child: Container(
                  child: Visibility(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          storyBrain.nextStory(1);
                        });
                      },
                      child: Text(
                        storyBrain.getChoice1,
                        style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    visible: storyBrain.buttonShouldBeVisible,
                  ),
                  color: Colors.red,
                ),
                flex: 2,
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: Container(
                    child: Visibility(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            storyBrain.nextStory(2);
                          });
                        },
                        child: Text(
                          storyBrain.getChoice2,
                          style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      visible: storyBrain.buttonShouldBeVisible,
                    ),
                    color: Colors.blue),
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
