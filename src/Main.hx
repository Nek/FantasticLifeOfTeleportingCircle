import scenes.GameOver;
import scenes.GameWon;
import scenes.Level;
import scenes.Hint;
import com.haxepunk.Engine;
import com.haxepunk.HXP;
import Types;

class Main extends Engine
{

    private var curr = 0;
    private var screens:Array<Screen>;

	override public function init()
	{
#if debug
		HXP.console.enable();
#end
        screens = [
            Hint(["01mouse", "spike"],"aumloop"),
            Level([HeadSpikes(.2,100,0)], 10), // 1
            Level([HeadSpikes(.2,150,10)], 10), // 1
            Level([HeadSpikes(.2,150,20)], 10), // 1

            Hint(["csaw"],"aumloop"),
            Level([CenterSaws(.4,100,5)],8.0), // 2
            Level([CenterSaws(.3,100,5)],8.0), // 3
            Level([SmartSaws(.3,100,10)],8.0), // 4

            Hint(["asaw"],"aumloop"),
            Level([AnnoSaws(.2,80,0)], 4.0), // 3
            Level([AnnoSaws(.15,80,0)], 4.0), // 3
            Level([AnnoSaws(.15,80,2)], 4.0), // 5

            Hint(["death"],"aumloop"),

//            Level([HeadSpikes(.2,100,0), CenterSaws(.4,100,5)], 2.0), // 5
            Level([HeadSpikes(.3,100,0), CenterSaws(.3,100,0), AnnoSaws(.3,80,0)], 2.0), // 5
            GameWon
        ];

		startScreen(screens[curr]);
	}

    public function dead() {
        HXP.scene = new GameOver();
    }

    public function nextScreen() {
        curr += 1;
        startScreen(screens[curr]);
    }


    public function cont() {
        startScreen(screens[curr]);
    }

    public function rest() {
        curr = 0;
        startScreen(screens[curr]);
    }

    public var speed = 10;

    public function startScreen(screen:Screen) {
        switch(screen) {
            case Hint(p,s): HXP.scene = new Hint(p,s);
            case Level(hazards, sp): HXP.scene = new Level(hazards, sp);
            case GameWon: HXP.scene = new GameWon();
            case GameOver: HXP.scene = new GameOver();
        }
    }

	public static function main() { new Main(); }

}