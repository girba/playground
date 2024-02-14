Class {
	#name : #Countries,
	#superclass : #Object,
	#instVars : [
		'rawData'
	],
	#category : #Countries
}

{ #category : #accessing }
Countries >> countries [
	^ rawData associations
		collect: [ :each | 
			Country new
				name: each key;
				gdps: each value ]
]

{ #category : #accessing }
Countries >> gtCountriesFor: aView [
	<gtView>
	^ aView list 
		title: 'Countries';
		items: [ self countries ];
		itemText: [ :each | each name ]
]

{ #category : #accessing }
Countries >> rawData: values [ 
	rawData := values
]
