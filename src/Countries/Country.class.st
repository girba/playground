Class {
	#name : #Country,
	#superclass : #Object,
	#instVars : [
		'name',
		'gdps'
	],
	#category : #Countries
}

{ #category : #accessing }
Country >> gdps: anObject [ 
	gdps := anObject 
]

{ #category : #accessing }
Country >> gtGpsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'GDPs';
		items: [ self sortedGpds ];
		column: 'Year' text: #key;
		column: 'GDP' text: #value
]

{ #category : #accessing }
Country >> name [ 
	^ name
]

{ #category : #accessing }
Country >> name: anObject [ 
	name := anObject
]

{ #category : #accessing }
Country >> sortedGpds [
	^ (gdps associations sorted: [ :a :b | a key asNumber < b key asNumber ]) collect: [:association | association key asNumber asYear -> association value ]
]
