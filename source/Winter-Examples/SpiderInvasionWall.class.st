"
I represent a wall as an obstacle in the spider invasion scene

"
Class {
	#name : #SpiderInvasionWall,
	#superclass : #SpiderInvasionItem,
	#category : #'Winter-Examples-SpiderInvasion'
}

{ #category : #'Instance Creation' }
SpiderInvasionWall class >> inPosition: aPosition of: aSene [

	^ self new initializeInPosition: aPosition of: aSene
]

{ #category : #initialization }
SpiderInvasionWall >> initializeInPosition: aPosition of: aSene [

	scene := aSene.
	game := scene game.
	collisionShape := Winter2DSquare
		ofCenter: aPosition
		extent: self spriteSize
		color: Color black
		in: self game
]

{ #category : #initialization }
SpiderInvasionWall >> initializeSprite [

	sprite := game assetsManagementSystem  assetNamed: #wall
]
