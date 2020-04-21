package;

import js.Lib;
import js.Browser.document;
import js.jquery.JQuery;
import ash.core.Entity;
import ash.core.Engine;
import ash.tools.ListIteratingSystem;
import ash.core.Node;
import whiplash.*;
import whiplash.math.*;
import whiplash.phaser.*;
import whiplash.babylon.components.*;
import whiplash.common.components.Active;

class Main extends Application {

    var scene:BABYLON.Scene;

    public function new() {
        super();
    }

    override function create():Void {

        scene = new BABYLON.Scene(whiplash.Lib.babylonEngine);
        var entity = new Entity();
        entity.add(new Transform3d());
        entity.add(new Camera(new BABYLON.FreeCamera("Camera", BABYLON.Vector3.Zero(), scene), scene));
        entity.add(new Active());
        entity.get(Transform3d).position = new BABYLON.Vector3(0, 0, -1);
        engine.addEntity(entity);
        var entity = new Entity();
        entity.add(new Light(new BABYLON.PointLight("Omni0", BABYLON.Vector3.Zero(), scene), scene));
        entity.add(new Transform3d());
        entity.get(Transform3d).position = new BABYLON.Vector3(0, 100, -100);
        engine.addEntity(entity);
    }

    override function onGuiLoaded() {
        super.onGuiLoaded();
    }

    override function update(time, delta) {
        super.update(time, delta);

        if(scene != null) {
            scene.render();
        }
    }

    static function main():Void {
        new Main();
    }
}
