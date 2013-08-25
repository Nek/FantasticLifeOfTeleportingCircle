package ;
enum Hazard {
    HeadSpikes(interval:Float, speed: Float, increase: Float);
}

typedef Hazards = Array<Hazard>;

enum Screen {
    Level(hazards:Hazards);
    Hint(pic:String, snd:String);
    GameWon;
  //  GameOver;
}
class Types {
    public function new() {
    }
}
