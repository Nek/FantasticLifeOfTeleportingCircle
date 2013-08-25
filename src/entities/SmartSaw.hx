package entities;

import flash.geom.Point;
import com.haxepunk.masks.Polygon;
import com.haxepunk.utils.Input;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;

class SmartSaw extends Entity
{
    private var speed = 250.0;
    private var target:Circle;
    private var speedX:Float;
    private var speedY:Float;

    public function new(x:Int, y:Int, speed,circle:Circle)
    {
        super(x, y);

        type = "hazard";

        this.target = circle;

        this.speed = speed;

        var img = new Image("gfx/saw.png");
        graphic = img;
        graphic.x = -img.width/2;
        graphic.y = -img.height/2;

        mask = new com.haxepunk.masks.Circle(15, Math.round(graphic.x), Math.round(graphic.y));

        var a = Math.atan2(target.y-y, target.x-x);

        speedX = speed*Math.cos(a);
        speedY = speed*Math.sin(a);

    }

    public override function update() {
        super.update();
        moveBy(speedX*HXP.elapsed, speedY*HXP.elapsed);

//        moveTowards(target.x, target.y, speed*HXP.elapsed);
    }
}