/*
 * Copyright (c) 2011 Jesse Freeman
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

package com.gamecook.matchhack.activities
{
    import com.jessefreeman.factivity.managers.IActivityManager;

    import flash.display.Bitmap;
    import flash.display.SimpleButton;
    import flash.events.MouseEvent;

    import org.osmf.elements.f4mClasses.Media;

    public class NewGameActivity extends LogoActivity
    {
        [Embed(source="../../../../../build/assets/new_game_label.png")]
        private var NewGame:Class;

        [Embed(source="../../../../../build/assets/buttons/easy_up.png")]
        private var EasyUp:Class;

        [Embed(source="../../../../../build/assets/buttons/easy_over.png")]
        private var EasyOver:Class;

        [Embed(source="../../../../../build/assets/buttons/medium_up.png")]
        private var MediumUp:Class;

        [Embed(source="../../../../../build/assets/buttons/medium_over.png")]
        private var MediumOver:Class;

        [Embed(source="../../../../../build/assets/buttons/hard_up.png")]
        private var HardUp:Class;

        [Embed(source="../../../../../build/assets/buttons/hard_over.png")]
        private var HardOver:Class;

        [Embed(source="../../../../../build/assets/difficulty_levels.png")]
        private var DifficultyImage:Class;

        private const EASY:String = "easy";
        private const MEDIUM:String = "medium";
        private const HARD:String = "hard";


        public function NewGameActivity(activityManager:IActivityManager, data:*)
        {
            super(activityManager, data);
        }


        override public function onStart():void
        {
            super.onStart();

            var newGameLabel:Bitmap = addChild(new NewGame()) as Bitmap;
            newGameLabel.x = (fullSizeWidth - newGameLabel.width) * .5;
            newGameLabel.y = logo.y + logo.height + 50;

            var easyButton:SimpleButton = addChild(new SimpleButton(new EasyUp(), new EasyOver(), new EasyOver(), new EasyUp())) as SimpleButton;
            easyButton.name = EASY;
            easyButton.x = (fullSizeWidth - easyButton.width) * .5;
            easyButton.y = newGameLabel.y + newGameLabel.height + 20;
            easyButton.addEventListener(MouseEvent.MOUSE_UP, onNewGame);

            var mediumButton:SimpleButton = addChild(new SimpleButton(new MediumUp(), new MediumOver(), new MediumOver(), new MediumUp())) as SimpleButton;
            mediumButton.name = MEDIUM;
            mediumButton.x = (fullSizeWidth - mediumButton.width) * .5;
            mediumButton.y = easyButton.y + easyButton.height + 5;
            mediumButton.addEventListener(MouseEvent.MOUSE_UP, onNewGame);

            var hardButton:SimpleButton = addChild(new SimpleButton(new HardUp(), new HardOver(), new HardOver(), new HardUp())) as SimpleButton;
            hardButton.name = HARD;
            hardButton.x = (fullSizeWidth - hardButton.width) * .5;
            hardButton.y = mediumButton.y + mediumButton.height + 5;
            hardButton.addEventListener(MouseEvent.MOUSE_UP, onNewGame);

            var difficultyImage:Bitmap = addChild(new DifficultyImage()) as Bitmap;
            difficultyImage.x = (fullSizeWidth - difficultyImage.width) * .5;
            difficultyImage.y = fullSizeHeight - difficultyImage.height - 25;
        }

        private function onNewGame(event:MouseEvent):void
        {
            var difficulty:int;
            switch(event.target.name)
            {
                case EASY:
                    difficulty = 0;
                break;
                case MEDIUM:
                    difficulty = 1;
                break;
                case HARD:
                    difficulty = 2;
                break;
            }

            trace("New Game Difficulty", difficulty);

            nextActivity(GameActivity);
        }
    }
}