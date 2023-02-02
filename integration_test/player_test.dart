import 'package:audiobook_player/src/pages/home/view/player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:just_audio/just_audio.dart';

void main() {
  group('Player', () {
    testWidgets('check that player play and stops when clicked',
        (WidgetTester tester) async {
      // Define a Widget
      AudioPlayer testPlayer = AudioPlayer();
      var myWidget =
          MaterialApp(home: Scaffold(body: Player(innerPlayer: testPlayer)));

      // Build myWidget and trigger a frame.
      await tester.pumpWidget(myWidget);

      // Verify myWidget shows some text

      expect(find.byIcon(Icons.play_arrow), findsOneWidget); // find play button

      await tester.tap(find.byIcon(Icons.play_arrow)); // click

      await tester.pumpWidget(myWidget);

      expect(testPlayer.playing, true); // check that player is really play

      await tester.tap(find.byIcon(Icons.pause)); // click

      expect(testPlayer.playing, false); // check that player stopped
    });


    (WidgetTester tester) async {
      // *******************************CREATE PLAYER
      AudioPlayer testPlayer = AudioPlayer();
      var myWidget =
          MaterialApp(home: Scaffold(body: Player(innerPlayer: testPlayer)));

      // ********************************UPDATE WIDGETS
      await tester.pumpWidget(myWidget);

      //expect that player not playing right now

      expect(testPlayer.playing, false);

      // ********************************TEST SKIP_NEXT
      // find skip next button

      expect(find.byIcon(Icons.skip_next), findsOneWidget);

      // click next button

      await tester.tap(find.byIcon(Icons.skip_next));

      await tester.pumpWidget(myWidget);

      // check that player is play

      expect(testPlayer.playing, true);

      // pause player

      await tester.tap(find.byIcon(Icons.pause));

      // check that player stopped

      expect(testPlayer.playing, false);
      // **********************************TEST SKIP_PREVIOUS

      // find skip previous button

      expect(find.byIcon(Icons.skip_previous), findsOneWidget);

      // click next button

      await tester.tap(find.byIcon(Icons.skip_previous));

      // update

      await tester.pumpWidget(myWidget);

      expect(testPlayer.playing, true);

      // pause player

      await tester.tap(find.byIcon(Icons.pause));

      // check that player stopped

      expect(testPlayer.playing, false);
    };
  });
}
