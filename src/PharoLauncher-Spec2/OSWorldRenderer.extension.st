Extension { #name : #OSWorldRenderer }

{ #category : #'*PharoLauncher-Spec2' }
OSWorldRenderer >> doActivate [

	| attributes initialExtent title |
	
	initialExtent := world worldState realWindowExtent ifNil: [976@665].

	attributes := OSWindowAttributes new.
	title := PharoLauncherApplication isDeployed 
		ifTrue: [ 'Pharo Launcher' ]
		ifFalse: [ Smalltalk image shortImageName ].
	attributes
		extent: initialExtent;
		title: title;
		windowCentered:true.

	display := Form extent: initialExtent depth: 32.
	world extent: initialExtent.

	driver := self pickMostSuitableWindowDriver.
	attributes preferableDriver: driver.
	osWindow := OSWindow createWithAttributes: attributes eventHandler: (OSWindowMorphicEventHandler for: world).
	
	driver afterMainPharoWindowCreated: osWindow.
	driver afterSetWindowTitle: Smalltalk image imageFile fullName onWindow: osWindow.
		
	osWindow focus. 
	
	world worldState doFullRepaint.
	world displayWorld.
	
	OSWindowClipboard new beDefault.
]

{ #category : #'*PharoLauncher-Spec2' }
OSWorldRenderer >> updateWindowTitle [

	"do nothing"
]
