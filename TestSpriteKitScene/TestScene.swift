//
//  TestScene.swift
//

import Foundation
import SpriteKit

class TestScene:SKScene {

    var birdNode1:SKSpriteNode!
    var birdNode2:SKSpriteNode!

    //現在シーン設定時の呼び出しメソッド
    override func didMoveToView(view: SKView) {
        
        //画面端に物理ボディを設定する。
        self.physicsBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
        
        //SKSファイルに配置した鳥ノードを取得する。
        birdNode1 = self.childNodeWithName("bird1") as! SKSpriteNode
        birdNode2 = self.childNodeWithName("bird2") as! SKSpriteNode
    }


    //画面タッチ時の呼び出しメソッド
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        //タッチした座標のノードを取得する。
        let location = touches.first!.locationInNode(self)
        let node = nodeAtPoint(location) as! SKSpriteNode
        
        //鳥ノードの場合、物理ボディを設定する。
        if(node == birdNode1 || node == birdNode2){
            node.physicsBody = SKPhysicsBody(texture: node.texture!, size:node.size)
        }
    }
}
