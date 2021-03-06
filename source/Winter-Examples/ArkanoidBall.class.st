"
I represent the ball of the Arkanoid game.

Instance variables: 

- deltaPoint

Public API and Key Messages:

- checkCollisions
- checkEndGame
- negateX
- negateY
- playCollisionSound

"
Class {
	#name : #ArkanoidBall,
	#superclass : #WinterMovableComponent,
	#instVars : [
		'deltaPoint'
	],
	#category : #'Winter-Examples-Arkanoid'
}

{ #category : #'Instance Creation' }
ArkanoidBall class >> on: aGame [

	^ self new initializeOn: aGame
]

{ #category : #Collisions }
ArkanoidBall >> checkCollisions [

	| checker |

	checker := CollisionChecker new.
	checker checkFor: self and: scene player.
	scene components
		do: [ :component | 
			component = self
				ifFalse: [ checker checkFor: self and: component ]
			].
	self checkEndGame
]

{ #category : #Collisions }
ArkanoidBall >> checkEndGame [

	self position y > game screen extentY
		ifTrue: [ game resetPlayerAndBall: self ]
]

{ #category : #Initialization }
ArkanoidBall >> initialize [

	super initialize.
	deltaPoint := 10 @ 10 negated
]

{ #category : #Initialization }
ArkanoidBall >> initializeCollisionShape [

	collisionShape := Winter2DCircle
		ofCenter: 250 @ 530
		radius: 15
		color: Color red
		in: game
]

{ #category : #Initialization }
ArkanoidBall >> initializeOn: aGame [

	game := aGame
]

{ #category : #Initialization }
ArkanoidBall >> initializeSprite [

	sprite := game assetsManagementSystem assetNamed: #ball
]

{ #category : #Updating }
ArkanoidBall >> negateX [

	deltaPoint := deltaPoint x negated @ deltaPoint y
]

{ #category : #Updating }
ArkanoidBall >> negateY [

	deltaPoint := deltaPoint x  @ deltaPoint y negated
]

{ #category : #Collisions }
ArkanoidBall >> playCollisionSound [

	(game assetsManagementSystem  assetNamed: #ballCollision) play
]

{ #category : #Reset }
ArkanoidBall >> resetPosition [

	self initialize.
	collisionShape position: 250 @ 530
]

{ #category : #Updating }
ArkanoidBall >> updateUsing: aCanvas [ 

	game playing
		ifTrue: [ 
			super updateUsing: aCanvas .
			collisionShape updatePositionBy: deltaPoint ]
]

{ #category : #Events }
ArkanoidBall >> updateUsing: aCanvas [
	game playing
		ifTrue: [ collisionShape updatePositionBy: deltaPoint.
			self checkCollisions ]
]
