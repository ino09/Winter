accessing
anchr2
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>

	^ self ffiCall:  #( cpVect cpPivotJointGetAnchorB( self ))