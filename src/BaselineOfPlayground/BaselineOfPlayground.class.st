Class {
	#name : #BaselineOfPlayground,
	#superclass : #BaselineOf,
	#category : #BaselineOfPlayground
}

{ #category : #loading }
BaselineOfPlayground class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'playground' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfPlayground >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'Playground'.
			spec package: 'Countries'.
			spec package: 'FrenchVerbs'
		]
]
