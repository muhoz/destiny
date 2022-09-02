import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'story_brain.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(Destini());

class Destini extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

//TODO: Step 9 - Create a new storyBrain object from the StoryBrain class.
StoryBrain storyp = StoryBrain();

class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  int choice = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          minimum: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    //TODO: Step 10 - use the storyBrain to get the first story title and display it in this Text Widget.
                    storyp.getStory(),
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.oleoScriptSwashCaps(textStyle: TextStyle(
                      fontSize: 35.0,
                    ),)
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        storyp.nextStory(1);
                      });
                      //Choice 1 made by user.
                      //TODO: Step 18 - Call the nextStory() method from storyBrain and pass the number 1 as the choice made by the user.
                    },
                    child: Text(
                      //TODO: Step 13 - Use the storyBrain to get the text for choice 1.
                      storyp.getChoice1(),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.oleoScriptSwashCaps(textStyle:TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                      ),)
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 1,
                //TODO: Step 26 - Use a Flutter Visibility Widget to wrap this FlatButton.
                //TODO: Step 28 - Set the "visible" property of the Visibility Widget to equal the output from the buttonShouldBeVisible() method in the storyBrain.
                child: Visibility(
                  visible: storyp.buttonShouldBeVisible(),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          storyp.nextStory(2);
                        });
                        //Choice 2 made by user.
                        //TODO: Step 19 - Call the nextStory() method from storyBrain and pass the number 2 as the choice made by the user.
                      },
                      child: Text(
                        //TODO: Step 14 - Use the storyBrain to get the text for choice 2.
                        storyp.getChoice2(),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.oleoScriptSwashCaps(textStyle:TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                        ),)
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//TODO: Step 24 - Run the app and try to figure out what code you need to add to this file to make the story change when you press on the choice buttons.

//TODO: Step 29 - Run the app and test it against the Story Outline to make sure you've completed all the steps. The code for the completed app can be found here: https://github.com/londonappbrewery/destini-challenge-completed/
